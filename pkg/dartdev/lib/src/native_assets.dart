// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:dartdev/src/sdk.dart';
import 'package:logging/logging.dart';
import 'package:native_assets_builder/native_assets_builder.dart';
import 'package:native_assets_cli/native_assets_cli.dart';
import 'package:native_assets_cli/native_assets_cli_internal.dart';

import 'core.dart';

/// Compiles all native assets for host OS in JIT mode.
///
/// If provided, only native assets of all transitive dependencies of
/// [runPackageName] are built.
Future<(bool success, List<AssetImpl> assets)> compileNativeAssetsJit({
  required bool verbose,
  String? runPackageName,
}) async {
  final workingDirectory = Directory.current.uri;
  // TODO(https://github.com/dart-lang/package_config/issues/126): Use
  // package config resolution from package:package_config.
  if (!await File.fromUri(
          workingDirectory.resolve('.dart_tool/package_config.json'))
      .exists()) {
    return (true, <AssetImpl>[]);
  }
  final buildResult = await NativeAssetsBuildRunner(
    // This always runs in JIT mode.
    dartExecutable: Uri.file(sdk.dart),
    logger: logger(verbose),
  ).build(
    workingDirectory: workingDirectory,
    // When running in JIT mode, only the host OS needs to be build.
    target: Target.current,
    // When running in JIT mode, only dynamic libraries are supported.
    linkModePreference: LinkModePreferenceImpl.dynamic,
    // Dart has no concept of release vs debug, default to release.
    buildMode: BuildModeImpl.release,
    includeParentEnvironment: true,
    runPackageName: runPackageName,
    supportedAssetTypes: [
      NativeCodeAsset.type,
    ],
  );
  return (buildResult.success, buildResult.assets);
}

/// Compiles all native assets for host OS in JIT mode, and creates the
/// native assets yaml file.
///
/// If provided, only native assets of all transitive dependencies of
/// [runPackageName] are built.
///
/// Used in `dart run` and `dart test`.
Future<(bool success, Uri? nativeAssetsYaml)> compileNativeAssetsJitYamlFile({
  required bool verbose,
  String? runPackageName,
}) async {
  final (success, assets) = await compileNativeAssetsJit(
    verbose: verbose,
    runPackageName: runPackageName,
  );
  if (!success) {
    return (false, null);
  }
  final kernelAssets = KernelAssets([
    for (final asset in assets.whereType<NativeCodeAssetImpl>())
      _targetLocation(asset),
  ]);

  final workingDirectory = Directory.current.uri;
  final assetsUri = workingDirectory.resolve('.dart_tool/native_assets.yaml');
  final nativeAssetsYaml = '''# Native assets mapping for host OS in JIT mode.
# Generated by dartdev and package:native_assets_builder.
${kernelAssets.toNativeAssetsFile()}''';
  final assetFile = File(assetsUri.toFilePath());
  await assetFile.writeAsString(nativeAssetsYaml);
  return (true, assetsUri);
}

KernelAsset _targetLocation(NativeCodeAssetImpl asset) {
  final linkMode = asset.linkMode;
  final KernelAssetPath kernelAssetPath;
  switch (linkMode) {
    case DynamicLoadingSystemImpl _:
      kernelAssetPath = KernelAssetSystemPath(linkMode.uri);
    case LookupInExecutableImpl _:
      kernelAssetPath = KernelAssetInExecutable();
    case LookupInProcessImpl _:
      kernelAssetPath = KernelAssetInProcess();
    case DynamicLoadingBundledImpl _:
      kernelAssetPath = KernelAssetAbsolutePath(asset.file!);
    default:
      throw Exception(
        'Unsupported NativeCodeAsset linkMode ${linkMode.runtimeType} in asset $asset',
      );
  }
  return KernelAsset(
    id: asset.id,
    target: Target.fromArchitectureAndOS(asset.architecture!, asset.os),
    path: kernelAssetPath,
  );
}

Future<bool> warnOnNativeAssets() async {
  final workingDirectory = Directory.current.uri;
  if (!await File.fromUri(
          workingDirectory.resolve('.dart_tool/package_config.json'))
      .exists()) {
    // If `pub get` hasn't run, we can't know, so don't error.
    return false;
  }
  try {
    final packageLayout =
        await PackageLayout.fromRootPackageRoot(workingDirectory);
    final packagesWithNativeAssets =
        await packageLayout.packagesWithNativeAssets;
    if (packagesWithNativeAssets.isEmpty) {
      return false;
    }
    final packageNames = packagesWithNativeAssets.map((p) => p.name).join(' ');
    log.stderr(
      'Package(s) $packageNames require the native assets feature to be enabled. '
      'Enable native assets with `--enable-experiment=native-assets`.',
    );
  } on FormatException catch (e) {
    // This can be thrown if the package_config.json is malformed or has
    // duplicate entries.
    log.stderr(
      'Error encountered while parsing package_config.json: ${e.message}',
    );
  }
  return true;
}

Logger logger(bool verbose) => Logger('')
  ..onRecord.listen((LogRecord record) {
    final levelValue = record.level.value;
    if (levelValue >= Level.SEVERE.value) {
      log.stderr(record.message);
    } else if (levelValue >= Level.WARNING.value ||
        verbose && levelValue >= Level.INFO.value) {
      log.stdout(record.message);
    } else {
      // Note, this is ignored by default.
      log.trace(record.message);
    }
  });
