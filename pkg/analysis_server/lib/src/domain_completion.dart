// Copyright (c) 2014, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:analysis_server/protocol/protocol.dart';
import 'package:analysis_server/protocol/protocol_constants.dart';
import 'package:analysis_server/protocol/protocol_generated.dart';
import 'package:analysis_server/src/analysis_server.dart';
import 'package:analysis_server/src/collections.dart';
import 'package:analysis_server/src/domain_abstract.dart';
import 'package:analysis_server/src/domains/completion/available_suggestions.dart';
import 'package:analysis_server/src/plugin/plugin_manager.dart';
import 'package:analysis_server/src/provisional/completion/completion_core.dart';
import 'package:analysis_server/src/services/completion/completion_performance.dart';
import 'package:analysis_server/src/services/completion/dart/completion_manager.dart';
import 'package:analysis_server/src/services/completion/dart/fuzzy_filter_sort.dart';
import 'package:analysis_server/src/services/completion/yaml/analysis_options_generator.dart';
import 'package:analysis_server/src/services/completion/yaml/fix_data_generator.dart';
import 'package:analysis_server/src/services/completion/yaml/pubspec_generator.dart';
import 'package:analysis_server/src/services/completion/yaml/yaml_completion_generator.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/exception/exception.dart';
import 'package:analyzer/src/generated/engine.dart';
import 'package:analyzer/src/util/file_paths.dart' as file_paths;
import 'package:analyzer/src/util/performance/operation_performance.dart';
import 'package:analyzer_plugin/protocol/protocol.dart' as plugin;
import 'package:analyzer_plugin/protocol/protocol_common.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart' as plugin;
import 'package:analyzer_plugin/utilities/change_builder/change_builder_core.dart';

/// Instances of the class [CompletionDomainHandler] implement a
/// [RequestHandler] that handles requests in the completion domain.
class CompletionDomainHandler extends AbstractRequestHandler {
  /// The time budget for a completion request.
  static const Duration _budgetDuration = Duration(milliseconds: 100);

  /// The maximum number of performance measurements to keep.
  static const int performanceListMaxLength = 50;

  /// The completion services that the client is currently subscribed.
  final Set<CompletionService> subscriptions = <CompletionService>{};

  /// The next completion response id.
  int _nextCompletionId = 0;

  /// Code completion performance for the last completion operation.
  CompletionPerformance? performance;

  /// A list of code completion performance measurements for the latest
  /// completion operation up to [performanceListMaxLength] measurements.
  final RecentBuffer<CompletionPerformance> performanceList =
      RecentBuffer<CompletionPerformance>(performanceListMaxLength);

  /// The current request being processed or `null` if none.
  DartCompletionRequest? _currentRequest;

  /// The identifiers of the latest `getSuggestionDetails` request.
  /// We use it to abort previous requests.
  int _latestGetSuggestionDetailsId = 0;

  /// Initialize a new request handler for the given [server].
  CompletionDomainHandler(AnalysisServer server) : super(server);

  /// Compute completion results for the given request and append them to the
  /// stream. Clients should not call this method directly as it is
  /// automatically called when a client listens to the stream returned by
  /// [results]. Subclasses should override this method, append at least one
  /// result to the [controller], and close the controller stream once complete.
  Future<List<CompletionSuggestion>> computeSuggestions({
    required CompletionBudget budget,
    required OperationPerformanceImpl performance,
    required DartCompletionRequest request,
    Set<ElementKind>? includedElementKinds,
    Set<String>? includedElementNames,
    List<IncludedSuggestionRelevanceTag>? includedSuggestionRelevanceTags,
    List<Uri>? librariesToImport,
  }) async {
    //
    // Allow plugins to start computing fixes.
    //
    var requestToPlugins = performance.run('askPlugins', (_) {
      return _sendRequestToPlugins(request);
    });

    //
    // Compute completions generated by server.
    //
    var suggestions = <CompletionSuggestion>[];
    await performance.runAsync('computeSuggestions', (performance) async {
      var manager = DartCompletionManager(
        includedElementKinds: includedElementKinds,
        includedElementNames: includedElementNames,
        includedSuggestionRelevanceTags: includedSuggestionRelevanceTags,
        librariesToImport: librariesToImport,
      );

      try {
        suggestions.addAll(
          await manager.computeSuggestions(request, performance),
        );
      } on AbortCompletion {
        suggestions.clear();
      }
    });
    // TODO (danrubel) if request is obsolete (processAnalysisRequest returns
    // false) then send empty results

    //
    // Add the completions produced by plugins to the server-generated list.
    //
    if (requestToPlugins != null) {
      await performance.runAsync('waitForPlugins', (_) async {
        await _addPluginSuggestions(budget, requestToPlugins, suggestions);
      });
    }

    return suggestions;
  }

  /// Return the suggestions that should be presented in the YAML [file] at the
  /// given [offset].
  YamlCompletionResults computeYamlSuggestions(String file, int offset) {
    var provider = server.resourceProvider;
    var pathContext = provider.pathContext;
    if (file_paths.isAnalysisOptionsYaml(pathContext, file)) {
      var generator = AnalysisOptionsGenerator(provider);
      return generator.getSuggestions(file, offset);
    } else if (file_paths.isFixDataYaml(pathContext, file)) {
      var generator = FixDataGenerator(provider);
      return generator.getSuggestions(file, offset);
    } else if (file_paths.isPubspecYaml(pathContext, file)) {
      var generator = PubspecGenerator(provider, server.pubPackageService);
      return generator.getSuggestions(file, offset);
    }
    return const YamlCompletionResults.empty();
  }

  /// Process a `completion.getSuggestionDetails` request.
  void getSuggestionDetails(Request request) async {
    var params = CompletionGetSuggestionDetailsParams.fromRequest(request);

    var file = params.file;
    if (server.sendResponseErrorIfInvalidFilePath(request, file)) {
      return;
    }

    var libraryId = params.id;
    var declarationsTracker = server.declarationsTracker;
    if (declarationsTracker == null) {
      server.sendResponse(Response.unsupportedFeature(
          request.id, 'Completion is not enabled.'));
      return;
    }
    var library = declarationsTracker.getLibrary(libraryId);
    if (library == null) {
      server.sendResponse(Response.invalidParameter(
        request,
        'libraryId',
        'No such library: $libraryId',
      ));
      return;
    }

    // The label might be `MyEnum.myValue`, but we import only `MyEnum`.
    var requestedName = params.label;
    if (requestedName.contains('.')) {
      requestedName = requestedName.substring(
        0,
        requestedName.indexOf('.'),
      );
    }

    const timeout = Duration(milliseconds: 1000);
    var timer = Stopwatch()..start();
    var id = ++_latestGetSuggestionDetailsId;
    while (id == _latestGetSuggestionDetailsId && timer.elapsed < timeout) {
      try {
        var analysisDriver = server.getAnalysisDriver(file);
        if (analysisDriver == null) {
          server.sendResponse(Response.fileNotAnalyzed(request, 'libraryId'));
          return;
        }
        var session = analysisDriver.currentSession;

        var completion = params.label;
        var builder = ChangeBuilder(session: session);
        await builder.addDartFileEdit(file, (builder) {
          var result = builder.importLibraryElement(library.uri);
          if (result.prefix != null) {
            completion = '${result.prefix}.$completion';
          }
        });

        server.sendResponse(
          CompletionGetSuggestionDetailsResult(
            completion,
            change: builder.sourceChange,
          ).toResponse(request.id),
        );
        return;
      } on InconsistentAnalysisException {
        // Loop around to try again.
      }
    }

    // Timeout or abort, send the empty response.
    server.sendResponse(
      CompletionGetSuggestionDetailsResult('').toResponse(request.id),
    );
  }

  /// Implement the 'completion.getSuggestions2' request.
  void getSuggestions2(Request request) async {
    var budget = CompletionBudget(_budgetDuration);

    var params = CompletionGetSuggestions2Params.fromRequest(request);
    var file = params.file;
    var offset = params.offset;

    var provider = server.resourceProvider;
    var pathContext = provider.pathContext;

    // TODO(scheglov) Support non-Dart files.
    if (!file_paths.isDart(pathContext, file)) {
      server.sendResponse(
        CompletionGetSuggestions2Result(offset, 0, [], [], false)
            .toResponse(request.id),
      );
      return;
    }

    var resolvedUnit = await server.getResolvedUnit(file);
    if (resolvedUnit == null) {
      server.sendResponse(Response.fileNotAnalyzed(request, file));
      return;
    }

    server.requestStatistics?.addItemTimeNow(request, 'resolvedUnit');

    if (offset < 0 || offset > resolvedUnit.content.length) {
      server.sendResponse(Response.invalidParameter(
          request,
          'params.offset',
          'Expected offset between 0 and source length inclusive,'
              ' but found $offset'));
      return;
    }

    final completionPerformance = CompletionPerformance();
    recordRequest(completionPerformance, file, resolvedUnit.content, offset);

    await completionPerformance.runRequestOperation((performance) async {
      var completionRequest = DartCompletionRequest(
        resolvedUnit: resolvedUnit,
        offset: offset,
        dartdocDirectiveInfo: server.getDartdocDirectiveInfoFor(
          resolvedUnit,
        ),
        documentationCache: server.getDocumentationCacheFor(resolvedUnit),
      );

      var librariesToImport = <Uri>[];
      var suggestions = await computeSuggestions(
        budget: budget,
        performance: performance,
        request: completionRequest,
        librariesToImport: librariesToImport,
      );

      performance.run('filter', (performance) {
        performance.getDataInt('count').add(suggestions.length);
        suggestions = fuzzyFilterSort(
          pattern: completionRequest.targetPrefix,
          suggestions: suggestions,
        );
        performance.getDataInt('matchCount').add(suggestions.length);
      });

      var lengthRestricted = suggestions.take(params.maxResults).toList();
      var isIncomplete = lengthRestricted.length < suggestions.length;
      completionPerformance.suggestionCount = lengthRestricted.length;

      server.sendResponse(
        CompletionGetSuggestions2Result(
          completionRequest.replacementOffset,
          completionRequest.replacementLength,
          lengthRestricted,
          librariesToImport.map((e) => '$e').toList(),
          isIncomplete,
        ).toResponse(request.id),
      );
    });
  }

  @override
  Response? handleRequest(Request request) {
    if (!server.options.featureSet.completion) {
      return Response.invalidParameter(
        request,
        'request',
        'The completion feature is not enabled',
      );
    }

    return runZonedGuarded<Response?>(() {
      var requestName = request.method;

      if (requestName == COMPLETION_REQUEST_GET_SUGGESTION_DETAILS) {
        getSuggestionDetails(request);
        return Response.DELAYED_RESPONSE;
      } else if (requestName == COMPLETION_REQUEST_GET_SUGGESTIONS) {
        processRequest(request);
        return Response.DELAYED_RESPONSE;
      } else if (requestName == COMPLETION_REQUEST_GET_SUGGESTIONS2) {
        getSuggestions2(request);
        return Response.DELAYED_RESPONSE;
      } else if (requestName == COMPLETION_REQUEST_SET_SUBSCRIPTIONS) {
        return setSubscriptions(request);
      }
      return null;
    }, (exception, stackTrace) {
      AnalysisEngine.instance.instrumentationService.logException(
          CaughtException.withMessage(
              'Failed to handle completion domain request: ${request.method}',
              exception,
              stackTrace));
    });
  }

  void ifMatchesRequestClear(DartCompletionRequest request) {
    if (_currentRequest == request) {
      _currentRequest = null;
    }
  }

  /// Process a `completion.getSuggestions` request.
  Future<void> processRequest(Request request) async {
    var budget = CompletionBudget(_budgetDuration);

    final performance = this.performance = CompletionPerformance();

    await performance.runRequestOperation((perf) async {
      // extract and validate params
      var params = CompletionGetSuggestionsParams.fromRequest(request);
      var file = params.file;
      var offset = params.offset;

      if (server.sendResponseErrorIfInvalidFilePath(request, file)) {
        return;
      }
      if (file.endsWith('.yaml')) {
        // Return the response without results.
        var completionId = (_nextCompletionId++).toString();
        server.sendResponse(CompletionGetSuggestionsResult(completionId)
            .toResponse(request.id));
        // Send a notification with results.
        final suggestions = computeYamlSuggestions(file, offset);
        sendCompletionNotification(
          completionId,
          suggestions.replacementOffset,
          suggestions.replacementLength,
          suggestions.suggestions,
          null,
          null,
          null,
          null,
        );
        return;
      } else if (!file.endsWith('.dart')) {
        // Return the response without results.
        var completionId = (_nextCompletionId++).toString();
        server.sendResponse(CompletionGetSuggestionsResult(completionId)
            .toResponse(request.id));
        // Send a notification with results.
        sendCompletionNotification(
            completionId, offset, 0, [], null, null, null, null);
        return;
      }

      var resolvedUnit = await server.getResolvedUnit(file);
      if (resolvedUnit == null) {
        server.sendResponse(Response.fileNotAnalyzed(request, 'params.offset'));
        return;
      }

      server.requestStatistics?.addItemTimeNow(request, 'resolvedUnit');

      if (offset < 0 || offset > resolvedUnit.content.length) {
        server.sendResponse(Response.invalidParameter(
            request,
            'params.offset',
            'Expected offset between 0 and source length inclusive,'
                ' but found $offset'));
        return;
      }

      recordRequest(performance, file, resolvedUnit.content, offset);

      var declarationsTracker = server.declarationsTracker;
      if (declarationsTracker == null) {
        server.sendResponse(Response.unsupportedFeature(
            request.id, 'Completion is not enabled.'));
        return;
      }

      var completionRequest = DartCompletionRequest(
        resolvedUnit: resolvedUnit,
        offset: offset,
        dartdocDirectiveInfo: server.getDartdocDirectiveInfoFor(
          resolvedUnit,
        ),
        documentationCache: server.getDocumentationCacheFor(resolvedUnit),
      );

      var completionId = (_nextCompletionId++).toString();

      setNewRequest(completionRequest);

      // initial response without results
      server.sendResponse(
          CompletionGetSuggestionsResult(completionId).toResponse(request.id));

      // If the client opted into using available suggestion sets,
      // create the kinds set, so signal the completion manager about opt-in.
      Set<ElementKind>? includedElementKinds;
      Set<String>? includedElementNames;
      List<IncludedSuggestionRelevanceTag>? includedSuggestionRelevanceTags;
      if (subscriptions.contains(CompletionService.AVAILABLE_SUGGESTION_SETS)) {
        includedElementKinds = <ElementKind>{};
        includedElementNames = <String>{};
        includedSuggestionRelevanceTags = <IncludedSuggestionRelevanceTag>[];
      }

      // Compute suggestions in the background
      try {
        var suggestions = await computeSuggestions(
          budget: budget,
          performance: perf,
          request: completionRequest,
          includedElementKinds: includedElementKinds,
          includedElementNames: includedElementNames,
          includedSuggestionRelevanceTags: includedSuggestionRelevanceTags,
        );
        String? libraryFile;
        var includedSuggestionSets = <IncludedSuggestionSet>[];
        if (includedElementKinds != null && includedElementNames != null) {
          libraryFile = resolvedUnit.libraryElement.source.fullName;
          server.sendNotification(
            createExistingImportsNotification(resolvedUnit),
          );
          computeIncludedSetList(
            declarationsTracker,
            resolvedUnit,
            includedSuggestionSets,
            includedElementNames,
          );
        }

        const SEND_NOTIFICATION_TAG = 'send notification';
        perf.run(SEND_NOTIFICATION_TAG, (_) {
          sendCompletionNotification(
            completionId,
            completionRequest.replacementOffset,
            completionRequest.replacementLength,
            suggestions,
            libraryFile,
            includedSuggestionSets,
            includedElementKinds?.toList(),
            includedSuggestionRelevanceTags,
          );
        });

        performance.suggestionCount = suggestions.length;
      } finally {
        ifMatchesRequestClear(completionRequest);
      }
    });
  }

  /// If tracking code completion performance over time, then
  /// record addition information about the request in the performance record.
  void recordRequest(CompletionPerformance performance, String path,
      String content, int offset) {
    performance.path = path;
    if (performanceListMaxLength == 0) {
      return;
    }
    performance.setContentsAndOffset(content, offset);
    performanceList.add(performance);
  }

  /// Send completion notification results.
  void sendCompletionNotification(
    String completionId,
    int replacementOffset,
    int replacementLength,
    List<CompletionSuggestion> results,
    String? libraryFile,
    List<IncludedSuggestionSet>? includedSuggestionSets,
    List<ElementKind>? includedElementKinds,
    List<IncludedSuggestionRelevanceTag>? includedSuggestionRelevanceTags,
  ) {
    server.sendNotification(
      CompletionResultsParams(
        completionId,
        replacementOffset,
        replacementLength,
        results,
        true,
        libraryFile: libraryFile,
        includedSuggestionSets: includedSuggestionSets,
        includedElementKinds: includedElementKinds,
        includedSuggestionRelevanceTags: includedSuggestionRelevanceTags,
      ).toNotification(),
    );
  }

  void setNewRequest(DartCompletionRequest request) {
    _abortCurrentRequest();
    _currentRequest = request;
  }

  /// Implement the 'completion.setSubscriptions' request.
  Response setSubscriptions(Request request) {
    var params = CompletionSetSubscriptionsParams.fromRequest(request);

    subscriptions.clear();
    subscriptions.addAll(params.subscriptions);

    var data = server.declarationsTrackerData;
    if (data != null) {
      if (subscriptions.contains(CompletionService.AVAILABLE_SUGGESTION_SETS)) {
        var soFarLibraries = data.startListening((change) {
          server.sendNotification(
            createCompletionAvailableSuggestionsNotification(
              change.changed,
              change.removed,
            ),
          );
        });
        server.sendNotification(
          createCompletionAvailableSuggestionsNotification(
            soFarLibraries,
            [],
          ),
        );
      } else {
        data.stopListening();
      }
    }
    return CompletionSetSubscriptionsResult().toResponse(request.id);
  }

  /// Abort the current completion request, if any.
  void _abortCurrentRequest() {
    var currentRequest = _currentRequest;
    if (currentRequest != null) {
      currentRequest.abort();
      _currentRequest = null;
    }
  }

  /// Add the completions produced by plugins to the server-generated list.
  Future<void> _addPluginSuggestions(
    CompletionBudget budget,
    _RequestToPlugins requestToPlugins,
    List<CompletionSuggestion> suggestions,
  ) async {
    var responses = await waitForResponses(
      requestToPlugins.futures,
      requestParameters: requestToPlugins.parameters,
      timeout: budget.left,
    );
    for (var response in responses) {
      var result = plugin.CompletionGetSuggestionsResult.fromResponse(response);
      if (result.results.isNotEmpty) {
        var completionRequest = requestToPlugins.completionRequest;
        if (completionRequest.replacementOffset != result.replacementOffset &&
            completionRequest.replacementLength != result.replacementLength) {
          server.instrumentationService
              .logError('Plugin completion-results dropped due to conflicting'
                  ' replacement offset/length: ${result.toJson()}');
          continue;
        }
        suggestions.addAll(result.results);
      }
    }
  }

  /// Send the completion request to plugins, so that they work in other
  /// isolates in parallel with the server isolate.
  _RequestToPlugins? _sendRequestToPlugins(
    DartCompletionRequest completionRequest,
  ) {
    var resolvedUnit = completionRequest.result;
    var analysisContext = resolvedUnit.session.analysisContext;

    var pluginRequestParameters = plugin.CompletionGetSuggestionsParams(
      resolvedUnit.path,
      completionRequest.offset,
    );

    return _RequestToPlugins(
      completionRequest: completionRequest,
      parameters: pluginRequestParameters,
      futures: server.pluginManager.broadcastRequest(
        pluginRequestParameters,
        contextRoot: analysisContext.contextRoot,
      ),
    );
  }
}

/// The result of computing suggestions for code completion.
class CompletionResult {
  /// The length of the text to be replaced if the remainder of the identifier
  /// containing the cursor is to be replaced when the suggestion is applied
  /// (that is, the number of characters in the existing identifier).
  final int replacementLength;

  /// The offset of the start of the text to be replaced. This will be different
  /// than the offset used to request the completion suggestions if there was a
  /// portion of an identifier before the original offset. In particular, the
  /// replacementOffset will be the offset of the beginning of said identifier.
  final int replacementOffset;

  /// The suggested completions.
  final List<CompletionSuggestion> suggestions;

  CompletionResult(
      this.replacementOffset, this.replacementLength, this.suggestions);
}

class _RequestToPlugins {
  final DartCompletionRequest completionRequest;
  final plugin.CompletionGetSuggestionsParams parameters;
  final Map<PluginInfo, Future<plugin.Response>> futures;

  _RequestToPlugins({
    required this.completionRequest,
    required this.parameters,
    required this.futures,
  });
}
