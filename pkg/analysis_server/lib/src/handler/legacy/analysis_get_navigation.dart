// Copyright (c) 2022, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:analysis_server/protocol/protocol.dart';
import 'package:analysis_server/protocol/protocol_generated.dart';
import 'package:analysis_server/src/analysis_server.dart';
import 'package:analysis_server/src/domain_abstract.dart';
import 'package:analysis_server/src/handler/legacy/legacy_handler.dart';
import 'package:analysis_server/src/plugin/result_merger.dart';
import 'package:analyzer/src/utilities/cancellation.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart' as plugin;
import 'package:analyzer_plugin/src/utilities/navigation/navigation.dart';
import 'package:analyzer_plugin/utilities/navigation/navigation_dart.dart';

/// The handler for the `analysis.getNavigation` request.
class AnalysisGetNavigationHandler extends LegacyHandler
    with RequestHandlerMixin<AnalysisServer> {
  /// Initialize a newly created handler to be able to service requests for the
  /// [server].
  AnalysisGetNavigationHandler(AnalysisServer server, Request request,
      CancellationToken cancellationToken)
      : super(server, request, cancellationToken);

  @override
  Future<void> handle() async {
    var params = AnalysisGetNavigationParams.fromRequest(request);
    var file = params.file;
    var offset = params.offset;
    var length = params.length;

    if (server.sendResponseErrorIfInvalidFilePath(request, file)) {
      return;
    }

    var driver = server.getAnalysisDriver(file);
    if (driver == null) {
      sendResponse(Response.getNavigationInvalidFile(request));
    } else {
      //
      // Allow plugins to start computing navigation data.
      //
      var requestParams =
          plugin.AnalysisGetNavigationParams(file, offset, length);
      var pluginFutures = server.pluginManager.broadcastRequest(
        requestParams,
        contextRoot: driver.analysisContext!.contextRoot,
      );
      //
      // Compute navigation data generated by server.
      //
      var allResults = <AnalysisNavigationParams>[];
      var result = await server.getResolvedUnit(file);
      if (result != null) {
        var unit = result.unit;
        var collector = NavigationCollectorImpl();
        computeDartNavigation(
            server.resourceProvider, collector, unit, offset, length);
        collector.createRegions();
        allResults.add(AnalysisNavigationParams(
            file, collector.regions, collector.targets, collector.files));
      }
      //
      // Add the navigation data produced by plugins to the server-generated
      // navigation data.
      //
      var responses = await waitForResponses(pluginFutures,
          requestParameters: requestParams);
      for (var response in responses) {
        var result = plugin.AnalysisGetNavigationResult.fromResponse(response);
        allResults.add(AnalysisNavigationParams(
            file, result.regions, result.targets, result.files));
      }
      //
      // Return the result.
      //
      var merger = ResultMerger();
      var mergedResults = merger.mergeNavigation(allResults);
      if (mergedResults == null) {
        sendResult(AnalysisGetNavigationResult(
            <String>[], <NavigationTarget>[], <NavigationRegion>[]));
      } else {
        sendResult(AnalysisGetNavigationResult(
            mergedResults.files, mergedResults.targets, mergedResults.regions));
      }
    }
  }
}
