// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#if !defined(DART_PRECOMPILED_RUNTIME)

#include "vm/kernel.h"

#include "vm/bit_vector.h"
#include "vm/compiler/frontend/constant_reader.h"
#include "vm/compiler/frontend/kernel_translation_helper.h"
#include "vm/compiler/jit/compiler.h"
#include "vm/longjump.h"
#include "vm/object_store.h"
#include "vm/parser.h"  // For Parser::kParameter* constants.
#include "vm/stack_frame.h"


namespace dart {
namespace kernel {

KernelLineStartsReader::KernelLineStartsReader(
    const dart::TypedData& line_starts_data,
    dart::Zone* zone)
    : line_starts_data_(line_starts_data) {
  TypedDataElementType type = line_starts_data_.ElementType();
  if (type == kUint16ArrayElement) {
    helper_ = new KernelUint16LineStartsHelper();
  } else if (type == kUint32ArrayElement) {
    helper_ = new KernelUint32LineStartsHelper();
  } else {
    UNREACHABLE();
  }
}

uint32_t KernelLineStartsReader::MaxPosition() const {
  const intptr_t line_count = line_starts_data_.Length();
  if (line_count == 0) {
    return 0;
  }
  return helper_->At(line_starts_data_, line_count - 1);
}

bool KernelLineStartsReader::LocationForPosition(intptr_t position,
                                                 intptr_t* line,
                                                 intptr_t* col) const {
  const intptr_t line_count = line_starts_data_.Length();
  if (position < 0 || static_cast<uint32_t>(position) > MaxPosition() ||
      line_count == 0) {
    return false;
  }

  intptr_t lo = 0;
  intptr_t hi = line_count;
  while (hi > lo + 1) {
    const intptr_t mid = lo + (hi - lo) / 2;
    const intptr_t mid_position = helper_->At(line_starts_data_, mid);
    if (mid_position > position) {
      hi = mid;
    } else {
      lo = mid;
    }
  }
  *line = lo + 1;
  if (col != nullptr) {
    *col = position - helper_->At(line_starts_data_, lo) + 1;
  }

  return true;
}

bool KernelLineStartsReader::TokenRangeAtLine(
    intptr_t line_number,
    TokenPosition* first_token_index,
    TokenPosition* last_token_index) const {
  const intptr_t line_count = line_starts_data_.Length();
  if (line_number <= 0 || line_number > line_count) {
    return false;
  }
  *first_token_index = dart::TokenPosition::Deserialize(
      helper_->At(line_starts_data_, line_number - 1));
  if (line_number == line_count) {
    *last_token_index = *first_token_index;
  } else {
    *last_token_index = dart::TokenPosition::Deserialize(
        helper_->At(line_starts_data_, line_number) - 1);
  }
  return true;
}

uint32_t KernelLineStartsReader::KernelUint16LineStartsHelper::At(
    const dart::TypedData& data,
    intptr_t index) const {
  return data.GetUint16(index << 1);
}

uint32_t KernelLineStartsReader::KernelUint32LineStartsHelper::At(
    const dart::TypedData& data,
    intptr_t index) const {
  return data.GetUint32(index << 2);
}

class KernelTokenPositionCollector : public KernelReaderHelper {
 public:
  KernelTokenPositionCollector(
      Zone* zone,
      TranslationHelper* translation_helper,
      const Script& script,
      const TypedDataView& data,
      intptr_t data_program_offset,
      intptr_t initial_script_index,
      intptr_t record_for_script_id,
      GrowableArray<intptr_t>* record_token_positions_into)
      : KernelReaderHelper(zone, translation_helper, data, data_program_offset),
        current_script_id_(initial_script_index),
        record_for_script_id_(record_for_script_id),
        record_token_positions_into_(record_token_positions_into) {}

  void CollectTokenPositions(intptr_t kernel_offset);

  void RecordTokenPosition(TokenPosition position) override;

  void set_current_script_id(intptr_t id) override { current_script_id_ = id; }

 private:
  intptr_t current_script_id_;
  intptr_t record_for_script_id_;
  GrowableArray<intptr_t>* record_token_positions_into_;

  DISALLOW_COPY_AND_ASSIGN(KernelTokenPositionCollector);
};

void KernelTokenPositionCollector::CollectTokenPositions(
    intptr_t kernel_offset) {
  SetOffset(kernel_offset);

  const Tag tag = PeekTag();
  if (tag == kProcedure) {
    ProcedureHelper procedure_helper(this);
    procedure_helper.ReadUntilExcluding(ProcedureHelper::kEnd);
  } else if (tag == kConstructor) {
    ConstructorHelper constructor_helper(this);
    constructor_helper.ReadUntilExcluding(ConstructorHelper::kEnd);
  } else if (tag == kFunctionNode) {
    FunctionNodeHelper function_node_helper(this);
    function_node_helper.ReadUntilExcluding(FunctionNodeHelper::kEnd);
  } else if (tag == kField) {
    FieldHelper field_helper(this);
    field_helper.ReadUntilExcluding(FieldHelper::kEnd);
  } else if (tag == kClass) {
    ClassHelper class_helper(this);
    class_helper.ReadUntilExcluding(ClassHelper::kEnd);
  } else {
    ReportUnexpectedTag("a class or a member", tag);
    UNREACHABLE();
  }
}

void KernelTokenPositionCollector::RecordTokenPosition(TokenPosition position) {
  if (record_for_script_id_ == current_script_id_ &&
      record_token_positions_into_ != nullptr && position.IsReal()) {
    record_token_positions_into_->Add(position.Serialize());
  }
}

static int LowestFirst(const intptr_t* a, const intptr_t* b) {
  return *a - *b;
}

/**
 * If index exists as sublist in list, sort the sublist from lowest to highest,
 * then copy it, as Smis and without duplicates,
 * to a new Array in Heap::kOld which is returned.
 * Note that the source list is both sorted and de-duplicated as well, but will
 * possibly contain duplicate and unsorted data at the end.
 * Otherwise (when sublist doesn't exist in list) return new empty array.
 */
static ArrayPtr AsSortedDuplicateFreeArray(GrowableArray<intptr_t>* source) {
  intptr_t size = source->length();
  if (size == 0) {
    return Object::empty_array().ptr();
  }

  source->Sort(LowestFirst);

  intptr_t last = 0;
  for (intptr_t current = 1; current < size; ++current) {
    if (source->At(last) != source->At(current)) {
      (*source)[++last] = source->At(current);
    }
  }
  Array& array_object = Array::Handle();
  array_object = Array::New(last + 1, Heap::kOld);
  Smi& smi_value = Smi::Handle();
  for (intptr_t i = 0; i <= last; ++i) {
    smi_value = Smi::New(source->At(i));
    array_object.SetAt(i, smi_value);
  }
  return array_object.ptr();
}

static void CollectKernelLibraryTokenPositions(
    const TypedDataView& kernel_data,
    const Script& script,
    intptr_t kernel_offset,
    intptr_t data_kernel_offset,
    Zone* zone,
    TranslationHelper* helper,
    GrowableArray<intptr_t>* token_positions) {
  if (kernel_data.IsNull()) {
    return;
  }

  KernelTokenPositionCollector token_position_collector(
      zone, helper, script, kernel_data, data_kernel_offset,
      script.kernel_script_index(), script.kernel_script_index(),
      token_positions);

  token_position_collector.CollectTokenPositions(kernel_offset);
}

}  // namespace kernel

void Script::CollectTokenPositionsFor() const {
  Thread* thread = Thread::Current();
  Zone* zone = thread->zone();

  const auto& kernel_info =
      KernelProgramInfo::Handle(zone, kernel_program_info());

  kernel::TranslationHelper helper(thread);
  helper.InitFromKernelProgramInfo(kernel_info);

  GrowableArray<intptr_t> token_positions(10);

  auto isolate_group = thread->isolate_group();
  const GrowableObjectArray& libs = GrowableObjectArray::Handle(
      zone, isolate_group->object_store()->libraries());
  Library& lib = Library::Handle(zone);
  Object& entry = Object::Handle(zone);
  Script& entry_script = Script::Handle(zone);
  auto& data = TypedDataView::Handle(zone);

  auto& interesting_script = *this;

  auto& temp_array = Array::Handle(zone);
  auto& temp_field = Field::Handle(zone);
  auto& temp_function = Function::Handle(zone);
  for (intptr_t i = 0; i < libs.Length(); i++) {
    lib ^= libs.At(i);
    lib.EnsureTopLevelClassIsFinalized();
    DictionaryIterator it(lib);
    while (it.HasNext()) {
      entry = it.GetNext();
      data = TypedDataView::null();
      if (entry.IsClass()) {
        const Class& klass = Class::Cast(entry);
        if (klass.script() == interesting_script.ptr()) {
          token_positions.Add(klass.token_pos().Serialize());
          token_positions.Add(klass.end_token_pos().Serialize());
        }
        if (klass.is_finalized()) {
          temp_array = klass.fields();
          for (intptr_t i = 0; i < temp_array.Length(); ++i) {
            temp_field ^= temp_array.At(i);
            if (temp_field.kernel_offset() <= 0) {
              // Skip artificially injected fields.
              continue;
            }
            entry_script = temp_field.Script();
            if (entry_script.ptr() != interesting_script.ptr()) {
              continue;
            }
            data = temp_field.KernelLibrary();
            CollectKernelLibraryTokenPositions(data, interesting_script,
                                               temp_field.kernel_offset(),
                                               temp_field.KernelLibraryOffset(),
                                               zone, &helper, &token_positions);
          }
          temp_array = klass.current_functions();
          for (intptr_t i = 0; i < temp_array.Length(); ++i) {
            temp_function ^= temp_array.At(i);
            entry_script = temp_function.script();
            if (entry_script.ptr() != interesting_script.ptr()) {
              continue;
            }
            data = temp_function.KernelLibrary();
            CollectKernelLibraryTokenPositions(
                data, interesting_script, temp_function.kernel_offset(),
                temp_function.KernelLibraryOffset(), zone, &helper,
                &token_positions);
          }
        } else {
          // Class isn't finalized yet: read the data attached to it.
          ASSERT(klass.kernel_offset() > 0);
          data = lib.KernelLibrary();
          ASSERT(!data.IsNull());
          const intptr_t library_kernel_offset = lib.KernelLibraryOffset();
          ASSERT(library_kernel_offset > 0);
          const intptr_t class_offset = klass.kernel_offset();

          entry_script = klass.script();
          if (entry_script.ptr() != interesting_script.ptr()) {
            continue;
          }
          CollectKernelLibraryTokenPositions(
              data, interesting_script, class_offset, library_kernel_offset,
              zone, &helper, &token_positions);
        }
      } else if (entry.IsFunction()) {
        temp_function ^= entry.ptr();
        entry_script = temp_function.script();
        if (entry_script.ptr() != interesting_script.ptr()) {
          continue;
        }
        data = temp_function.KernelLibrary();
        CollectKernelLibraryTokenPositions(data, interesting_script,
                                           temp_function.kernel_offset(),
                                           temp_function.KernelLibraryOffset(),
                                           zone, &helper, &token_positions);
      } else if (entry.IsField()) {
        const Field& field = Field::Cast(entry);
        if (field.kernel_offset() <= 0) {
          // Skip artificially injected fields.
          continue;
        }
        entry_script = field.Script();
        if (entry_script.ptr() != interesting_script.ptr()) {
          continue;
        }
        data = field.KernelLibrary();
        CollectKernelLibraryTokenPositions(
            data, interesting_script, field.kernel_offset(),
            field.KernelLibraryOffset(), zone, &helper, &token_positions);
      }
    }
  }

  Script& script = Script::Handle(zone, interesting_script.ptr());
  Array& array_object = Array::Handle(zone);
  array_object = kernel::AsSortedDuplicateFreeArray(&token_positions);
  script.set_debug_positions(array_object);
}

#if !defined(PRODUCT) && !defined(DART_PRECOMPILED_RUNTIME)
ArrayPtr Script::CollectConstConstructorCoverageFrom() const {
  Thread* thread = Thread::Current();
  Zone* zone = thread->zone();
  kernel::TranslationHelper helper(thread);

  const auto& interesting_script = *this;

  const auto& kernel_info =
      KernelProgramInfo::Handle(zone, kernel_program_info());
  helper.InitFromKernelProgramInfo(kernel_info);

  const auto& data =
      TypedDataView::Handle(zone, interesting_script.constant_coverage());

  kernel::KernelReaderHelper kernel_reader(zone, &helper, data, 0);

  // Read "constant coverage constructors".
  const intptr_t constant_coverage_constructors =
      kernel_reader.ReadListLength();
  const Array& constructors =
      Array::Handle(Array::New(constant_coverage_constructors));
  for (intptr_t i = 0; i < constant_coverage_constructors; ++i) {
    kernel::NameIndex kernel_name = kernel_reader.ReadCanonicalNameReference();
    Class& klass = Class::ZoneHandle(
        zone,
        helper.LookupClassByKernelClass(helper.EnclosingName(kernel_name)));
    const Function& target = Function::ZoneHandle(
        zone, helper.LookupConstructorByKernelConstructor(klass, kernel_name));
    constructors.SetAt(i, target);
  }
  return constructors.ptr();
}
#endif  // !defined(PRODUCT) && !defined(DART_PRECOMPILED_RUNTIME)

namespace kernel {

ObjectPtr EvaluateStaticConstFieldInitializer(const Field& field) {
  ASSERT(field.is_static() && field.is_const());

  LongJumpScope jump;
  if (setjmp(*jump.Set()) == 0) {
    Thread* thread = Thread::Current();
    Zone* zone = thread->zone();
    TranslationHelper helper(thread);
    auto& kernel_program_info =
        KernelProgramInfo::Handle(zone, field.KernelProgramInfo());
    helper.InitFromKernelProgramInfo(kernel_program_info);

    const Class& owner_class = Class::Handle(zone, field.Owner());
    ActiveClass active_class;
    ActiveClassScope active_class_scope(&active_class, &owner_class);

    KernelReaderHelper kernel_reader(
        zone, &helper, TypedDataView::Handle(zone, field.KernelLibrary()),
        field.KernelLibraryOffset());
    kernel_reader.SetOffset(field.kernel_offset());
    ConstantReader constant_reader(&kernel_reader, &active_class);

    FieldHelper field_helper(&kernel_reader);
    field_helper.ReadUntilExcluding(FieldHelper::kInitializer);
    ASSERT(field_helper.IsConst());

    return constant_reader.ReadConstantInitializer();
  } else {
    return Thread::Current()->StealStickyError();
  }
}

class MetadataEvaluator : public KernelReaderHelper {
 public:
  MetadataEvaluator(Zone* zone,
                    TranslationHelper* translation_helper,
                    const TypedDataView& data,
                    intptr_t data_program_offset,
                    ActiveClass* active_class)
      : KernelReaderHelper(zone, translation_helper, data, data_program_offset),
        constant_reader_(this, active_class) {}

  ObjectPtr EvaluateMetadata(intptr_t kernel_offset,
                             bool is_annotations_offset) {
    SetOffset(kernel_offset);

    // Library and LibraryDependency objects do not have a tag in kernel binary.
    // Synthetic metadata fields corresponding to these objects keep kernel
    // offset of annotations list instead of annotated object.
    if (!is_annotations_offset) {
      const Tag tag = PeekTag();

      if (tag == kClass) {
        ClassHelper class_helper(this);
        class_helper.ReadUntilExcluding(ClassHelper::kAnnotations);
      } else if (tag == kProcedure) {
        ProcedureHelper procedure_helper(this);
        procedure_helper.ReadUntilExcluding(ProcedureHelper::kAnnotations);
      } else if (tag == kField) {
        FieldHelper field_helper(this);
        field_helper.ReadUntilExcluding(FieldHelper::kAnnotations);
      } else if (tag == kConstructor) {
        ConstructorHelper constructor_helper(this);
        constructor_helper.ReadUntilExcluding(ConstructorHelper::kAnnotations);
      } else if (tag == kFunctionDeclaration) {
        ReadTag();
        ReadPosition();  // fileOffset
        VariableDeclarationHelper variable_declaration_helper(this);
        variable_declaration_helper.ReadUntilExcluding(
            VariableDeclarationHelper::kAnnotations);
      } else {
        FATAL("No support for metadata on this type of kernel node: %" Pd32
              "\n",
              tag);
      }
    }

    return constant_reader_.ReadAnnotations();
  }

 private:
  ConstantReader constant_reader_;

  DISALLOW_COPY_AND_ASSIGN(MetadataEvaluator);
};

ObjectPtr EvaluateMetadata(const Library& library,
                           intptr_t kernel_offset,
                           bool is_annotations_offset) {
  LongJumpScope jump;
  if (setjmp(*jump.Set()) == 0) {
    Thread* thread = Thread::Current();
    Zone* zone = thread->zone();
    TranslationHelper helper(thread);
    const auto& kernel_info =
        KernelProgramInfo::Handle(zone, library.kernel_program_info());
    helper.InitFromKernelProgramInfo(kernel_info);

    const Class& owner_class = Class::Handle(zone, library.toplevel_class());
    ActiveClass active_class;
    ActiveClassScope active_class_scope(&active_class, &owner_class);

    MetadataEvaluator metadata_evaluator(
        zone, &helper, TypedDataView::Handle(zone, library.KernelLibrary()),
        library.KernelLibraryOffset(), &active_class);

    return metadata_evaluator.EvaluateMetadata(kernel_offset,
                                               is_annotations_offset);

  } else {
    return Thread::Current()->StealStickyError();
  }
}

class ParameterDescriptorBuilder : public KernelReaderHelper {
 public:
  ParameterDescriptorBuilder(TranslationHelper* translation_helper,
                             Zone* zone,
                             const TypedDataView& data,
                             intptr_t data_program_offset,
                             ActiveClass* active_class)
      : KernelReaderHelper(zone, translation_helper, data, data_program_offset),
        constant_reader_(this, active_class) {}

  ObjectPtr BuildParameterDescriptor(const Function& function);

 private:
  ConstantReader constant_reader_;

  DISALLOW_COPY_AND_ASSIGN(ParameterDescriptorBuilder);
};

ObjectPtr ParameterDescriptorBuilder::BuildParameterDescriptor(
    const Function& function) {
  SetOffset(function.kernel_offset());
  ReadUntilFunctionNode();
  FunctionNodeHelper function_node_helper(this);
  function_node_helper.ReadUntilExcluding(
      FunctionNodeHelper::kPositionalParameters);
  intptr_t param_count = function_node_helper.total_parameter_count_;
  intptr_t positional_count = ReadListLength();  // read list length.
  intptr_t named_parameter_count = param_count - positional_count;

  const Array& param_descriptor = Array::Handle(
      Array::New(param_count * Parser::kParameterEntrySize, Heap::kOld));
  for (intptr_t i = 0; i < param_count; ++i) {
    const intptr_t entry_start = i * Parser::kParameterEntrySize;

    if (i == positional_count) {
      intptr_t named_parameter_count_check =
          ReadListLength();  // read list length.
      ASSERT(named_parameter_count_check == named_parameter_count);
    }

    // Read ith variable declaration.
    intptr_t param_kernel_offset = reader_.offset();
    VariableDeclarationHelper helper(this);
    helper.ReadUntilExcluding(VariableDeclarationHelper::kInitializer);
    param_descriptor.SetAt(entry_start + Parser::kParameterIsFinalOffset,
                           helper.IsFinal() ? Bool::True() : Bool::False());

    Tag tag = ReadTag();  // read (first part of) initializer.
    if ((tag == kSomething) && !function.is_abstract()) {
      // This will read the initializer.
      Instance& constant = Instance::ZoneHandle(
          zone_, constant_reader_.ReadConstantExpression());
      param_descriptor.SetAt(entry_start + Parser::kParameterDefaultValueOffset,
                             constant);
    } else {
      if (tag == kSomething) {
        SkipExpression();  // Skip initializer.
      }
      param_descriptor.SetAt(entry_start + Parser::kParameterDefaultValueOffset,
                             Object::null_instance());
    }

    if (FLAG_enable_mirrors && (helper.annotation_count_ > 0)) {
      AlternativeReadingScope alt(&reader_, param_kernel_offset);
      VariableDeclarationHelper helper(this);
      helper.ReadUntilExcluding(VariableDeclarationHelper::kAnnotations);
      Object& metadata =
          Object::ZoneHandle(zone_, constant_reader_.ReadAnnotations());
      param_descriptor.SetAt(entry_start + Parser::kParameterMetadataOffset,
                             metadata);
    } else {
      param_descriptor.SetAt(entry_start + Parser::kParameterMetadataOffset,
                             Object::null_instance());
    }
  }
  return param_descriptor.ptr();
}

ObjectPtr BuildParameterDescriptor(const Function& function) {
  LongJumpScope jump;
  if (setjmp(*jump.Set()) == 0) {
    Thread* thread = Thread::Current();
    Zone* zone = thread->zone();

    const auto& kernel_info =
        KernelProgramInfo::Handle(zone, function.KernelProgramInfo());

    TranslationHelper helper(thread);
    helper.InitFromKernelProgramInfo(kernel_info);

    const Class& owner_class = Class::Handle(zone, function.Owner());
    ActiveClass active_class;
    ActiveClassScope active_class_scope(&active_class, &owner_class);

    ParameterDescriptorBuilder builder(
        &helper, zone, TypedDataView::Handle(zone, function.KernelLibrary()),
        function.KernelLibraryOffset(), &active_class);

    return builder.BuildParameterDescriptor(function);
  } else {
    return Thread::Current()->StealStickyError();
  }
}

void ReadParameterCovariance(const Function& function,
                             BitVector* is_covariant,
                             BitVector* is_generic_covariant_impl) {
  Thread* thread = Thread::Current();
  Zone* zone = thread->zone();

  const intptr_t num_params = function.NumParameters();
  ASSERT(is_covariant->length() == num_params);
  ASSERT(is_generic_covariant_impl->length() == num_params);

  const auto& kernel_info =
      KernelProgramInfo::Handle(zone, function.KernelProgramInfo());

  TranslationHelper translation_helper(thread);
  translation_helper.InitFromKernelProgramInfo(kernel_info);

  KernelReaderHelper reader_helper(
      zone, &translation_helper,
      TypedDataView::Handle(zone, function.KernelLibrary()),
      function.KernelLibraryOffset());

  reader_helper.SetOffset(function.kernel_offset());
  reader_helper.ReadUntilFunctionNode();

  FunctionNodeHelper function_node_helper(&reader_helper);
  function_node_helper.ReadUntilExcluding(
      FunctionNodeHelper::kPositionalParameters);

  // Positional.
  const intptr_t num_positional_params = reader_helper.ReadListLength();
  intptr_t param_index = function.NumImplicitParameters();
  for (intptr_t i = 0; i < num_positional_params; ++i, ++param_index) {
    VariableDeclarationHelper helper(&reader_helper);
    helper.ReadUntilExcluding(VariableDeclarationHelper::kEnd);

    if (helper.IsCovariant()) {
      is_covariant->Add(param_index);
    }
    if (helper.IsGenericCovariantImpl()) {
      is_generic_covariant_impl->Add(param_index);
    }
  }

  // Named.
  const intptr_t num_named_params = reader_helper.ReadListLength();
  for (intptr_t i = 0; i < num_named_params; ++i, ++param_index) {
    VariableDeclarationHelper helper(&reader_helper);
    helper.ReadUntilExcluding(VariableDeclarationHelper::kEnd);

    if (helper.IsCovariant()) {
      is_covariant->Add(param_index);
    }
    if (helper.IsGenericCovariantImpl()) {
      is_generic_covariant_impl->Add(param_index);
    }
  }
}

bool NeedsDynamicInvocationForwarder(const Function& function) {
  Zone* zone = Thread::Current()->zone();

  // Right now closures do not need a dyn:* forwarder.
  // See https://github.com/dart-lang/sdk/issues/40813
  if (function.IsClosureFunction()) return false;

  // Method extractors have no parameters to check and return value is a closure
  // and therefore not an unboxed primitive type.
  if (function.IsMethodExtractor()) {
    return false;
  }

  // Record field getters have no parameters to check and 'dynamic' return type.
  if (function.IsRecordFieldGetter()) {
    return false;
  }

  // Invoke field dispatchers are dynamically generated, will invoke a getter to
  // obtain the field value and then invoke ".call()" on the result.
  // Those dynamically generated dispathers don't have proper kernel metadata
  // associated with them - we can therefore not query if there are dynamic
  // calls to them or not and are therefore conservative.
  if (function.IsInvokeFieldDispatcher()) {
    return true;
  }

  // The dyn:* forwarders perform unboxing of parameters before calling the
  // actual target (which accepts unboxed parameters) and boxes return values
  // of the return value.
  if (function.HasUnboxedParameters() || function.HasUnboxedReturnValue()) {
    return true;
  }

  if (function.CanUseRegisterCallingConvention(zone)) {
    return true;
  }

  // There are no parameters to type check for getters and if the return value
  // is boxed, then the dyn:* forwarder is not needed.
  if (function.IsImplicitGetterFunction()) {
    return false;
  }

  // Covariant parameters (both explicitly covariant and generic-covariant-impl)
  // are checked in the body of a function and therefore don't need checks in a
  // dynamic invocation forwarder. So dynamic invocation forwarder is only
  // needed if there are non-covariant parameters of non-top type.
  if (function.IsImplicitSetterFunction()) {
    const auto& field = Field::Handle(zone, function.accessor_field());
    return !(field.is_covariant() || field.is_generic_covariant_impl());
  }

  const auto& type_params =
      TypeParameters::Handle(zone, function.type_parameters());
  if (!type_params.IsNull()) {
    auto& bound = AbstractType::Handle(zone);
    for (intptr_t i = 0, n = type_params.Length(); i < n; ++i) {
      bound = type_params.BoundAt(i);
      if (!bound.IsTopTypeForSubtyping() &&
          !type_params.IsGenericCovariantImplAt(i)) {
        return true;
      }
    }
  }

  const intptr_t num_params = function.NumParameters();
  BitVector is_covariant(zone, num_params);
  BitVector is_generic_covariant_impl(zone, num_params);
  ReadParameterCovariance(function, &is_covariant, &is_generic_covariant_impl);

  auto& type = AbstractType::Handle(zone);
  for (intptr_t i = function.NumImplicitParameters(); i < num_params; ++i) {
    type = function.ParameterTypeAt(i);
    if (!type.IsTopTypeForSubtyping() &&
        !is_generic_covariant_impl.Contains(i) && !is_covariant.Contains(i)) {
      return true;
    }
  }

  return false;
}

static ProcedureAttributesMetadata ProcedureAttributesOf(
    Zone* zone,
    const KernelProgramInfo& kernel_program_info,
    const TypedDataView& kernel_data,
    intptr_t kernel_data_program_offset,
    intptr_t kernel_offset) {
  TranslationHelper translation_helper(Thread::Current());
  translation_helper.InitFromKernelProgramInfo(kernel_program_info);
  KernelReaderHelper reader_helper(zone, &translation_helper, kernel_data,
                                   kernel_data_program_offset);
  ProcedureAttributesMetadataHelper procedure_attributes_metadata_helper(
      &reader_helper);
  ProcedureAttributesMetadata attrs =
      procedure_attributes_metadata_helper.GetProcedureAttributes(
          kernel_offset);
  return attrs;
}

ProcedureAttributesMetadata ProcedureAttributesOf(const Function& function,
                                                  Zone* zone) {
  const auto& kernel_program_info =
      KernelProgramInfo::Handle(zone, function.KernelProgramInfo());
  return ProcedureAttributesOf(
      zone, kernel_program_info,
      TypedDataView::Handle(zone, function.KernelLibrary()),
      function.KernelLibraryOffset(), function.kernel_offset());
}

ProcedureAttributesMetadata ProcedureAttributesOf(const Field& field,
                                                  Zone* zone) {
  const auto& kernel_program_info =
      KernelProgramInfo::Handle(zone, field.KernelProgramInfo());
  return ProcedureAttributesOf(
      zone, kernel_program_info,
      TypedDataView::Handle(zone, field.KernelLibrary()),
      field.KernelLibraryOffset(), field.kernel_offset());
}

static UnboxingInfoMetadata* UnboxingInfoMetadataOf(
    Zone* zone,
    const KernelProgramInfo& kernel_program_info,
    const TypedDataView& kernel_data,
    intptr_t kernel_data_program_offset,
    intptr_t kernel_offset) {
  TranslationHelper translation_helper(Thread::Current());
  translation_helper.InitFromKernelProgramInfo(kernel_program_info);
  KernelReaderHelper reader_helper(zone, &translation_helper, kernel_data,
                                   kernel_data_program_offset);
  UnboxingInfoMetadataHelper unboxing_info_metadata_helper(&reader_helper);
  return unboxing_info_metadata_helper.GetUnboxingInfoMetadata(kernel_offset);
}

UnboxingInfoMetadata* UnboxingInfoMetadataOf(const Function& function,
                                             Zone* zone) {
  const auto& kernel_program_info =
      KernelProgramInfo::Handle(zone, function.KernelProgramInfo());
  return UnboxingInfoMetadataOf(
      zone, kernel_program_info,
      TypedDataView::Handle(zone, function.KernelLibrary()),
      function.KernelLibraryOffset(), function.kernel_offset());
}

TableSelectorMetadata* TableSelectorMetadataForProgram(
    const KernelProgramInfo& info,
    Zone* zone) {
  TranslationHelper translation_helper(Thread::Current());
  translation_helper.InitFromKernelProgramInfo(info);
  const auto& data = TypedDataView::Handle(zone, info.metadata_payloads());
  KernelReaderHelper reader_helper(zone, &translation_helper, data, 0);
  TableSelectorMetadataHelper table_selector_metadata_helper(&reader_helper);
  return table_selector_metadata_helper.GetTableSelectorMetadata(zone);
}

}  // namespace kernel
}  // namespace dart

#endif  // !defined(DART_PRECOMPILED_RUNTIME)
