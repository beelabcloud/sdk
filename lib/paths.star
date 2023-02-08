# Copyright (c) 2022 The Dart project authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
"""
Defines paths relevant to different parts of the Dart SDK.
"""

_TEST_PY_PATHS = "pkg/(async_helper|expect|smith|status_file|test_runner)/.+"

_STANDARD_PATHS = [
    "DEPS",  # DEPS catches most third_party changes.
    # build files
    "build/.+",
    "BUILD.gn",
    "sdk_args.gni",
    # core libraries
    ".dart_tool/package_config.json",
    "sdk/lib/[^_].+",
    # testing
    _TEST_PY_PATHS,
    "tools/bots/test_matrix.json",
    # tests
    "tests/.+",
]

_CFE_PATHS_ONLY = [
    "pkg/(front_end|kernel|testing|_fe_analyzer_shared)/.+",
]

_CFE_PATHS = _STANDARD_PATHS + _CFE_PATHS_ONLY

_VM_PATHS = _CFE_PATHS + [
    # VM sources
    "pkg/vm/.+",
    "runtime/.+",
    "sdk/lib/_http/.+",
    "sdk/lib/_internal/vm.+",
]

_WEB_PATHS = _CFE_PATHS + [
    "sdk/lib/_js_interop/.+",
    "sdk/lib/_internal/js.+",
]

_DART2JS_PATHS = _WEB_PATHS + [
    # compiler sources
    "pkg/(compiler|dart2js_tools|js_ast)/.+",
    "utils/compiler/.+",
    # testing
    "pkg/(js|modular_test|sourcemap_testing)/.+",
]

_DDC_PATHS = _WEB_PATHS + [
    # compiler sources
    "pkg/(build_integration|dev_compiler|meta)/.+",
    "utils/dartdevc/.+",
    # testing
    "pkg/(js|modular_test|sourcemap_testing)/.+",
]

_ANALYZER_NNBD_PATHS = _STANDARD_PATHS + [
    # analyzer sources
    "pkg/(analyzer|analyzer_cli|_fe_analyzer_shared)/.+",
]

_ANALYZER_PATHS = _STANDARD_PATHS + [
    # "analyzer" bots analyze everything under pkg
    "pkg/.+",
]

_DART2WASM_PATHS = _CFE_PATHS + [
    "pkg/(dart2wasm|vm|wasm_builder|_js_interop_checks)/.+",
    "sdk/lib/_internal/vm_shared/.+",
    "sdk/lib/_internal/vm/lib/ffi_.+",
    "sdk/lib/_internal/vm/lib/typed_data_patch.dart",
    "sdk/lib/_internal/wasm.+",
    "sdk/lib/_js_interop/.+",
]

_RELEASE_PATHS = [
    # Paths that trigger release tryjobs
    "tools/VERSION",
]

def _to_location_filters(paths):
    return [cq.location_filter(path_regexp = path) for path in paths]

paths = struct(
    analyzer = _ANALYZER_PATHS,
    analyzer_nnbd = _ANALYZER_NNBD_PATHS,
    cfe = _CFE_PATHS,
    cfe_only = _CFE_PATHS_ONLY,
    dart2js = _DART2JS_PATHS,
    dart2wasm = _DART2WASM_PATHS,
    ddc = _DDC_PATHS,
    release = _RELEASE_PATHS,
    standard = _STANDARD_PATHS,
    test_py = _TEST_PY_PATHS,
    vm = _VM_PATHS,

    # Utility functions
    to_location_filters = _to_location_filters,
)
