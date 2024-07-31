# Copyright (c) 2022 The Dart project authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
"""
Defines the Dart VM builders.
"""

load("//lib/cron.star", "cron")
load("//lib/dart.star", "dart")
load(
    "//lib/defaults.star",
    "android_deps",
    "arm64",
    "flutter_pool",
    "fuchsia_deps",
    "jammy",
    "mac",
    "no_android",
    "no_reclient",
    "noble",
    "slow_shards",
    "windows",
    "windows11",
)
load("//lib/helpers.star", "union")
load("//lib/paths.star", "paths")

_postponed_alt_console_entries = []

dart.poller("dart-vm-gitiles-trigger", branches = ["main"], paths = paths.vm)
luci.notifier(
    name = "dart-vm-team",
    on_new_failure = True,
    notify_emails = ["dart-vm-team-breakages@google.com"],
)

def _vm_builder(name, category = None, on_cq = False, location_filters = None, **kwargs):
    """
    Creates a Dart builder that is only triggered by VM commits.

    Args:
        name: The builder name.
        category: The column heading for the builder on a console.
        on_cq: Whether the build is added to the default set of CQ tryjobs.
        location_filters: Locations that trigger this builder.
        **kwargs: Extra arguments are passed on to dart_ci_sandbox_builder.
    """
    if on_cq and not location_filters:
        # Don't add VM builders to the default CQ, trigger only on VM paths.
        location_filters = paths.to_location_filters(paths.vm)
        on_cq = False
    dart.ci_sandbox_builder(
        name,
        category = category,
        triggered_by = ["dart-vm-gitiles-trigger-%s"],
        on_cq = on_cq,
        location_filters = location_filters,
        **kwargs
    )
    _postponed_alt_console_entry(name, category)

def _nightly_builder(name, category, channels = ["try"], properties = {}, **kwargs):
    properties = union({"bisection_enabled": True}, properties)
    cron.nightly_builder(name, category = category, channels = channels, properties = properties, notifies = "dart-vm-team", **kwargs)
    _postponed_alt_console_entry(name, category)

def _postponed_alt_console_entry(name, category):
    if category:
        console_category, _, short_name = category.rpartition("|")
        _postponed_alt_console_entries.append({
            "builder": name,
            "category": console_category,
            "short_name": short_name,
        })

def add_postponed_alt_console_entries():
    for entry in _postponed_alt_console_entries:
        luci.console_view_entry(console_view = "alt", **entry)

# vm|jit
_vm_builder(
    "vm-linux-debug-x64",
    category = "vm|jit|d",
)
_vm_builder(
    "vm-linux-release-x64",
    category = "vm|jit|r",
)
_nightly_builder(
    "vm-linux-debug-ia32",
    category = "vm|jit|d3",
    properties = slow_shards,
)
_nightly_builder(
    "vm-linux-release-ia32",
    category = "vm|jit|r3",
)
_vm_builder(
    "vm-linux-release-simarm",
    category = "vm|jit|ra",
)
_vm_builder(
    "vm-linux-debug-simriscv64",
    category = "vm|jit|rv",
)
_vm_builder(
    "vm-linux-release-arm64",
    category = "vm|jit|a6",
    dimensions = [jammy, arm64],
    properties = {"clobber": False},
    rbe = False,  # b/306641265
)
_vm_builder(
    "vm-mac-debug-arm64",
    category = "vm|jit|m1d",
    dimensions = [mac, arm64],
    properties = [no_android, slow_shards],
    on_cq = True,
)
_vm_builder(
    "vm-mac-debug-x64",
    category = "vm|jit|md",
    dimensions = mac,
    properties = slow_shards,
)
_vm_builder(
    "vm-mac-release-arm64",
    category = "vm|jit|m1r",
    dimensions = [mac, arm64],
    properties = no_android,
)
_vm_builder(
    "vm-checked-mac-release-arm64",
    category = "vm|jit|rc",
    dimensions = [mac, arm64],
)
_vm_builder(
    "vm-mac-release-x64",
    category = "vm|jit|mr",
    dimensions = mac,
)
_nightly_builder(
    "vm-win-release-ia32",
    category = "vm|jit|wr3",
    dimensions = windows,
)
_vm_builder(
    "vm-win-debug-x64",
    category = "vm|jit|wd",
    properties = slow_shards,
    dimensions = windows,
)
_vm_builder(
    "vm-win-release-x64",
    category = "vm|jit|wr",
    dimensions = windows,
    on_cq = True,
)
_nightly_builder(
    "vm-win-debug-arm64",
    category = "vm|jit|wad",
    dimensions = [windows11, arm64, flutter_pool],
    properties = [{"clobber": False}, no_reclient],
    rbe = False,
)
_vm_builder(
    "vm-win-release-arm64",
    category = "vm|jit|war",
    dimensions = [windows11, arm64, flutter_pool],
    properties = [{"clobber": False}, no_reclient],
    rbe = False,
)

# vm|appjit
_vm_builder(
    "vm-appjit-linux-debug-x64",
    category = "vm|appjit|d",
    properties = slow_shards,
)
_vm_builder(
    "vm-appjit-linux-release-x64",
    category = "vm|appjit|r",
)
_nightly_builder(
    "vm-appjit-linux-product-x64",
    category = "vm|appjit|p",
)

# vm|aot
_vm_builder(
    "vm-aot-linux-release-x64",
    category = "vm|aot|r",
)
_vm_builder(
    "vm-aot-linux-debug-simarm_x64",
    category = "vm|aot|da",
    properties = slow_shards,
)
_vm_builder(
    "vm-aot-linux-release-simarm_x64",
    category = "vm|aot|ra",
)
_nightly_builder(
    "vm-aot-linux-debug-x64",
    category = "vm|aot|d",
    properties = slow_shards,
)
_nightly_builder(
    "vm-aot-linux-debug-simriscv64",
    category = "vm|aot|rv",
    properties = [slow_shards],
)
_nightly_builder(
    "vm-aot-linux-release-arm64",
    category = "vm|aot|a6",
    dimensions = [jammy, arm64],
    properties = {"clobber": False},
    rbe = False,  # b/306641265
)
_vm_builder(
    "vm-aot-mac-release-arm64",
    category = "vm|aot|m1",
    dimensions = [mac, arm64],
    properties = [no_android, slow_shards],
)
_vm_builder(
    "vm-aot-mac-release-x64",
    category = "vm|aot|m",
    dimensions = mac,
    properties = slow_shards,
)
_nightly_builder(
    "vm-aot-win-debug-x64",
    category = "vm|aot|wd",
    dimensions = windows,
    properties = slow_shards,
)
_vm_builder(
    "vm-aot-win-release-x64",
    category = "vm|aot|wr",
    dimensions = windows,
)
_nightly_builder(
    "vm-aot-win-debug-arm64",
    category = "vm|aot|wad",
    dimensions = [windows11, arm64, flutter_pool],
    properties = [{"clobber": False}, no_reclient],
    rbe = False,
)
_vm_builder(
    "vm-aot-win-release-arm64",
    category = "vm|aot|war",
    dimensions = [windows11, arm64, flutter_pool],
    properties = [{"clobber": False}, no_reclient],
    rbe = False,
)

# vm|aot|android
_vm_builder(
    "vm-aot-android-release-arm_x64",
    category = "vm|aot|android|a32",
    properties = [android_deps, slow_shards],
)
_vm_builder(
    "vm-aot-android-release-arm64c",
    category = "vm|aot|android|a64",
    properties = [android_deps, slow_shards],
)

# vm|aot|product
_nightly_builder(
    "vm-aot-linux-product-x64",
    category = "vm|aot|product|l",
)
_nightly_builder(
    "vm-aot-mac-product-arm64",
    category = "vm|aot|product|m",
    dimensions = [mac, arm64],
)
_nightly_builder(
    "vm-aot-win-product-x64",
    category = "vm|aot|product|w",
    dimensions = windows,
)

# vm|aot
_nightly_builder(
    "vm-aot-obfuscate-linux-release-x64",
    category = "vm|aot|o",
)
_nightly_builder(
    "vm-aot-dwarf-linux-product-x64",
    category = "vm|aot|dw",
)

# vm|misc
_nightly_builder(
    "vm-eager-optimization-linux-release-ia32",
    category = "vm|misc|j",
)
_nightly_builder(
    "vm-eager-optimization-linux-release-x64",
    category = "vm|misc|j",
)
_nightly_builder(
    "vm-aot-optimization-level-linux-release-x64",
    category = "vm|misc|a",
)

_nightly_builder(
    "vm-asan-linux-release-x64",
    category = "vm|misc|sanitizer|a",
)
_nightly_builder(
    "vm-msan-linux-release-x64",
    category = "vm|misc|sanitizer|m",
)
_nightly_builder(
    "vm-tsan-linux-release-x64",
    category = "vm|misc|sanitizer|t",
)
_nightly_builder(
    "vm-ubsan-linux-release-x64",
    category = "vm|misc|sanitizer|u",
)
_nightly_builder(
    "vm-aot-asan-linux-release-x64",
    category = "vm|misc|sanitizer|a",
)
_nightly_builder(
    "vm-aot-msan-linux-release-x64",
    category = "vm|misc|sanitizer|m",
)
_nightly_builder(
    "vm-aot-tsan-linux-release-x64",
    category = "vm|misc|sanitizer|t",
)
_nightly_builder(
    "vm-aot-ubsan-linux-release-x64",
    category = "vm|misc|sanitizer|u",
)
_nightly_builder(
    "vm-asan-linux-release-arm64",
    category = "vm|misc|sanitizer|a",
    dimensions = [jammy, arm64],
    properties = {"clobber": False},
    rbe = False,  # b/306641265
)
_nightly_builder(
    "vm-msan-linux-release-arm64",
    category = "vm|misc|sanitizer|m",
    dimensions = [jammy, arm64],
    properties = {"clobber": False},
    rbe = False,  # b/306641265
)
_nightly_builder(
    "vm-tsan-linux-release-arm64",
    category = "vm|misc|sanitizer|t",
    dimensions = [jammy, arm64],
    properties = {"clobber": False},
    rbe = False,  # b/306641265
)
_nightly_builder(
    "vm-ubsan-linux-release-arm64",
    category = "vm|misc|sanitizer|u",
    dimensions = [jammy, arm64],
    properties = {"clobber": False},
    rbe = False,  # b/306641265
)
_nightly_builder(
    "vm-reload-linux-debug-x64",
    category = "vm|misc|reload|d",
)
_nightly_builder(
    "vm-reload-linux-release-x64",
    category = "vm|misc|reload|r",
)
_nightly_builder(
    "vm-reload-rollback-linux-debug-x64",
    category = "vm|misc|reload|drb",
)
_nightly_builder(
    "vm-reload-rollback-linux-release-x64",
    category = "vm|misc|reload|rrb",
)
_nightly_builder(
    "vm-linux-debug-x64c",
    category = "vm|misc|compressed|jl",
)
_nightly_builder(
    "vm-aot-linux-debug-x64c",
    category = "vm|misc|compressed|al",
    properties = slow_shards,
)
_nightly_builder(
    "vm-win-debug-x64c",
    category = "vm|misc|compressed|jw",
    dimensions = windows,
)
_nightly_builder(
    "vm-aot-win-debug-x64c",
    category = "vm|misc|compressed|aw",
    dimensions = windows,
    properties = slow_shards,
)
_vm_builder(
    "vm-fuchsia-release-arm64",
    category = "vm|misc|f",
    channels = ["try"],
    properties = [fuchsia_deps],
)
_vm_builder(
    "vm-fuchsia-release-x64",
    category = "vm|misc|f",
    channels = ["try"],
    dimensions = [jammy, {"host_class": "virtualization"}],
    properties = [fuchsia_deps],
)

# Our sysroot does not support gcc, we can't use RBE for this builder
_nightly_builder(
    "vm-gcc-linux",
    category = "vm|misc|g",
    dimensions = noble,
    execution_timeout = 5 * time.hour,
    rbe = False,
    properties = {
        "$dart/build": {
            "timeout": 75 * 60,  # 100 minutes,
        },
    },
)

_nightly_builder(
    "vm-msvc-windows",
    category = "vm|misc|m",
    dimensions = windows,
    rbe = False,
)

# vm|ffi
_vm_builder(
    "vm-ffi-android-debug-arm",
    category = "vm|ffi|d32",
    properties = [android_deps],
)
_vm_builder(
    "vm-ffi-android-release-arm",
    category = "vm|ffi|r32",
    properties = [android_deps],
)
_vm_builder(
    "vm-ffi-android-product-arm",
    category = "vm|ffi|p32",
    properties = [android_deps],
)
_vm_builder(
    "vm-ffi-android-debug-arm64c",
    category = "vm|ffi|d64",
    properties = [android_deps],
)
_vm_builder(
    "vm-ffi-android-release-arm64c",
    category = "vm|ffi|r64",
    properties = [android_deps],
)
_vm_builder(
    "vm-ffi-android-product-arm64c",
    category = "vm|ffi|p64",
    properties = [android_deps],
)
_vm_builder(
    "vm-ffi-qemu-linux-release-arm",
    category = "vm|ffi|qa",
    dimensions = jammy,  # Pre-Jammy ARM QEMU has flaky crashes
)
_vm_builder(
    "vm-ffi-qemu-linux-release-riscv64",
    category = "vm|ffi|qr",
    dimensions = noble,  # Pre-Noble RISC-V QEMU is missing extensions
)

# Isolate stress test builder
_vm_builder(
    "iso-stress-linux",
    channels = ["try"],
    notifies = "dart-vm-team",
    properties = slow_shards,
)
