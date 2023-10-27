// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#include "vm/compiler/assembler/assembler_base.h"

#include "platform/utils.h"
#include "vm/compiler/assembler/object_pool_builder.h"
#include "vm/compiler/backend/slot.h"
#include "vm/cpu.h"
#include "vm/flags.h"
#include "vm/heap/heap.h"
#include "vm/memory_region.h"
#include "vm/os.h"
#include "vm/zone.h"

namespace dart {

DEFINE_FLAG(bool,
            check_code_pointer,
            false,
            "Verify instructions offset in code object."
            "NOTE: This breaks the profiler.");
#if defined(TARGET_ARCH_ARM)
DEFINE_FLAG(bool, use_far_branches, false, "Enable far branches for ARM.");
#endif

namespace compiler {

AssemblerBase::~AssemblerBase() {}

void AssemblerBase::LoadFromSlot(Register dst,
                                 Register base,
                                 const Slot& slot) {
  auto const rep = slot.representation();
  const FieldAddress address(base, slot.offset_in_bytes());
  if (rep != kTagged) {
    auto const sz = RepresentationUtils::OperandSize(rep);
    return LoadFromOffset(dst, address, sz);
  }
  if (slot.is_compressed()) {
    if (slot.type().ToCid() == kSmiCid) {
      return LoadCompressedSmi(dst, address);
    } else {
      return LoadCompressedField(dst, address);
    }
  }
  return LoadField(dst, address);
}

void AssemblerBase::StoreToSlot(Register src, Register base, const Slot& slot) {
  auto const rep = slot.representation();
  const FieldAddress address(base, slot.offset_in_bytes());
  if (rep != kTagged) {
    auto const sz = RepresentationUtils::OperandSize(rep);
    return StoreToOffset(src, address, sz);
  }
  if (slot.is_compressed()) {
    return StoreCompressedIntoObject(
        base, address, src,
        slot.type().CanBeSmi() ? kValueCanBeSmi : kValueIsNotSmi);
  }
  return StoreIntoObject(
      base, address, src,
      slot.type().CanBeSmi() ? kValueCanBeSmi : kValueIsNotSmi);
}

void AssemblerBase::StoreToSlotNoBarrier(Register src,
                                         Register base,
                                         const Slot& slot) {
  auto const rep = slot.representation();
  const FieldAddress address(base, slot.offset_in_bytes());
  if (rep != kTagged) {
    auto const sz = RepresentationUtils::OperandSize(rep);
    return StoreToOffset(src, address, sz);
  }
  if (slot.is_compressed()) {
    return StoreCompressedIntoObjectNoBarrier(base, address, src);
  }
  return StoreIntoObjectNoBarrier(base, address, src);
}

void AssemblerBase::LoadTypeClassId(Register dst, Register src) {
  if (dst != src) {
    EnsureHasClassIdInDEBUG(kTypeCid, src, dst);
  } else {
#if !defined(TARGET_ARCH_IA32)
    EnsureHasClassIdInDEBUG(kTypeCid, src, TMP);
#else
    // Skip check on IA32 since we don't have TMP.
#endif
  }
  LoadFromSlot(dst, src, Slot::AbstractType_flags());
  LsrImmediate(dst, compiler::target::UntaggedType::kTypeClassIdShift);
}

void AssemblerBase::LoadAbstractTypeNullability(Register dst, Register type) {
  LoadFromSlot(dst, type, Slot::AbstractType_flags());
  AndImmediate(dst, compiler::target::UntaggedAbstractType::kNullabilityMask);
}

void AssemblerBase::CompareAbstractTypeNullabilityWith(Register type,
                                                       int8_t value,
                                                       Register scratch) {
  LoadAbstractTypeNullability(scratch, type);
  CompareImmediate(scratch, value);
}

intptr_t AssemblerBase::InsertAlignedRelocation(BSS::Relocation reloc) {
  // We cannot put a relocation at the very start (it's not a valid
  // instruction)!
  ASSERT(CodeSize() != 0);

  // Align to a target word boundary.
  const intptr_t offset =
      Utils::RoundUp(CodeSize(), compiler::target::kWordSize);

  while (CodeSize() < offset) {
    Breakpoint();
  }
  ASSERT(CodeSize() == offset);

  AssemblerBuffer::EnsureCapacity ensured(&buffer_);
  buffer_.Emit<compiler::target::word>(BSS::RelocationIndex(reloc) *
                                       compiler::target::kWordSize);

  ASSERT(CodeSize() == (offset + compiler::target::kWordSize));

  return offset;
}

#if defined(DEBUG)
static void InitializeMemoryWithBreakpoints(uword data, intptr_t length) {
#if defined(TARGET_ARCH_ARM) || defined(TARGET_ARCH_ARM64)
  ASSERT(Utils::IsAligned(data, 4));
  ASSERT(Utils::IsAligned(length, 4));
  const uword end = data + length;
  while (data < end) {
    *reinterpret_cast<int32_t*>(data) = Instr::kBreakPointInstruction;
    data += 4;
  }
#else
  memset(reinterpret_cast<void*>(data), Instr::kBreakPointInstruction, length);
#endif
}
#endif

static uword NewContents(intptr_t capacity) {
  Zone* zone = Thread::Current()->zone();
  uword result = zone->AllocUnsafe(capacity);
#if defined(DEBUG)
  // Initialize the buffer with kBreakPointInstruction to force a break
  // point if we ever execute an uninitialized part of the code buffer.
  InitializeMemoryWithBreakpoints(result, capacity);
#endif
  return result;
}

#if defined(DEBUG)
AssemblerBuffer::EnsureCapacity::EnsureCapacity(AssemblerBuffer* buffer) {
  if (buffer->cursor() >= buffer->limit()) buffer->ExtendCapacity();
  // In debug mode, we save the assembler buffer along with the gap
  // size before we start emitting to the buffer. This allows us to
  // check that any single generated instruction doesn't overflow the
  // limit implied by the minimum gap size.
  buffer_ = buffer;
  gap_ = ComputeGap();
  // Make sure that extending the capacity leaves a big enough gap
  // for any kind of instruction.
  ASSERT(gap_ >= kMinimumGap);
  // Mark the buffer as having ensured the capacity.
  ASSERT(!buffer->HasEnsuredCapacity());  // Cannot nest.
  buffer->has_ensured_capacity_ = true;
}

AssemblerBuffer::EnsureCapacity::~EnsureCapacity() {
  // Unmark the buffer, so we cannot emit after this.
  buffer_->has_ensured_capacity_ = false;
  // Make sure the generated instruction doesn't take up more
  // space than the minimum gap.
  intptr_t delta = gap_ - ComputeGap();
  ASSERT(delta <= kMinimumGap);
}
#endif

AssemblerBuffer::AssemblerBuffer()
    : pointer_offsets_(new ZoneGrowableArray<intptr_t>(16)) {
  const intptr_t kInitialBufferCapacity = 4 * KB;
  contents_ = NewContents(kInitialBufferCapacity);
  cursor_ = contents_;
  limit_ = ComputeLimit(contents_, kInitialBufferCapacity);
  fixup_ = nullptr;
#if defined(DEBUG)
  has_ensured_capacity_ = false;
  fixups_processed_ = false;
#endif

  // Verify internal state.
  ASSERT(Capacity() == kInitialBufferCapacity);
  ASSERT(Size() == 0);
}

AssemblerBuffer::~AssemblerBuffer() {}

void AssemblerBuffer::ProcessFixups(const MemoryRegion& region) {
  AssemblerFixup* fixup = fixup_;
  while (fixup != nullptr) {
    fixup->Process(region, fixup->position());
    fixup = fixup->previous();
  }
}

void AssemblerBuffer::FinalizeInstructions(const MemoryRegion& instructions) {
  // Copy the instructions from the buffer.
  MemoryRegion from(reinterpret_cast<void*>(contents()), Size());
  instructions.CopyFrom(0, from);

  // Process fixups in the instructions.
  ProcessFixups(instructions);
#if defined(DEBUG)
  fixups_processed_ = true;
#endif
}

void AssemblerBuffer::ExtendCapacity() {
  intptr_t old_size = Size();
  intptr_t old_capacity = Capacity();
  intptr_t new_capacity =
      Utils::Minimum(old_capacity * 2, old_capacity + 1 * MB);
  if (new_capacity < old_capacity) {
    FATAL("Unexpected overflow in AssemblerBuffer::ExtendCapacity");
  }

  // Allocate the new data area and copy contents of the old one to it.
  uword new_contents = NewContents(new_capacity);
  memmove(reinterpret_cast<void*>(new_contents),
          reinterpret_cast<void*>(contents_), old_size);

  // Compute the relocation delta and switch to the new contents area.
  intptr_t delta = new_contents - contents_;
  contents_ = new_contents;

  // Update the cursor and recompute the limit.
  cursor_ += delta;
  limit_ = ComputeLimit(new_contents, new_capacity);

  // Verify internal state.
  ASSERT(Capacity() == new_capacity);
  ASSERT(Size() == old_size);
}

class PatchCodeWithHandle : public AssemblerFixup {
 public:
  PatchCodeWithHandle(ZoneGrowableArray<intptr_t>* pointer_offsets,
                      const Object& object)
      : pointer_offsets_(pointer_offsets), object_(object) {}

  void Process(const MemoryRegion& region, intptr_t position) {
    // Patch the handle into the code. Once the instructions are installed into
    // a raw code object and the pointer offsets are setup, the handle is
    // resolved.
    region.StoreUnaligned<const Object*>(position, &object_);
    pointer_offsets_->Add(position);
  }

  virtual bool IsPointerOffset() const { return true; }

 private:
  ZoneGrowableArray<intptr_t>* pointer_offsets_;
  const Object& object_;
};

intptr_t AssemblerBuffer::CountPointerOffsets() const {
  intptr_t count = 0;
  AssemblerFixup* current = fixup_;
  while (current != nullptr) {
    if (current->IsPointerOffset()) ++count;
    current = current->previous_;
  }
  return count;
}

#if defined(TARGET_ARCH_IA32)
void AssemblerBuffer::EmitObject(const Object& object) {
  // Since we are going to store the handle as part of the fixup information
  // the handle needs to be a zone handle.
  DEBUG_ASSERT(IsNotTemporaryScopedHandle(object));
  ASSERT(IsInOldSpace(object));
  EmitFixup(new PatchCodeWithHandle(pointer_offsets_, object));
  cursor_ += target::kWordSize;  // Reserve space for pointer.
}
#endif

// Shared macros are implemented here.
void AssemblerBase::Unimplemented(const char* message) {
  const char* format = "Unimplemented: %s";
  const intptr_t len = Utils::SNPrint(nullptr, 0, format, message);
  char* buffer = reinterpret_cast<char*>(malloc(len + 1));
  Utils::SNPrint(buffer, len + 1, format, message);
  Stop(buffer);
}

void AssemblerBase::Untested(const char* message) {
  const char* format = "Untested: %s";
  const intptr_t len = Utils::SNPrint(nullptr, 0, format, message);
  char* buffer = reinterpret_cast<char*>(malloc(len + 1));
  Utils::SNPrint(buffer, len + 1, format, message);
  Stop(buffer);
}

void AssemblerBase::Unreachable(const char* message) {
  const char* format = "Unreachable: %s";
  const intptr_t len = Utils::SNPrint(nullptr, 0, format, message);
  char* buffer = reinterpret_cast<char*>(malloc(len + 1));
  Utils::SNPrint(buffer, len + 1, format, message);
  Stop(buffer);
}

void AssemblerBase::Comment(const char* format, ...) {
  if (EmittingComments()) {
    char buffer[1024];

    va_list args;
    va_start(args, format);
    Utils::VSNPrint(buffer, sizeof(buffer), format, args);
    va_end(args);

    comments_.Add(
        new CodeComment(buffer_.GetPosition(), AllocateString(buffer)));
  }
}

bool AssemblerBase::EmittingComments() {
  return FLAG_code_comments || FLAG_disassemble || FLAG_disassemble_optimized ||
         FLAG_disassemble_stubs;
}

void AssemblerBase::Stop(const char* message) {
  Comment("Stop: %s", message);
  Breakpoint();
}

uword ObjIndexPair::Hash(Key key) {
  switch (key.type()) {
    case ObjectPoolBuilderEntry::kImmediate128:
      return key.imm128_.int_storage[0] ^ key.imm128_.int_storage[1] ^
             key.imm128_.int_storage[2] ^ key.imm128_.int_storage[3];

#if defined(TARGET_ARCH_IS_32_BIT)
    case ObjectPoolBuilderEntry::kImmediate64:
      return key.imm64_;
#endif
    case ObjectPoolBuilderEntry::kImmediate:
    case ObjectPoolBuilderEntry::kNativeFunction:
      return key.imm_;
    case ObjectPoolBuilderEntry::kTaggedObject:
      return ObjectHash(*key.obj_);
  }

  UNREACHABLE();
}

void ObjectPoolBuilder::Reset() {
  // Null out the handles we've accumulated.
  for (intptr_t i = 0; i < object_pool_.length(); ++i) {
    if (object_pool_[i].type() == ObjectPoolBuilderEntry::kTaggedObject) {
      SetToNull(const_cast<Object*>(object_pool_[i].obj_));
      SetToNull(const_cast<Object*>(object_pool_[i].equivalence_));
    }
  }

  object_pool_.Clear();
  object_pool_index_table_.Clear();
}

intptr_t ObjectPoolBuilder::AddObject(
    const Object& obj,
    ObjectPoolBuilderEntry::Patchability patchable,
    ObjectPoolBuilderEntry::SnapshotBehavior snapshot_behavior) {
  DEBUG_ASSERT(IsNotTemporaryScopedHandle(obj));
  return AddObject(ObjectPoolBuilderEntry(&obj, patchable, snapshot_behavior));
}

intptr_t ObjectPoolBuilder::AddImmediate(
    uword imm,
    ObjectPoolBuilderEntry::Patchability patchable,
    ObjectPoolBuilderEntry::SnapshotBehavior snapshotability) {
  return AddObject(ObjectPoolBuilderEntry(
      imm, ObjectPoolBuilderEntry::kImmediate, patchable, snapshotability));
}

intptr_t ObjectPoolBuilder::AddImmediate64(uint64_t imm) {
#if defined(TARGET_ARCH_IS_32_BIT)
  return AddObject(
      ObjectPoolBuilderEntry(imm, ObjectPoolBuilderEntry::kImmediate64,
                             ObjectPoolBuilderEntry::kNotPatchable));
#else
  return AddImmediate(imm);
#endif
}

intptr_t ObjectPoolBuilder::AddImmediate128(simd128_value_t imm) {
  return AddObject(
      ObjectPoolBuilderEntry(imm, ObjectPoolBuilderEntry::kImmediate128,
                             ObjectPoolBuilderEntry::kNotPatchable));
}

intptr_t ObjectPoolBuilder::AddObject(ObjectPoolBuilderEntry entry) {
  DEBUG_ASSERT((entry.type() != ObjectPoolBuilderEntry::kTaggedObject) ||
               (IsNotTemporaryScopedHandle(*entry.obj_) &&
                (entry.equivalence_ == nullptr ||
                 IsNotTemporaryScopedHandle(*entry.equivalence_))));

  if (entry.type() == ObjectPoolBuilderEntry::kTaggedObject) {
    // If the owner of the object pool wrapper specified a specific zone we
    // should use we'll do so.
    if (zone_ != nullptr) {
      entry.obj_ = &NewZoneHandle(zone_, *entry.obj_);
      if (entry.equivalence_ != nullptr) {
        entry.equivalence_ = &NewZoneHandle(zone_, *entry.equivalence_);
      }
    }
  }

#if defined(TARGET_ARCH_IS_32_BIT)
  if (entry.type() == ObjectPoolBuilderEntry::kImmediate64) {
    ASSERT(entry.patchable() == ObjectPoolBuilderEntry::kNotPatchable);
    uint64_t imm = entry.imm64_;
    intptr_t idx = AddImmediate(Utils::Low32Bits(imm));
    AddImmediate(Utils::High32Bits(imm));
    object_pool_index_table_.Insert(ObjIndexPair(entry, idx));
    return idx;
  }
  if (entry.type() == ObjectPoolBuilderEntry::kImmediate128) {
    ASSERT(entry.patchable() == ObjectPoolBuilderEntry::kNotPatchable);
    intptr_t idx = AddImmediate(entry.imm128_.int_storage[0]);
    AddImmediate(entry.imm128_.int_storage[1]);
    AddImmediate(entry.imm128_.int_storage[2]);
    AddImmediate(entry.imm128_.int_storage[3]);
    object_pool_index_table_.Insert(ObjIndexPair(entry, idx));
    return idx;
  }
#else
  if (entry.type() == ObjectPoolBuilderEntry::kImmediate128) {
    ASSERT(entry.patchable() == ObjectPoolBuilderEntry::kNotPatchable);
    uword lo64 = static_cast<uword>(entry.imm128_.int_storage[0]) |
                 (static_cast<uword>(entry.imm128_.int_storage[1]) << 32);
    uword hi64 = static_cast<uword>(entry.imm128_.int_storage[2]) |
                 (static_cast<uword>(entry.imm128_.int_storage[3]) << 32);
    intptr_t idx = AddImmediate(lo64);
    AddImmediate(hi64);
    object_pool_index_table_.Insert(ObjIndexPair(entry, idx));
    return idx;
  }
#endif

  const intptr_t idx = base_index_ + object_pool_.length();
  object_pool_.Add(entry);
  if (entry.patchable() == ObjectPoolBuilderEntry::kNotPatchable) {
    // The object isn't patchable. Record the index for fast lookup.
    object_pool_index_table_.Insert(ObjIndexPair(entry, idx));
  }
  return idx;
}

intptr_t ObjectPoolBuilder::FindObject(ObjectPoolBuilderEntry entry) {
  // If the object is not patchable, check if we've already got it in the
  // object pool.
  if (entry.patchable() == ObjectPoolBuilderEntry::kNotPatchable) {
    // First check in the parent pool if we have one.
    if (parent_ != nullptr) {
      const intptr_t idx = parent_->object_pool_index_table_.LookupValue(entry);
      if (idx != ObjIndexPair::kNoIndex) {
        used_from_parent_.Add(idx);
        return idx;
      }
    }

    const intptr_t idx = object_pool_index_table_.LookupValue(entry);
    if (idx != ObjIndexPair::kNoIndex) {
      return idx;
    }
  }
  return AddObject(entry);
}

intptr_t ObjectPoolBuilder::FindObject(
    const Object& obj,
    ObjectPoolBuilderEntry::Patchability patchable,
    ObjectPoolBuilderEntry::SnapshotBehavior snapshot_behavior) {
  return FindObject(ObjectPoolBuilderEntry(&obj, patchable, snapshot_behavior));
}

intptr_t ObjectPoolBuilder::FindObject(const Object& obj,
                                       const Object& equivalence) {
  return FindObject(ObjectPoolBuilderEntry(
      &obj, &equivalence, ObjectPoolBuilderEntry::kNotPatchable));
}

intptr_t ObjectPoolBuilder::FindImmediate(uword imm) {
  return FindObject(
      ObjectPoolBuilderEntry(imm, ObjectPoolBuilderEntry::kImmediate,
                             ObjectPoolBuilderEntry::kNotPatchable));
}

intptr_t ObjectPoolBuilder::FindImmediate64(uint64_t imm) {
#if defined(TARGET_ARCH_IS_32_BIT)
  return FindObject(
      ObjectPoolBuilderEntry(imm, ObjectPoolBuilderEntry::kImmediate64,
                             ObjectPoolBuilderEntry::kNotPatchable));
#else
  return FindImmediate(imm);
#endif
}

intptr_t ObjectPoolBuilder::FindImmediate128(simd128_value_t imm) {
  return FindObject(
      ObjectPoolBuilderEntry(imm, ObjectPoolBuilderEntry::kImmediate128,
                             ObjectPoolBuilderEntry::kNotPatchable));
}

intptr_t ObjectPoolBuilder::FindNativeFunction(
    const ExternalLabel* label,
    ObjectPoolBuilderEntry::Patchability patchable) {
  return FindObject(ObjectPoolBuilderEntry(
      label->address(), ObjectPoolBuilderEntry::kNativeFunction, patchable));
}

bool ObjectPoolBuilder::TryCommitToParent() {
  ASSERT(parent_ != nullptr);
  if (parent_->CurrentLength() != base_index_) {
    return false;
  }
  for (intptr_t i = 0; i < object_pool_.length(); i++) {
    intptr_t idx = parent_->AddObject(object_pool_[i]);
    ASSERT(idx == (base_index_ + i));
  }
  return true;
}

}  // namespace compiler

}  // namespace dart
