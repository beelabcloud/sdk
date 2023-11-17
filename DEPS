# Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
# for details. All rights reserved. Use of this source code is governed by a
# BSD-style license that can be found in the LICENSE file.

# IMPORTANT:
# Before adding or updating dependencies, please review the documentation here:
# https://github.com/dart-lang/sdk/wiki/Adding-and-Updating-Dependencies
#
# Packages can be rolled to the latest version with `tools/manage_deps.dart`.
#
# For example
#
#     dart tools/manage_deps.dart bump third_party/pkg/dart_style

allowed_hosts = [
  'boringssl.googlesource.com',
  'chrome-infra-packages.appspot.com',
  'chromium.googlesource.com',
  'dart.googlesource.com',
  'dart-internal.googlesource.com',
  'fuchsia.googlesource.com',
  'llvm.googlesource.com',
]

vars = {
  # The dart_root is the root of our sdk checkout. This is normally
  # simply sdk, but if using special gclient specs it can be different.
  "dart_root": "sdk",

  # We use mirrors of all github repos to guarantee reproducibility and
  # consistency between what users see and what the bots see.
  # We need the mirrors to not have 100+ bots pulling github constantly.
  # We mirror our github repos on Dart's git servers.
  # DO NOT use this var if you don't see a mirror here:
  #   https://dart.googlesource.com/
  "dart_git": "https://dart.googlesource.com/",
  "dart_internal_git": "https://dart-internal.googlesource.com",
  # If the repo you want to use is at github.com/dart-lang, but not at
  # dart.googlesource.com, please file an issue
  # on github and add the label 'area-infrastructure'.
  # When the repo is mirrored, you can add it to this DEPS file.

  # Chromium git
  "chromium_git": "https://chromium.googlesource.com",
  "fuchsia_git": "https://fuchsia.googlesource.com",
  "llvm_git": "https://llvm.googlesource.com",

  # Checked-in SDK version. The checked-in SDK is a Dart SDK distribution
  # in a cipd package used to run Dart scripts in the build and test
  # infrastructure, which is automatically built on the release commits.
  # Use a published dev version to support unstable platforms.
  "sdk_tag": "version:3.2.0-150.0.dev",

  # co19 is a cipd package. Use update.sh in tests/co19[_2] to update these
  # hashes.
  "co19_rev": "00292501dd4d8b0e246130d55a024727e31d62eb",
  # This line prevents conflicts when both packages are rolled simultaneously.
  "co19_2_rev": "0454b178fdf6697e898b5e5c7ee553a9bc266faa",

  # The internal benchmarks to use. See go/dart-benchmarks-internal
  "benchmarks_internal_rev": "f048a4a853e3062056d39c3db100acdde42f16d6",
  "checkout_benchmarks_internal": False,

  # Checkout the flute benchmark only when benchmarking.
  "checkout_flute": False,

  # Checkout Android dependencies only on Mac and Linux.
  "download_android_deps":
    "host_os == mac or (host_os == linux and host_cpu == x64)",

  # Checkout extra javascript engines for testing or benchmarking.
  # d8, the V8 shell, is always checked out.
  "checkout_javascript_engines": False,
  "d8_tag": "version:11.9.79",
  "jsshell_tag": "version:95.0",

  # As Flutter does, we use Fuchsia's GN and Clang toolchain. These revision
  # should be kept up to date with the revisions pulled by the Flutter engine.
  # The list of revisions for these tools comes from Fuchsia, here:
  # https://fuchsia.googlesource.com/integration/+/HEAD/toolchain
  # If there are problems with the toolchain, contact fuchsia-toolchain@.
  "clang_version": "git_revision:6d667d4b261e81f325756fdfd5bb43b3b3d2451d",
  "gn_version": "git_revision:991530ce394efb58fcd848195469022fa17ae126",

  # Update from https://chrome-infra-packages.appspot.com/p/fuchsia/sdk/gn
  "fuchsia_sdk_version": "version:12.20230407.0.1",
  "download_fuchsia_deps": False,

  # Ninja, runs the build based on files generated by GN.
  "ninja_tag": "version:2@1.11.1.chromium.7",

  # Scripts that make 'git cl format' work.
  "clang_format_scripts_rev": "bb994c6f067340c1135eb43eed84f4b33cfa7397",

  ### /third_party/ dependencies

  # Prefer to use hashes of binaryen that have been reviewed & rolled into g3.
  "binaryen_rev" : "a51bd6df919a5b79574f0996a760cc20cb05697e",
  "boringssl_gen_rev": "a468ba9fec3f59edf46a7db98caaca893e1e4d96",
  "boringssl_rev": "74646566e93de7551bfdfc5f49de7462f13d1d05",
  "browser-compat-data_tag": "ac8cae697014da1ff7124fba33b0b4245cc6cd1b", # v1.0.22
  "devtools_rev": "8db42fc4a0b7a4ca180ba73fc387b81b0927e8a0",
  "icu_rev": "81d656878ec611cb0b42d52c82e9dae93920d9ba",
  "jinja2_rev": "2222b31554f03e62600cd7e383376a7c187967a1",
  "libcxx_rev": "44079a4cc04cdeffb9cfe8067bfb3c276fb2bab0",
  "libcxxabi_rev": "2ce528fb5e0f92e57c97ec3ff53b75359d33af12",
  "libprotobuf_rev": "24487dd1045c7f3d64a21f38a3f0c06cc4cf2edb",
  "markupsafe_rev": "8f45f5cfa0009d2a70589bcda0349b8cb2b72783",
  "perfetto_rev": "b8da07095979310818f0efde2ef3c69ea70d62c5",
  "ply_rev": "604b32590ffad5cbb82e4afef1d305512d06ae93",
  "protobuf_gn_rev": "ca669f79945418f6229e4fef89b666b2a88cbb10",
  "root_certificates_rev": "692f6d6488af68e0121317a9c2c9eb393eb0ee50",
  "WebCore_rev": "bcb10901266c884e7b3740abc597ab95373ab55c",
  "zlib_rev": "14dd4c4455602c9b71a1a89b5cafd1f4030d2e3f",

  ### /third_party/pkg dependencies
  # 'tools/rev_sdk_deps.dart' can rev pkg dependencies to their latest; put an
  # EOL comment after a dependency to disable this and pin it at its current
  # revision.

  "args_rev": "5a4e16f1e4c08b01498a9dce8aeda1a60161cd52",
  "async_rev": "75efa6cc08b2fc906fac4b6fdfdbcf6da7d0a2da",
  "bazel_worker_rev": "159e67182044b2d5edd89d12a873487d1d1343c1",
  "benchmark_harness_rev": "7d0d28e7946702db34ae121543774f60bf8cf03c",
  "boolean_selector_rev": "f255921c7155da2167e8c96e04e527180787aafb",
  "browser_launcher_rev": "1f69393d63a2f8d36d00b86cdd20df70c347af82",
  "characters_rev": "7633a16a22c626e19ca750223237396315268a06",
  "cli_util_rev": "44118e35e55c75f84fbc5ead051424ee1e73e406",
  "clock_rev": "1e75f08d3428bcd6f4b7cf70e788f24fc9b661e1",
  "collection_rev": "91afde43f488eef618454b896301c6ff59af72e0",
  "convert_rev": "c058c8f4ebfdc09a5122db7988acd9e117a7da48",
  "crypto_rev": "1e26879c8f166850288e8722c590a465b4461f1f",
  "csslib_rev": "bd30a1a773ec66d3e435dfc53fc140f1967716da",
  # Note: Updates to dart_style have to be coordinated with the infrastructure
  # team so that the internal formatter `tools/sdks/dart-sdk/bin/dart format`
  # matches the version here. Please follow this process to make updates:
  #
  # * Create a commit that updates the version here to the desired version and
  #   adds any appropriate CHANGELOG text.
  # * Send that to eng-prod to review. They will update the checked-in SDK
  #   and land the review.
  #
  # For more details, see https://github.com/dart-lang/sdk/issues/30164.
  "dart_style_rev": "1a2def95a3c04dafd27b85d17e6e828bd4afa1a3", # disable rev_sdk_deps.dart
  "dartdoc_rev": "8c103397734f4dba75915e40c734a88e29a35f26",
  "ecosystem_rev": "3da2dd3b91cea23b3bfd9ab6f16988f2ddcc2483",
  "ffi_rev": "d36e05af55293bcc511d6b3a99ea4b8cb69f6323",
  "file_rev": "a18ad1ce88eaeb5a11a13ef8fc25d1e78b546c59",
  "fixnum_rev": "87ed0658f32f992dc7360b77513eadfa7056aa9d",
  "flute_rev": "f42b09f77132210499ec8ed819a60c260af03db6",
  "glob_rev": "9c1996f9f9326d776fe151f292912113b8b64aa3",
  "html_rev": "a1b193e95f13c995e7f7200ce0d363de5952e383",
  "http_rev": "12516197c28a0763b1f90c26b87660810bf58cc8",
  "http_multi_server_rev": "9d62ea396d7d282592edf994378f67fcde982ce8",
  "http_parser_rev": "d2d03e7dfa3b7a99515b16f827650d6e210799b5",
  "intl_rev": "5d65e3808ce40e6282e40881492607df4e35669f",
  "json_rpc_2_rev": "50a37863be221f43ef07533c0c154ae676fc5df0",
  "leak_tracker_rev": "098bafcf99a5220e3c352d895d991e163568ee03", # b/299640139
  "lints_rev": "b044acab9f6669b3d8e781923a8ff86877801177",
  "logging_rev": "bcaad0f781a889d6e5cf8fc564fd0722c446b96e",
  "markdown_rev": "6cfd6f17651a8ba31b5a268f1139bb2c039dd4d4",
  "matcher_rev": "80910d6698576ba486ace6e5fdf0e27324f138db",
  "material_color_utilities_rev": "799b6ba2f3f1c28c67cc7e0b4f18e0c7d7f3c03e",
  "mime_rev": "37ef637c35896e289fdd37c0ea4680df4ab9f543",
  "mockito_rev": "097e5635a6c1859e03e9c606c2ab4cfa74618bcc",
  "native_rev": "be4aaf7b849a64d67756c95b6270b9bfe47f3c7d",
  "package_config_rev": "ae7ad83de97aba507fd05e97cc372bc6695c1759",
  "path_rev": "96d9183ad4f9e48109fa8d4b8269cf75f13922dd",
  "pool_rev": "a5bee3540a2b5b3a3c34038667e7cd7bb514dc62",
  "protobuf_rev": "c16bc891978a1764f0d6d8eca54f420242c78a6a",
  "pub_rev": "fca927ae2662204805e1646c0c0687369001a41a", # disable rev_sdk_deps.dart
  "pub_semver_rev": "f0be74a446f971db478e68b59ea62e393d6df3bd",
  "shelf_rev": "485197819b93a9f9342c389f1715fb8e17a7ac0f",
  "source_map_stack_trace_rev": "196d7bfa58ef307687907c323ab8e5fb1f382afa",
  "source_maps_rev": "eb3d40a6193adc63da958ed9451e3218bd6e95a0",
  "source_span_rev": "48d0f574ee0a92a241c865d47f461803a664b5ba",
  "sse_rev": "eeb2588ce56a5b2f1e4bbd88c2b35c910c505b71",
  "stack_trace_rev": "bcf2a0b1b7d4abaeedcb8b18ff41e4994aea1b17",
  "stream_channel_rev": "0ce7ab69c3a2ab83cdeb9dc60e1bacbb83abc165",
  "string_scanner_rev": "da9142cf9809e7e1364144b8193ec60d87f0a4b8",
  "sync_http_rev": "8233f74cd8a87707c13beceb59b56bca41b52966",
  "tar_rev": "3c68cba8e51c569428222b9185469249206172c6",
  "term_glyph_rev": "1b28285a7e818b8e87c4d2119d968c5b36d73c7a",
  "test_rev": "8191a355cefe5e6073e597d139bfb46e4b00c493",
  "test_descriptor_rev": "030193dfdfbf85930eae8536909c546151da9e9c",
  "test_process_rev": "2a6ee23fc2550fa466105819f5335fcfbab14035",
  "test_reflective_loader_rev": "45c57d62fb08471681cd0b0a1c3b131bf0122929",
  "tools_rev": "3c248df45b9bf40738579e8616cd7d85f34ba5b1",
  "typed_data_rev": "80e8943524a627f7ff421ace824f38105983e89a",
  "usage_rev": "7b12d510b5abde8a216437b8430ccfd02273625c",
  "vector_math_rev": "d54af8a2b8b8d935a475a4da6ea5a1b343f29562",
  "watcher_rev": "1aed03e2a8005f45083fdb38cbd4b684cd23082f",
  "web_socket_channel_rev": "af945f1ad3ac4193ed70b4ebfbdcba3b9f0198bc",
  "webdev_rev": "3078f48fb56a1036bc0f2a08ac51567291d8a837", # https://github.com/dart-lang/webdev/issues/2236
  "webdriver_rev": "21976d657e6505ad113f714bd104420aee23faac",
  "webkit_inspection_protocol_rev": "82f0c1c46dfdba5edf7c5fa84456233121dd69e1",
  "yaml_rev": "ae001879aa377afee2e70cf11b8716d6cc3e2658",
  "yaml_edit_rev": "4a9734dda12f63ef9eee4121f87ff4401e25a607",

  # Windows deps
  "crashpad_rev": "bf327d8ceb6a669607b0dbab5a83a275d03f99ed",
  "minichromium_rev": "8d641e30a8b12088649606b912c2bc4947419ccc",
  "googletest_rev": "f854f1d27488996dc8a6db3c9453f80b02585e12",

  # Pinned browser versions used by the testing infrastructure. These are not
  # meant to be downloaded by users for local testing.
  "download_chrome": False,
  "chrome_tag": "115.0.5790.170+1",
  "download_firefox": False,
  "firefox_tag": "112.0.2",

  # Emscripten is used in dart2wasm tests.
  "download_emscripten": False,
  "emsdk_rev": "e41b8c68a248da5f18ebd03bd0420953945d52ff",
  "emsdk_ver": "3.1.3",
}

gclient_gn_args_file = Var("dart_root") + '/build/config/gclient_args.gni'
gclient_gn_args = [
]

deps = {
  # Stuff needed for GN build.
  Var("dart_root") + "/buildtools/clang_format/script":
    Var("chromium_git") + "/chromium/llvm-project/cfe/tools/clang-format.git" +
    "@" + Var("clang_format_scripts_rev"),

  Var("dart_root") + "/benchmarks-internal": {
    "url": Var("dart_internal_git") + "/benchmarks-internal.git" +
           "@" + Var("benchmarks_internal_rev"),
    "condition": "checkout_benchmarks_internal",
  },
  Var("dart_root") + "/tools/sdks/dart-sdk": {
      "packages": [{
          "package": "dart/dart-sdk/${{platform}}",
          "version": Var("sdk_tag"),
      }],
      "dep_type": "cipd",
  },
  Var("dart_root") + "/third_party/d8": {
      "packages": [{
          "package": "dart/d8",
          "version": Var("d8_tag"),
      }],
      "dep_type": "cipd",
  },
  Var("dart_root") + "/third_party/firefox_jsshell": {
      "packages": [{
          "package": "dart/third_party/jsshell/${{platform}}",
          "version": Var("jsshell_tag"),
      }],
      "condition": "checkout_javascript_engines",
      "dep_type": "cipd",
  },
  Var("dart_root") + "/third_party/devtools": {
      "packages": [{
          "package": "dart/third_party/flutter/devtools",
          "version": "git_revision:" + Var("devtools_rev"),
      }],
      "dep_type": "cipd",
  },
  Var("dart_root") + "/tests/co19/src": {
      "packages": [{
          "package": "dart/third_party/co19",
          "version": "git_revision:" + Var("co19_rev"),
      }],
      "dep_type": "cipd",
  },
  Var("dart_root") + "/tests/co19_2/src": {
      "packages": [{
          "package": "dart/third_party/co19/legacy",
          "version": "git_revision:" + Var("co19_2_rev"),
      }],
      "dep_type": "cipd",
  },
  Var("dart_root") + "/third_party/markupsafe":
      Var("chromium_git") + "/chromium/src/third_party/markupsafe.git" +
      "@" + Var("markupsafe_rev"),
  Var("dart_root") + "/third_party/babel": {
      "packages": [{
          "package": "dart/third_party/babel",
          "version": "version:7.4.5",
      }],
      "dep_type": "cipd",
  },
  Var("dart_root") + "/third_party/zlib":
      Var("chromium_git") + "/chromium/src/third_party/zlib.git" +
      "@" + Var("zlib_rev"),

  Var("dart_root") + "/third_party/libcxx":
      Var("llvm_git") + "/llvm-project/libcxx" + "@" + Var("libcxx_rev"),

  Var("dart_root") + "/third_party/libcxxabi":
      Var("llvm_git") + "/llvm-project/libcxxabi" + "@" + Var("libcxxabi_rev"),

  Var("dart_root") + "/third_party/boringssl":
      Var("dart_git") + "boringssl_gen.git" + "@" + Var("boringssl_gen_rev"),
  Var("dart_root") + "/third_party/boringssl/src":
      "https://boringssl.googlesource.com/boringssl.git" +
      "@" + Var("boringssl_rev"),

  Var("dart_root") + "/third_party/binaryen/src" :
      Var("chromium_git") + "/external/github.com/WebAssembly/binaryen.git" +
      "@" + Var("binaryen_rev"),

  Var("dart_root") + "/third_party/gsutil": {
      "packages": [{
          "package": "infra/3pp/tools/gsutil",
          "version": "version:2@5.5",
      }],
      "dep_type": "cipd",
  },

  Var("dart_root") + "/third_party/root_certificates":
      Var("dart_git") + "root_certificates.git" +
      "@" + Var("root_certificates_rev"),

  Var("dart_root") + "/third_party/emsdk":
      Var("dart_git") + "external/github.com/emscripten-core/emsdk.git" +
      "@" + Var("emsdk_rev"),

  Var("dart_root") + "/third_party/jinja2":
      Var("chromium_git") + "/chromium/src/third_party/jinja2.git" +
      "@" + Var("jinja2_rev"),

  Var("dart_root") + "/third_party/perfetto":
      Var("fuchsia_git") +
      "/third_party/android.googlesource.com/platform/external/perfetto" +
      "@" + Var("perfetto_rev"),

  Var("dart_root") + "/third_party/ply":
      Var("chromium_git") + "/chromium/src/third_party/ply.git" +
      "@" + Var("ply_rev"),

  Var("dart_root") + "/build/secondary/third_party/protobuf":
      Var("fuchsia_git") + "/protobuf-gn" +
      "@" + Var("protobuf_gn_rev"),

  Var("dart_root") + "/third_party/protobuf":
      Var("fuchsia_git") + "/third_party/protobuf" +
      "@" + Var("libprotobuf_rev"),

  Var("dart_root") + "/third_party/icu":
      Var("chromium_git") + "/chromium/deps/icu.git" +
      "@" + Var("icu_rev"),

  Var("dart_root") + "/third_party/WebCore":
      Var("dart_git") + "webcore.git" + "@" + Var("WebCore_rev"),

  Var("dart_root") + "/third_party/mdn/browser-compat-data/src":
      Var('chromium_git') + '/external/github.com/mdn/browser-compat-data' +
      "@" + Var("browser-compat-data_tag"),

  Var("dart_root") + "/third_party/pkg/args":
      Var("dart_git") + "args.git" + "@" + Var("args_rev"),
  Var("dart_root") + "/third_party/pkg/async":
      Var("dart_git") + "async.git" + "@" + Var("async_rev"),
  Var("dart_root") + "/third_party/pkg/bazel_worker":
      Var("dart_git") + "bazel_worker.git" + "@" + Var("bazel_worker_rev"),
  Var("dart_root") + "/third_party/pkg/benchmark_harness":
      Var("dart_git") + "benchmark_harness.git" + "@" +
      Var("benchmark_harness_rev"),
  Var("dart_root") + "/third_party/pkg/boolean_selector":
      Var("dart_git") + "boolean_selector.git" +
      "@" + Var("boolean_selector_rev"),
  Var("dart_root") + "/third_party/pkg/browser_launcher":
      Var("dart_git") + "browser_launcher.git" + "@" + Var("browser_launcher_rev"),
  Var("dart_root") + "/third_party/pkg/characters": {
    # Contact athom@ or ensure that license requirements are met before using
    # this dependency in other parts of the Dart SDK.
    "url": Var("dart_git") + "characters.git" + "@" + Var("characters_rev"),
    "condition": "checkout_flute",
  },
  Var("dart_root") + "/third_party/pkg/cli_util":
      Var("dart_git") + "cli_util.git" + "@" + Var("cli_util_rev"),
  Var("dart_root") + "/third_party/pkg/clock":
      Var("dart_git") + "clock.git" + "@" + Var("clock_rev"),
  Var("dart_root") + "/third_party/pkg/collection":
      Var("dart_git") + "collection.git" + "@" + Var("collection_rev"),
  Var("dart_root") + "/third_party/pkg/convert":
      Var("dart_git") + "convert.git" + "@" + Var("convert_rev"),
  Var("dart_root") + "/third_party/pkg/crypto":
      Var("dart_git") + "crypto.git" + "@" + Var("crypto_rev"),
  Var("dart_root") + "/third_party/pkg/csslib":
      Var("dart_git") + "csslib.git" + "@" + Var("csslib_rev"),
  Var("dart_root") + "/third_party/pkg/dart_style":
      Var("dart_git") + "dart_style.git" + "@" + Var("dart_style_rev"),
  Var("dart_root") + "/third_party/pkg/dartdoc":
      Var("dart_git") + "dartdoc.git" + "@" + Var("dartdoc_rev"),
  Var("dart_root") + "/third_party/pkg/ecosystem":
      Var("dart_git") + "ecosystem.git" + "@" + Var("ecosystem_rev"),
  Var("dart_root") + "/third_party/pkg/ffi":
      Var("dart_git") + "ffi.git" + "@" + Var("ffi_rev"),
  Var("dart_root") + "/third_party/pkg/fixnum":
      Var("dart_git") + "fixnum.git" + "@" + Var("fixnum_rev"),
  Var("dart_root") + "/third_party/flute": {
    "url": Var("dart_git") + "flute.git" + "@" + Var("flute_rev"),
    "condition": "checkout_flute",
  },
  Var("dart_root") + "/third_party/pkg/file":
      Var("dart_git") + "external/github.com/google/file.dart"
      + "@" + Var("file_rev"),
  Var("dart_root") + "/third_party/pkg/glob":
      Var("dart_git") + "glob.git" + "@" + Var("glob_rev"),
  Var("dart_root") + "/third_party/pkg/html":
      Var("dart_git") + "html.git" + "@" + Var("html_rev"),
  Var("dart_root") + "/third_party/pkg/http":
      Var("dart_git") + "http.git" + "@" + Var("http_rev"),
  Var("dart_root") + "/third_party/pkg/http_multi_server":
      Var("dart_git") + "http_multi_server.git" +
      "@" + Var("http_multi_server_rev"),
  Var("dart_root") + "/third_party/pkg/http_parser":
      Var("dart_git") + "http_parser.git" + "@" + Var("http_parser_rev"),
  Var("dart_root") + "/third_party/pkg/intl":
      Var("dart_git") + "intl.git" + "@" + Var("intl_rev"),
  Var("dart_root") + "/third_party/pkg/json_rpc_2":
      Var("dart_git") + "json_rpc_2.git" + "@" + Var("json_rpc_2_rev"),
  Var("dart_root") + "/third_party/pkg/leak_tracker":
      Var("dart_git") + "leak_tracker.git" + "@" + Var("leak_tracker_rev"),
  Var("dart_root") + "/third_party/pkg/lints":
      Var("dart_git") + "lints.git" + "@" + Var("lints_rev"),
  Var("dart_root") + "/third_party/pkg/logging":
      Var("dart_git") + "logging.git" + "@" + Var("logging_rev"),
  Var("dart_root") + "/third_party/pkg/markdown":
      Var("dart_git") + "markdown.git" + "@" + Var("markdown_rev"),
  Var("dart_root") + "/third_party/pkg/matcher":
      Var("dart_git") + "matcher.git" + "@" + Var("matcher_rev"),
  Var("dart_root") + "/third_party/pkg/material_color_utilities": {
    "url": Var("dart_git") +
           "external/github.com/material-foundation/material-color-utilities.git" +
           "@" + Var("material_color_utilities_rev"),
    "condition": "checkout_flute",
  },
  Var("dart_root") + "/third_party/pkg/mime":
      Var("dart_git") + "mime.git" + "@" + Var("mime_rev"),
  Var("dart_root") + "/third_party/pkg/mockito":
      Var("dart_git") + "mockito.git" + "@" + Var("mockito_rev"),
  Var("dart_root") + "/third_party/pkg/native":
      Var("dart_git") + "native.git" + "@" + Var("native_rev"),
  Var("dart_root") + "/third_party/pkg/package_config":
      Var("dart_git") + "package_config.git" +
      "@" + Var("package_config_rev"),
  Var("dart_root") + "/third_party/pkg/path":
      Var("dart_git") + "path.git" + "@" + Var("path_rev"),
  Var("dart_root") + "/third_party/pkg/pool":
      Var("dart_git") + "pool.git" + "@" + Var("pool_rev"),
  Var("dart_root") + "/third_party/pkg/protobuf":
       Var("dart_git") + "protobuf.git" + "@" + Var("protobuf_rev"),
  Var("dart_root") + "/third_party/pkg/pub_semver":
      Var("dart_git") + "pub_semver.git" + "@" + Var("pub_semver_rev"),
  Var("dart_root") + "/third_party/pkg/pub":
      Var("dart_git") + "pub.git" + "@" + Var("pub_rev"),
  Var("dart_root") + "/third_party/pkg/shelf":
      Var("dart_git") + "shelf.git" + "@" + Var("shelf_rev"),
  Var("dart_root") + "/third_party/pkg/source_maps":
      Var("dart_git") + "source_maps.git" + "@" + Var("source_maps_rev"),
  Var("dart_root") + "/third_party/pkg/source_span":
      Var("dart_git") + "source_span.git" + "@" + Var("source_span_rev"),
  Var("dart_root") + "/third_party/pkg/source_map_stack_trace":
      Var("dart_git") + "source_map_stack_trace.git" +
      "@" + Var("source_map_stack_trace_rev"),
  Var("dart_root") + "/third_party/pkg/sse":
      Var("dart_git") + "sse.git" + "@" + Var("sse_rev"),
  Var("dart_root") + "/third_party/pkg/stack_trace":
      Var("dart_git") + "stack_trace.git" + "@" + Var("stack_trace_rev"),
  Var("dart_root") + "/third_party/pkg/stream_channel":
      Var("dart_git") + "stream_channel.git" +
      "@" + Var("stream_channel_rev"),
  Var("dart_root") + "/third_party/pkg/string_scanner":
      Var("dart_git") + "string_scanner.git" +
      "@" + Var("string_scanner_rev"),
  Var("dart_root") + "/third_party/pkg/sync_http":
      Var("dart_git") + "sync_http.git" + "@" + Var("sync_http_rev"),
Var("dart_root") + "/third_party/pkg/tar":
      Var("dart_git") + "external/github.com/simolus3/tar.git" +
      "@" + Var("tar_rev"),
  Var("dart_root") + "/third_party/pkg/term_glyph":
      Var("dart_git") + "term_glyph.git" + "@" + Var("term_glyph_rev"),
  Var("dart_root") + "/third_party/pkg/test":
      Var("dart_git") + "test.git" + "@" + Var("test_rev"),
  Var("dart_root") + "/third_party/pkg/test_descriptor":
      Var("dart_git") + "test_descriptor.git" + "@" + Var("test_descriptor_rev"),
  Var("dart_root") + "/third_party/pkg/test_process":
      Var("dart_git") + "test_process.git" + "@" + Var("test_process_rev"),
  Var("dart_root") + "/third_party/pkg/test_reflective_loader":
      Var("dart_git") + "test_reflective_loader.git" +
      "@" + Var("test_reflective_loader_rev"),
  Var("dart_root") + "/third_party/pkg/tools":
      Var("dart_git") + "tools.git" + "@" + Var("tools_rev"),
  Var("dart_root") + "/third_party/pkg/typed_data":
      Var("dart_git") + "typed_data.git" + "@" + Var("typed_data_rev"),
  Var("dart_root") + "/third_party/pkg/usage":
      Var("dart_git") + "usage.git" + "@" + Var("usage_rev"),
  Var("dart_root") + "/third_party/pkg/vector_math":
      Var("dart_git") + "external/github.com/google/vector_math.dart.git" +
      "@" + Var("vector_math_rev"),
  Var("dart_root") + "/third_party/pkg/watcher":
      Var("dart_git") + "watcher.git" + "@" + Var("watcher_rev"),
  Var("dart_root") + "/third_party/pkg/webdev":
      Var("dart_git") + "webdev.git" + "@" + Var("webdev_rev"),
  Var("dart_root") + "/third_party/pkg/webdriver":
      Var("dart_git") + "external/github.com/google/webdriver.dart.git" +
      "@" + Var("webdriver_rev"),
  Var("dart_root") + "/third_party/pkg/webkit_inspection_protocol":
      Var("dart_git") + "external/github.com/google/webkit_inspection_protocol.dart.git" +
      "@" + Var("webkit_inspection_protocol_rev"),

  Var("dart_root") + "/third_party/pkg/web_socket_channel":
      Var("dart_git") + "web_socket_channel.git" +
      "@" + Var("web_socket_channel_rev"),
  Var("dart_root") + "/third_party/pkg/yaml_edit":
      Var("dart_git") + "yaml_edit.git" + "@" + Var("yaml_edit_rev"),
  Var("dart_root") + "/third_party/pkg/yaml":
      Var("dart_git") + "yaml.git" + "@" + Var("yaml_rev"),

  # Keep consistent with pkg/test_runner/lib/src/options.dart.
  Var("dart_root") + "/buildtools/linux-x64/clang": {
      "packages": [
          {
              "package": "fuchsia/third_party/clang/linux-amd64",
              "version": Var("clang_version"),
          },
      ],
      "condition": "host_cpu == x64 and host_os == linux",
      "dep_type": "cipd",
  },
  Var("dart_root") + "/buildtools/mac-x64/clang": {
      "packages": [
          {
              "package": "fuchsia/third_party/clang/mac-amd64",
              "version": Var("clang_version"),
          },
      ],
      "condition": "host_os == mac", # On ARM64 Macs too because Goma doesn't support the host-arm64 toolchain.
      "dep_type": "cipd",
  },
  Var("dart_root") + "/buildtools/win-x64/clang": {
      "packages": [
          {
              "package": "fuchsia/third_party/clang/windows-amd64",
              "version": Var("clang_version"),
          },
      ],
      "condition": "host_os == win", # On ARM64 Windows too because Fuchsia doesn't provide the host-arm64 toolchain.
      "dep_type": "cipd",
  },
  Var("dart_root") + "/buildtools/linux-arm64/clang": {
      "packages": [
          {
              "package": "fuchsia/third_party/clang/linux-arm64",
              "version": Var("clang_version"),
          },
      ],
      "condition": "host_os == 'linux' and host_cpu == 'arm64'",
      "dep_type": "cipd",
  },
  Var("dart_root") + "/buildtools/mac-arm64/clang": {
      "packages": [
          {
              "package": "fuchsia/third_party/clang/mac-arm64",
              "version": Var("clang_version"),
          },
      ],
      "condition": "host_os == 'mac' and host_cpu == 'arm64'",
      "dep_type": "cipd",
  },

  Var("dart_root") + "/third_party/webdriver/chrome": {
    "packages": [
      {
        "package": "dart/third_party/chromedriver/${{platform}}",
        "version": "version:" + Var("chrome_tag"),
      }
    ],
    "condition": "download_chrome",
    "dep_type": "cipd",
  },

  Var("dart_root") + "/buildtools": {
      "packages": [
          {
              "package": "gn/gn/${{platform}}",
              "version": Var("gn_version"),
          },
      ],
      "condition": "host_os != 'win'",
      "dep_type": "cipd",
  },
  Var("dart_root") + "/buildtools/win": {
      "packages": [
          {
              "package": "gn/gn/windows-amd64",
              "version": Var("gn_version"),
          },
      ],
      "condition": "host_os == 'win'",
      "dep_type": "cipd",
  },

  Var("dart_root") + "/buildtools/ninja": {
      "packages": [{
          "package": "infra/3pp/tools/ninja/${{platform}}",
          "version": Var("ninja_tag"),
      }],
      "dep_type": "cipd",
  },

  Var("dart_root") + "/third_party/android_tools": {
      "packages": [
          {
            "package": "flutter/android/sdk/all/${{os}}-amd64",
            "version": "version:33v6"
          }
      ],
      "condition": "download_android_deps",
      "dep_type": "cipd",
  },

  # TODO(38752): Confirm if mac sdk is necessary in dart.
  Var("dart_root") + "/third_party/fuchsia/sdk/mac": {
    "packages": [
      {
      "package": "fuchsia/sdk/gn/mac-amd64",
      "version": Var("fuchsia_sdk_version"),
      }
    ],
    "condition":
        'download_fuchsia_deps and host_os == "mac" and host_cpu == "x64"',
    "dep_type": "cipd",
  },

  # TODO(38752): Migrate to core sdk, gn sdk is deprecating.
  Var("dart_root") + "/third_party/fuchsia/sdk/linux": {
    "packages": [
      {
      "package": "fuchsia/sdk/gn/linux-amd64",
      "version": Var("fuchsia_sdk_version"),
      }
    ],
    "condition":
        'download_fuchsia_deps and host_os == "linux" and host_cpu == "x64"',
    "dep_type": "cipd",
  },

  Var("dart_root") + "/third_party/fuchsia/test_scripts": {
    "packages": [
      {
      "package": "chromium/fuchsia/test-scripts/fuchsia",
      "version": "version:2@0d97902a72c9bc224f64630177cf95cd632604a2",
      }
    ],
    "condition":
        'download_fuchsia_deps and host_os == "linux" and host_cpu == "x64"',
    "dep_type": "cipd",
  },

  Var("dart_root") + "/pkg/front_end/test/fasta/types/benchmark_data": {
    "packages": [
      {
        "package": "dart/cfe/benchmark_data",
        "version": "sha1sum:5b6e6dfa33b85c733cab4e042bf46378984d1544",
      }
    ],
    "dep_type": "cipd",
  },

  # TODO(37531): Remove these cipd packages and build with sdk instead when
  # benchmark runner gets support for that.
  Var("dart_root") + "/benchmarks/FfiBoringssl/native/out/": {
      "packages": [
          {
              "package": "dart/benchmarks/ffiboringssl",
              "version": "commit:a86c69888b9a416f5249aacb4690a765be064969",
          },
      ],
      "dep_type": "cipd",
  },
  Var("dart_root") + "/benchmarks/FfiCall/native/out/": {
      "packages": [
          {
              "package": "dart/benchmarks/fficall",
              "version": "ebF5aRXKDananlaN4Y8b0bbCNHT1MnkGbWqfpCpiND4C",
          },
      ],
          "dep_type": "cipd",
  },
  Var("dart_root") + "/benchmarks/NativeCall/native/out/": {
      "packages": [
          {
              "package": "dart/benchmarks/nativecall",
              "version": "w1JKzCIHSfDNIjqnioMUPq0moCXKwX67aUfhyrvw4E0C",
          },
      ],
          "dep_type": "cipd",
  },
  Var("dart_root") + "/third_party/browsers/chrome": {
      "packages": [
          {
              "package": "dart/browsers/chrome/${{platform}}",
              "version": "version:" + Var("chrome_tag"),
          },
      ],
      "condition": "download_chrome",
      "dep_type": "cipd",
  },
  Var("dart_root") + "/third_party/browsers/firefox": {
      "packages": [
          {
              "package": "dart/browsers/firefox/${{platform}}",
              "version": "version:" + Var("firefox_tag"),
          },
      ],
      "condition": "download_firefox",
      "dep_type": "cipd",
  },
}

deps_os = {
  "win": {
    Var("dart_root") + "/third_party/cygwin":
        Var("chromium_git") + "/chromium/deps/cygwin.git" + "@" +
        "c89e446b273697fadf3a10ff1007a97c0b7de6df",
    Var("dart_root") + "/third_party/crashpad/crashpad":
        Var("chromium_git") + "/crashpad/crashpad.git" + "@" +
        Var("crashpad_rev"),
    Var("dart_root") + "/third_party/mini_chromium/mini_chromium":
        Var("chromium_git") + "/chromium/mini_chromium" + "@" +
        Var("minichromium_rev"),
    Var("dart_root") + "/third_party/googletest":
        Var("fuchsia_git") + "/third_party/googletest" + "@" +
        Var("googletest_rev"),
  }
}

hooks = [
  {
    # Generate the .dart_tool/package_confg.json file.
    'name': 'Generate .dart_tool/package_confg.json',
    'pattern': '.',
    'action': ['python3', 'sdk/tools/generate_package_config.py'],
  },
  {
    # Generate the sdk/version file.
    'name': 'Generate sdk/version',
    'pattern': '.',
    'action': ['python3', 'sdk/tools/generate_sdk_version_file.py'],
  },
  {
    'name': 'sysroot_arm',
    'pattern': '.',
    'condition': 'checkout_linux',
    'action': ['python3', 'sdk/build/linux/sysroot_scripts/install-sysroot.py',
               '--arch=arm'],
  },
  {
    'name': 'sysroot_arm64',
    'pattern': '.',
    'condition': 'checkout_linux',
    'action': ['python3', 'sdk/build/linux/sysroot_scripts/install-sysroot.py',
               '--arch=arm64'],
  },
  {
    'name': 'sysroot_x86',
    'pattern': '.',
    'condition': 'checkout_linux',
    'action': ['python3', 'sdk/build/linux/sysroot_scripts/install-sysroot.py',
               '--arch=x86'],
  },
  {
    'name': 'sysroot_x64',
    'pattern': '.',
    'condition': 'checkout_linux',
    'action': ['python3', 'sdk/build/linux/sysroot_scripts/install-sysroot.py',
               '--arch=x64'],
  },
  {
    'name': 'buildtools',
    'pattern': '.',
    'action': ['python3', 'sdk/tools/buildtools/update.py'],
  },
  {
    # Update the Windows toolchain if necessary.
    'name': 'win_toolchain',
    'pattern': '.',
    'action': ['python3', 'sdk/build/vs_toolchain.py', 'update'],
    'condition': 'checkout_win'
  },
  # Install and activate the empscripten SDK.
  {
    'name': 'install_emscripten',
    'pattern': '.',
    'action': ['python3', 'sdk/third_party/emsdk/emsdk.py', 'install',
        Var('emsdk_ver')],
    'condition': 'download_emscripten'
  },
  {
    'name': 'activate_emscripten',
    'pattern': '.',
    'action': ['python3', 'sdk/third_party/emsdk/emsdk.py', 'activate',
        Var('emsdk_ver')],
    'condition': 'download_emscripten'
  },
  {
    'name': 'Download Fuchsia system images',
    'pattern': '.',
    'action': [
      'python3',
      'sdk/build/fuchsia/with_envs.py',
      'sdk/third_party/fuchsia/test_scripts/update_product_bundles.py',
      'terminal.qemu-x64',
    ],
    'condition': 'download_fuchsia_deps'
  },
]
