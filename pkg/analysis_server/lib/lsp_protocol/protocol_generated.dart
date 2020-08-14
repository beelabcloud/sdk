// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file has been automatically generated. Please do not edit it manually.
// To regenerate the file, use the script
// "pkg/analysis_server/tool/lsp_spec/generate_all.dart".

// ignore_for_file: annotate_overrides
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unnecessary_brace_in_string_interps
// ignore_for_file: unused_import
// ignore_for_file: unused_shown_name

import 'dart:core' hide deprecated;
import 'dart:core' as core show deprecated;
import 'dart:convert' show JsonEncoder;
import 'package:analysis_server/lsp_protocol/protocol_custom_generated.dart';
import 'package:analysis_server/lsp_protocol/protocol_special.dart';
import 'package:analysis_server/src/lsp/json_parsing.dart';
import 'package:analysis_server/src/protocol/protocol_internal.dart'
    show listEqual, mapEqual;
import 'package:analyzer/src/generated/utilities_general.dart';
import 'package:meta/meta.dart';

const jsonEncoder = JsonEncoder.withIndent('    ');

class ApplyWorkspaceEditParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ApplyWorkspaceEditParams.canParse, ApplyWorkspaceEditParams.fromJson);

  ApplyWorkspaceEditParams({this.label, @required this.edit}) {
    if (edit == null) {
      throw 'edit is required but was not provided';
    }
  }
  static ApplyWorkspaceEditParams fromJson(Map<String, dynamic> json) {
    final label = json['label'];
    final edit =
        json['edit'] != null ? WorkspaceEdit.fromJson(json['edit']) : null;
    return ApplyWorkspaceEditParams(label: label, edit: edit);
  }

  /// The edits to apply.
  final WorkspaceEdit edit;

  /// An optional label of the workspace edit. This label is presented in the
  /// user interface for example on an undo stack to undo the workspace edit.
  final String label;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (label != null) {
      __result['label'] = label;
    }
    __result['edit'] = edit ?? (throw 'edit is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('label');
      try {
        if (obj['label'] != null && !(obj['label'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('edit');
      try {
        if (!obj.containsKey('edit')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['edit'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(WorkspaceEdit.canParse(obj['edit'], reporter))) {
          reporter.reportError('must be of type WorkspaceEdit');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ApplyWorkspaceEditParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ApplyWorkspaceEditParams &&
        other.runtimeType == ApplyWorkspaceEditParams) {
      return label == other.label && edit == other.edit && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, label.hashCode);
    hash = JenkinsSmiHash.combine(hash, edit.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ApplyWorkspaceEditResponse implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ApplyWorkspaceEditResponse.canParse, ApplyWorkspaceEditResponse.fromJson);

  ApplyWorkspaceEditResponse({@required this.applied, this.failureReason}) {
    if (applied == null) {
      throw 'applied is required but was not provided';
    }
  }
  static ApplyWorkspaceEditResponse fromJson(Map<String, dynamic> json) {
    final applied = json['applied'];
    final failureReason = json['failureReason'];
    return ApplyWorkspaceEditResponse(
        applied: applied, failureReason: failureReason);
  }

  /// Indicates whether the edit was applied or not.
  final bool applied;

  /// An optional textual description for why the edit was not applied. This may
  /// be used may be used by the server for diagnostic logging or to provide a
  /// suitable error for a request that triggered the edit.
  final String failureReason;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['applied'] =
        applied ?? (throw 'applied is required but was not set');
    if (failureReason != null) {
      __result['failureReason'] = failureReason;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('applied');
      try {
        if (!obj.containsKey('applied')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['applied'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['applied'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('failureReason');
      try {
        if (obj['failureReason'] != null && !(obj['failureReason'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ApplyWorkspaceEditResponse');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ApplyWorkspaceEditResponse &&
        other.runtimeType == ApplyWorkspaceEditResponse) {
      return applied == other.applied &&
          failureReason == other.failureReason &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, applied.hashCode);
    hash = JenkinsSmiHash.combine(hash, failureReason.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CancelParams implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CancelParams.canParse, CancelParams.fromJson);

  CancelParams({@required this.id}) {
    if (id == null) {
      throw 'id is required but was not provided';
    }
  }
  static CancelParams fromJson(Map<String, dynamic> json) {
    final id = json['id'] is num
        ? Either2<num, String>.t1(json['id'])
        : (json['id'] is String
            ? Either2<num, String>.t2(json['id'])
            : (throw '''${json['id']} was not one of (num, String)'''));
    return CancelParams(id: id);
  }

  /// The request id to cancel.
  final Either2<num, String> id;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['id'] = id ?? (throw 'id is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('id');
      try {
        if (!obj.containsKey('id')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['id'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['id'] is num || obj['id'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CancelParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CancelParams && other.runtimeType == CancelParams) {
      return id == other.id && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ClientCapabilities implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ClientCapabilities.canParse, ClientCapabilities.fromJson);

  ClientCapabilities(
      {this.workspace, this.textDocument, this.window, this.experimental});
  static ClientCapabilities fromJson(Map<String, dynamic> json) {
    final workspace = json['workspace'] != null
        ? ClientCapabilitiesWorkspace.fromJson(json['workspace'])
        : null;
    final textDocument = json['textDocument'] != null
        ? TextDocumentClientCapabilities.fromJson(json['textDocument'])
        : null;
    final window = json['window'] != null
        ? ClientCapabilitiesWindow.fromJson(json['window'])
        : null;
    final experimental = json['experimental'];
    return ClientCapabilities(
        workspace: workspace,
        textDocument: textDocument,
        window: window,
        experimental: experimental);
  }

  /// Experimental client capabilities.
  final dynamic experimental;

  /// Text document specific client capabilities.
  final TextDocumentClientCapabilities textDocument;

  /// Window specific client capabilities.
  final ClientCapabilitiesWindow window;

  /// Workspace specific client capabilities.
  final ClientCapabilitiesWorkspace workspace;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workspace != null) {
      __result['workspace'] = workspace;
    }
    if (textDocument != null) {
      __result['textDocument'] = textDocument;
    }
    if (window != null) {
      __result['window'] = window;
    }
    if (experimental != null) {
      __result['experimental'] = experimental;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workspace');
      try {
        if (obj['workspace'] != null &&
            !(ClientCapabilitiesWorkspace.canParse(
                obj['workspace'], reporter))) {
          reporter.reportError('must be of type ClientCapabilitiesWorkspace');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('textDocument');
      try {
        if (obj['textDocument'] != null &&
            !(TextDocumentClientCapabilities.canParse(
                obj['textDocument'], reporter))) {
          reporter
              .reportError('must be of type TextDocumentClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('window');
      try {
        if (obj['window'] != null &&
            !(ClientCapabilitiesWindow.canParse(obj['window'], reporter))) {
          reporter.reportError('must be of type ClientCapabilitiesWindow');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('experimental');
      try {
        if (obj['experimental'] != null && !(true)) {
          reporter.reportError('must be of type dynamic');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ClientCapabilities &&
        other.runtimeType == ClientCapabilities) {
      return workspace == other.workspace &&
          textDocument == other.textDocument &&
          window == other.window &&
          experimental == other.experimental &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workspace.hashCode);
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, window.hashCode);
    hash = JenkinsSmiHash.combine(hash, experimental.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ClientCapabilitiesWindow implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ClientCapabilitiesWindow.canParse, ClientCapabilitiesWindow.fromJson);

  ClientCapabilitiesWindow({this.workDoneProgress});
  static ClientCapabilitiesWindow fromJson(Map<String, dynamic> json) {
    final workDoneProgress = json['workDoneProgress'];
    return ClientCapabilitiesWindow(workDoneProgress: workDoneProgress);
  }

  /// Whether client supports handling progress notifications. If set servers
  /// are allowed to report in `workDoneProgress` property in the request
  /// specific server capabilities.
  ///
  /// Since 3.15.0
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ClientCapabilitiesWindow');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ClientCapabilitiesWindow &&
        other.runtimeType == ClientCapabilitiesWindow) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ClientCapabilitiesWorkspace implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ClientCapabilitiesWorkspace.canParse,
      ClientCapabilitiesWorkspace.fromJson);

  ClientCapabilitiesWorkspace(
      {this.applyEdit,
      this.workspaceEdit,
      this.didChangeConfiguration,
      this.didChangeWatchedFiles,
      this.symbol,
      this.executeCommand,
      this.workspaceFolders,
      this.configuration});
  static ClientCapabilitiesWorkspace fromJson(Map<String, dynamic> json) {
    final applyEdit = json['applyEdit'];
    final workspaceEdit = json['workspaceEdit'] != null
        ? WorkspaceEditClientCapabilities.fromJson(json['workspaceEdit'])
        : null;
    final didChangeConfiguration = json['didChangeConfiguration'] != null
        ? DidChangeConfigurationClientCapabilities.fromJson(
            json['didChangeConfiguration'])
        : null;
    final didChangeWatchedFiles = json['didChangeWatchedFiles'] != null
        ? DidChangeWatchedFilesClientCapabilities.fromJson(
            json['didChangeWatchedFiles'])
        : null;
    final symbol = json['symbol'] != null
        ? WorkspaceSymbolClientCapabilities.fromJson(json['symbol'])
        : null;
    final executeCommand = json['executeCommand'] != null
        ? ExecuteCommandClientCapabilities.fromJson(json['executeCommand'])
        : null;
    final workspaceFolders = json['workspaceFolders'];
    final configuration = json['configuration'];
    return ClientCapabilitiesWorkspace(
        applyEdit: applyEdit,
        workspaceEdit: workspaceEdit,
        didChangeConfiguration: didChangeConfiguration,
        didChangeWatchedFiles: didChangeWatchedFiles,
        symbol: symbol,
        executeCommand: executeCommand,
        workspaceFolders: workspaceFolders,
        configuration: configuration);
  }

  /// The client supports applying batch edits to the workspace by supporting
  /// the request 'workspace/applyEdit'
  final bool applyEdit;

  /// The client supports `workspace/configuration` requests.
  ///
  /// Since 3.6.0
  final bool configuration;

  /// Capabilities specific to the `workspace/didChangeConfiguration`
  /// notification.
  final DidChangeConfigurationClientCapabilities didChangeConfiguration;

  /// Capabilities specific to the `workspace/didChangeWatchedFiles`
  /// notification.
  final DidChangeWatchedFilesClientCapabilities didChangeWatchedFiles;

  /// Capabilities specific to the `workspace/executeCommand` request.
  final ExecuteCommandClientCapabilities executeCommand;

  /// Capabilities specific to the `workspace/symbol` request.
  final WorkspaceSymbolClientCapabilities symbol;

  /// Capabilities specific to `WorkspaceEdit`s
  final WorkspaceEditClientCapabilities workspaceEdit;

  /// The client has support for workspace folders.
  ///
  /// Since 3.6.0
  final bool workspaceFolders;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (applyEdit != null) {
      __result['applyEdit'] = applyEdit;
    }
    if (workspaceEdit != null) {
      __result['workspaceEdit'] = workspaceEdit;
    }
    if (didChangeConfiguration != null) {
      __result['didChangeConfiguration'] = didChangeConfiguration;
    }
    if (didChangeWatchedFiles != null) {
      __result['didChangeWatchedFiles'] = didChangeWatchedFiles;
    }
    if (symbol != null) {
      __result['symbol'] = symbol;
    }
    if (executeCommand != null) {
      __result['executeCommand'] = executeCommand;
    }
    if (workspaceFolders != null) {
      __result['workspaceFolders'] = workspaceFolders;
    }
    if (configuration != null) {
      __result['configuration'] = configuration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('applyEdit');
      try {
        if (obj['applyEdit'] != null && !(obj['applyEdit'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workspaceEdit');
      try {
        if (obj['workspaceEdit'] != null &&
            !(WorkspaceEditClientCapabilities.canParse(
                obj['workspaceEdit'], reporter))) {
          reporter
              .reportError('must be of type WorkspaceEditClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('didChangeConfiguration');
      try {
        if (obj['didChangeConfiguration'] != null &&
            !(DidChangeConfigurationClientCapabilities.canParse(
                obj['didChangeConfiguration'], reporter))) {
          reporter.reportError(
              'must be of type DidChangeConfigurationClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('didChangeWatchedFiles');
      try {
        if (obj['didChangeWatchedFiles'] != null &&
            !(DidChangeWatchedFilesClientCapabilities.canParse(
                obj['didChangeWatchedFiles'], reporter))) {
          reporter.reportError(
              'must be of type DidChangeWatchedFilesClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('symbol');
      try {
        if (obj['symbol'] != null &&
            !(WorkspaceSymbolClientCapabilities.canParse(
                obj['symbol'], reporter))) {
          reporter
              .reportError('must be of type WorkspaceSymbolClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('executeCommand');
      try {
        if (obj['executeCommand'] != null &&
            !(ExecuteCommandClientCapabilities.canParse(
                obj['executeCommand'], reporter))) {
          reporter
              .reportError('must be of type ExecuteCommandClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workspaceFolders');
      try {
        if (obj['workspaceFolders'] != null &&
            !(obj['workspaceFolders'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('configuration');
      try {
        if (obj['configuration'] != null && !(obj['configuration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ClientCapabilitiesWorkspace');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ClientCapabilitiesWorkspace &&
        other.runtimeType == ClientCapabilitiesWorkspace) {
      return applyEdit == other.applyEdit &&
          workspaceEdit == other.workspaceEdit &&
          didChangeConfiguration == other.didChangeConfiguration &&
          didChangeWatchedFiles == other.didChangeWatchedFiles &&
          symbol == other.symbol &&
          executeCommand == other.executeCommand &&
          workspaceFolders == other.workspaceFolders &&
          configuration == other.configuration &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, applyEdit.hashCode);
    hash = JenkinsSmiHash.combine(hash, workspaceEdit.hashCode);
    hash = JenkinsSmiHash.combine(hash, didChangeConfiguration.hashCode);
    hash = JenkinsSmiHash.combine(hash, didChangeWatchedFiles.hashCode);
    hash = JenkinsSmiHash.combine(hash, symbol.hashCode);
    hash = JenkinsSmiHash.combine(hash, executeCommand.hashCode);
    hash = JenkinsSmiHash.combine(hash, workspaceFolders.hashCode);
    hash = JenkinsSmiHash.combine(hash, configuration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// A code action represents a change that can be performed in code, e.g. to fix
/// a problem or to refactor code.
///
/// A CodeAction must set either `edit` and/or a `command`. If both are
/// supplied, the `edit` is applied first, then the `command` is executed.
class CodeAction implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CodeAction.canParse, CodeAction.fromJson);

  CodeAction(
      {@required this.title,
      this.kind,
      this.diagnostics,
      this.isPreferred,
      this.edit,
      this.command}) {
    if (title == null) {
      throw 'title is required but was not provided';
    }
  }
  static CodeAction fromJson(Map<String, dynamic> json) {
    final title = json['title'];
    final kind =
        json['kind'] != null ? CodeActionKind.fromJson(json['kind']) : null;
    final diagnostics = json['diagnostics']
        ?.map((item) => item != null ? Diagnostic.fromJson(item) : null)
        ?.cast<Diagnostic>()
        ?.toList();
    final isPreferred = json['isPreferred'];
    final edit =
        json['edit'] != null ? WorkspaceEdit.fromJson(json['edit']) : null;
    final command =
        json['command'] != null ? Command.fromJson(json['command']) : null;
    return CodeAction(
        title: title,
        kind: kind,
        diagnostics: diagnostics,
        isPreferred: isPreferred,
        edit: edit,
        command: command);
  }

  /// A command this code action executes. If a code action provides an edit and
  /// a command, first the edit is executed and then the command.
  final Command command;

  /// The diagnostics that this code action resolves.
  final List<Diagnostic> diagnostics;

  /// The workspace edit this code action performs.
  final WorkspaceEdit edit;

  /// Marks this as a preferred action. Preferred actions are used by the `auto
  /// fix` command and can be targeted by keybindings.
  ///
  /// A quick fix should be marked preferred if it properly addresses the
  /// underlying error. A refactoring should be marked preferred if it is the
  /// most reasonable choice of actions to take.
  ///  @since 3.15.0
  final bool isPreferred;

  /// The kind of the code action.
  ///
  /// Used to filter code actions.
  final CodeActionKind kind;

  /// A short, human-readable, title for this code action.
  final String title;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['title'] = title ?? (throw 'title is required but was not set');
    if (kind != null) {
      __result['kind'] = kind;
    }
    if (diagnostics != null) {
      __result['diagnostics'] = diagnostics;
    }
    if (isPreferred != null) {
      __result['isPreferred'] = isPreferred;
    }
    if (edit != null) {
      __result['edit'] = edit;
    }
    if (command != null) {
      __result['command'] = command;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('title');
      try {
        if (!obj.containsKey('title')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['title'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['title'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('kind');
      try {
        if (obj['kind'] != null &&
            !(CodeActionKind.canParse(obj['kind'], reporter))) {
          reporter.reportError('must be of type CodeActionKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('diagnostics');
      try {
        if (obj['diagnostics'] != null &&
            !((obj['diagnostics'] is List &&
                (obj['diagnostics']
                    .every((item) => Diagnostic.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<Diagnostic>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('isPreferred');
      try {
        if (obj['isPreferred'] != null && !(obj['isPreferred'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('edit');
      try {
        if (obj['edit'] != null &&
            !(WorkspaceEdit.canParse(obj['edit'], reporter))) {
          reporter.reportError('must be of type WorkspaceEdit');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('command');
      try {
        if (obj['command'] != null &&
            !(Command.canParse(obj['command'], reporter))) {
          reporter.reportError('must be of type Command');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeAction');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeAction && other.runtimeType == CodeAction) {
      return title == other.title &&
          kind == other.kind &&
          listEqual(diagnostics, other.diagnostics,
              (Diagnostic a, Diagnostic b) => a == b) &&
          isPreferred == other.isPreferred &&
          edit == other.edit &&
          command == other.command &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, title.hashCode);
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(diagnostics));
    hash = JenkinsSmiHash.combine(hash, isPreferred.hashCode);
    hash = JenkinsSmiHash.combine(hash, edit.hashCode);
    hash = JenkinsSmiHash.combine(hash, command.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CodeActionClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CodeActionClientCapabilities.canParse,
      CodeActionClientCapabilities.fromJson);

  CodeActionClientCapabilities(
      {this.dynamicRegistration,
      this.codeActionLiteralSupport,
      this.isPreferredSupport});
  static CodeActionClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final codeActionLiteralSupport = json['codeActionLiteralSupport'] != null
        ? CodeActionClientCapabilitiesCodeActionLiteralSupport.fromJson(
            json['codeActionLiteralSupport'])
        : null;
    final isPreferredSupport = json['isPreferredSupport'];
    return CodeActionClientCapabilities(
        dynamicRegistration: dynamicRegistration,
        codeActionLiteralSupport: codeActionLiteralSupport,
        isPreferredSupport: isPreferredSupport);
  }

  /// The client supports code action literals as a valid response of the
  /// `textDocument/codeAction` request.
  ///  @since 3.8.0
  final CodeActionClientCapabilitiesCodeActionLiteralSupport
      codeActionLiteralSupport;

  /// Whether code action supports dynamic registration.
  final bool dynamicRegistration;

  /// Whether code action supports the `isPreferred` property. @since 3.15.0
  final bool isPreferredSupport;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (codeActionLiteralSupport != null) {
      __result['codeActionLiteralSupport'] = codeActionLiteralSupport;
    }
    if (isPreferredSupport != null) {
      __result['isPreferredSupport'] = isPreferredSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('codeActionLiteralSupport');
      try {
        if (obj['codeActionLiteralSupport'] != null &&
            !(CodeActionClientCapabilitiesCodeActionLiteralSupport.canParse(
                obj['codeActionLiteralSupport'], reporter))) {
          reporter.reportError(
              'must be of type CodeActionClientCapabilitiesCodeActionLiteralSupport');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('isPreferredSupport');
      try {
        if (obj['isPreferredSupport'] != null &&
            !(obj['isPreferredSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeActionClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeActionClientCapabilities &&
        other.runtimeType == CodeActionClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          codeActionLiteralSupport == other.codeActionLiteralSupport &&
          isPreferredSupport == other.isPreferredSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, codeActionLiteralSupport.hashCode);
    hash = JenkinsSmiHash.combine(hash, isPreferredSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CodeActionClientCapabilitiesCodeActionKind implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CodeActionClientCapabilitiesCodeActionKind.canParse,
      CodeActionClientCapabilitiesCodeActionKind.fromJson);

  CodeActionClientCapabilitiesCodeActionKind({@required this.valueSet}) {
    if (valueSet == null) {
      throw 'valueSet is required but was not provided';
    }
  }
  static CodeActionClientCapabilitiesCodeActionKind fromJson(
      Map<String, dynamic> json) {
    final valueSet = json['valueSet']
        ?.map((item) => item != null ? CodeActionKind.fromJson(item) : null)
        ?.cast<CodeActionKind>()
        ?.toList();
    return CodeActionClientCapabilitiesCodeActionKind(valueSet: valueSet);
  }

  /// The code action kind values the client supports. When this property exists
  /// the client also guarantees that it will handle values outside its set
  /// gracefully and falls back to a default value when unknown.
  final List<CodeActionKind> valueSet;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['valueSet'] =
        valueSet ?? (throw 'valueSet is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('valueSet');
      try {
        if (!obj.containsKey('valueSet')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['valueSet'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['valueSet'] is List &&
            (obj['valueSet']
                .every((item) => CodeActionKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<CodeActionKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type CodeActionClientCapabilitiesCodeActionKind');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeActionClientCapabilitiesCodeActionKind &&
        other.runtimeType == CodeActionClientCapabilitiesCodeActionKind) {
      return listEqual(valueSet, other.valueSet,
              (CodeActionKind a, CodeActionKind b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(valueSet));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CodeActionClientCapabilitiesCodeActionLiteralSupport
    implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CodeActionClientCapabilitiesCodeActionLiteralSupport.canParse,
      CodeActionClientCapabilitiesCodeActionLiteralSupport.fromJson);

  CodeActionClientCapabilitiesCodeActionLiteralSupport(
      {@required this.codeActionKind}) {
    if (codeActionKind == null) {
      throw 'codeActionKind is required but was not provided';
    }
  }
  static CodeActionClientCapabilitiesCodeActionLiteralSupport fromJson(
      Map<String, dynamic> json) {
    final codeActionKind = json['codeActionKind'] != null
        ? CodeActionClientCapabilitiesCodeActionKind.fromJson(
            json['codeActionKind'])
        : null;
    return CodeActionClientCapabilitiesCodeActionLiteralSupport(
        codeActionKind: codeActionKind);
  }

  /// The code action kind is supported with the following value set.
  final CodeActionClientCapabilitiesCodeActionKind codeActionKind;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['codeActionKind'] =
        codeActionKind ?? (throw 'codeActionKind is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('codeActionKind');
      try {
        if (!obj.containsKey('codeActionKind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['codeActionKind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(CodeActionClientCapabilitiesCodeActionKind.canParse(
            obj['codeActionKind'], reporter))) {
          reporter.reportError(
              'must be of type CodeActionClientCapabilitiesCodeActionKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type CodeActionClientCapabilitiesCodeActionLiteralSupport');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeActionClientCapabilitiesCodeActionLiteralSupport &&
        other.runtimeType ==
            CodeActionClientCapabilitiesCodeActionLiteralSupport) {
      return codeActionKind == other.codeActionKind && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, codeActionKind.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Contains additional diagnostic information about the context in which a code
/// action is run.
class CodeActionContext implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CodeActionContext.canParse, CodeActionContext.fromJson);

  CodeActionContext({@required this.diagnostics, this.only}) {
    if (diagnostics == null) {
      throw 'diagnostics is required but was not provided';
    }
  }
  static CodeActionContext fromJson(Map<String, dynamic> json) {
    final diagnostics = json['diagnostics']
        ?.map((item) => item != null ? Diagnostic.fromJson(item) : null)
        ?.cast<Diagnostic>()
        ?.toList();
    final only = json['only']
        ?.map((item) => item != null ? CodeActionKind.fromJson(item) : null)
        ?.cast<CodeActionKind>()
        ?.toList();
    return CodeActionContext(diagnostics: diagnostics, only: only);
  }

  /// An array of diagnostics known on the client side overlapping the range
  /// provided to the `textDocument/codeAction` request. They are provided so
  /// that the server knows which errors are currently presented to the user for
  /// the given range. There is no guarantee that these accurately reflect the
  /// error state of the resource. The primary parameter to compute code actions
  /// is the provided range.
  final List<Diagnostic> diagnostics;

  /// Requested kind of actions to return.
  ///
  /// Actions not of this kind are filtered out by the client before being
  /// shown. So servers can omit computing them.
  final List<CodeActionKind> only;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['diagnostics'] =
        diagnostics ?? (throw 'diagnostics is required but was not set');
    if (only != null) {
      __result['only'] = only;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('diagnostics');
      try {
        if (!obj.containsKey('diagnostics')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['diagnostics'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['diagnostics'] is List &&
            (obj['diagnostics']
                .every((item) => Diagnostic.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<Diagnostic>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('only');
      try {
        if (obj['only'] != null &&
            !((obj['only'] is List &&
                (obj['only'].every(
                    (item) => CodeActionKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<CodeActionKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeActionContext');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeActionContext && other.runtimeType == CodeActionContext) {
      return listEqual(diagnostics, other.diagnostics,
              (Diagnostic a, Diagnostic b) => a == b) &&
          listEqual(only, other.only,
              (CodeActionKind a, CodeActionKind b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(diagnostics));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(only));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// A set of predefined code action kinds.
class CodeActionKind {
  const CodeActionKind(this._value);
  const CodeActionKind.fromJson(this._value);

  final String _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is String;
  }

  /// Empty kind.
  static const Empty = CodeActionKind('');

  /// Base kind for quickfix actions: 'quickfix'.
  static const QuickFix = CodeActionKind('quickfix');

  /// Base kind for refactoring actions: 'refactor'.
  static const Refactor = CodeActionKind('refactor');

  /// Base kind for refactoring extraction actions: 'refactor.extract'.
  ///
  /// Example extract actions:
  ///
  /// - Extract method
  /// - Extract function
  /// - Extract variable
  /// - Extract interface from class
  /// - ...
  static const RefactorExtract = CodeActionKind('refactor.extract');

  /// Base kind for refactoring inline actions: 'refactor.inline'.
  ///
  /// Example inline actions:
  ///
  /// - Inline function
  /// - Inline variable
  /// - Inline constant
  /// - ...
  static const RefactorInline = CodeActionKind('refactor.inline');

  /// Base kind for refactoring rewrite actions: 'refactor.rewrite'.
  ///
  /// Example rewrite actions:
  ///
  /// - Convert JavaScript function to class
  /// - Add or remove parameter
  /// - Encapsulate field
  /// - Make method static
  /// - Move method to base class
  /// - ...
  static const RefactorRewrite = CodeActionKind('refactor.rewrite');

  /// Base kind for source actions: `source`.
  ///
  /// Source code actions apply to the entire file.
  static const Source = CodeActionKind('source');

  /// Base kind for an organize imports source action: `source.organizeImports`.
  static const SourceOrganizeImports = CodeActionKind('source.organizeImports');

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is CodeActionKind && o._value == _value;
}

class CodeActionOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CodeActionOptions.canParse, CodeActionOptions.fromJson);

  CodeActionOptions({this.codeActionKinds, this.workDoneProgress});
  static CodeActionOptions fromJson(Map<String, dynamic> json) {
    if (CodeActionRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return CodeActionRegistrationOptions.fromJson(json);
    }
    final codeActionKinds = json['codeActionKinds']
        ?.map((item) => item != null ? CodeActionKind.fromJson(item) : null)
        ?.cast<CodeActionKind>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return CodeActionOptions(
        codeActionKinds: codeActionKinds, workDoneProgress: workDoneProgress);
  }

  /// CodeActionKinds that this server may return.
  ///
  /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or
  /// the server may list out every specific kind they provide.
  final List<CodeActionKind> codeActionKinds;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (codeActionKinds != null) {
      __result['codeActionKinds'] = codeActionKinds;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('codeActionKinds');
      try {
        if (obj['codeActionKinds'] != null &&
            !((obj['codeActionKinds'] is List &&
                (obj['codeActionKinds'].every(
                    (item) => CodeActionKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<CodeActionKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeActionOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeActionOptions && other.runtimeType == CodeActionOptions) {
      return listEqual(codeActionKinds, other.codeActionKinds,
              (CodeActionKind a, CodeActionKind b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(codeActionKinds));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Params for the CodeActionRequest
class CodeActionParams
    implements WorkDoneProgressParams, PartialResultParams, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CodeActionParams.canParse, CodeActionParams.fromJson);

  CodeActionParams(
      {@required this.textDocument,
      @required this.range,
      @required this.context,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (range == null) {
      throw 'range is required but was not provided';
    }
    if (context == null) {
      throw 'context is required but was not provided';
    }
  }
  static CodeActionParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final context = json['context'] != null
        ? CodeActionContext.fromJson(json['context'])
        : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return CodeActionParams(
        textDocument: textDocument,
        range: range,
        context: context,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// Context carrying additional information.
  final CodeActionContext context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The range for which the command was invoked.
  final Range range;

  /// The document in which the command was invoked.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['range'] = range ?? (throw 'range is required but was not set');
    __result['context'] =
        context ?? (throw 'context is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('context');
      try {
        if (!obj.containsKey('context')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['context'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(CodeActionContext.canParse(obj['context'], reporter))) {
          reporter.reportError('must be of type CodeActionContext');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeActionParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeActionParams && other.runtimeType == CodeActionParams) {
      return textDocument == other.textDocument &&
          range == other.range &&
          context == other.context &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, context.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CodeActionRegistrationOptions
    implements TextDocumentRegistrationOptions, CodeActionOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CodeActionRegistrationOptions.canParse,
      CodeActionRegistrationOptions.fromJson);

  CodeActionRegistrationOptions(
      {this.documentSelector, this.codeActionKinds, this.workDoneProgress});
  static CodeActionRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final codeActionKinds = json['codeActionKinds']
        ?.map((item) => item != null ? CodeActionKind.fromJson(item) : null)
        ?.cast<CodeActionKind>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return CodeActionRegistrationOptions(
        documentSelector: documentSelector,
        codeActionKinds: codeActionKinds,
        workDoneProgress: workDoneProgress);
  }

  /// CodeActionKinds that this server may return.
  ///
  /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or
  /// the server may list out every specific kind they provide.
  final List<CodeActionKind> codeActionKinds;

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (codeActionKinds != null) {
      __result['codeActionKinds'] = codeActionKinds;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('codeActionKinds');
      try {
        if (obj['codeActionKinds'] != null &&
            !((obj['codeActionKinds'] is List &&
                (obj['codeActionKinds'].every(
                    (item) => CodeActionKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<CodeActionKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeActionRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeActionRegistrationOptions &&
        other.runtimeType == CodeActionRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          listEqual(codeActionKinds, other.codeActionKinds,
              (CodeActionKind a, CodeActionKind b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(codeActionKinds));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// A code lens represents a command that should be shown along with source
/// text, like the number of references, a way to run tests, etc.
///
/// A code lens is _unresolved_ when no command is associated to it. For
/// performance reasons the creation of a code lens and resolving should be done
/// in two stages.
class CodeLens implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CodeLens.canParse, CodeLens.fromJson);

  CodeLens({@required this.range, this.command, this.data}) {
    if (range == null) {
      throw 'range is required but was not provided';
    }
  }
  static CodeLens fromJson(Map<String, dynamic> json) {
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final command =
        json['command'] != null ? Command.fromJson(json['command']) : null;
    final data = json['data'];
    return CodeLens(range: range, command: command, data: data);
  }

  /// The command this code lens represents.
  final Command command;

  /// A data entry field that is preserved on a code lens item between a code
  /// lens and a code lens resolve request.
  final dynamic data;

  /// The range in which this code lens is valid. Should only span a single
  /// line.
  final Range range;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['range'] = range ?? (throw 'range is required but was not set');
    if (command != null) {
      __result['command'] = command;
    }
    if (data != null) {
      __result['data'] = data;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('command');
      try {
        if (obj['command'] != null &&
            !(Command.canParse(obj['command'], reporter))) {
          reporter.reportError('must be of type Command');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('data');
      try {
        if (obj['data'] != null && !(true)) {
          reporter.reportError('must be of type dynamic');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeLens');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeLens && other.runtimeType == CodeLens) {
      return range == other.range &&
          command == other.command &&
          data == other.data &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, command.hashCode);
    hash = JenkinsSmiHash.combine(hash, data.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CodeLensClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CodeLensClientCapabilities.canParse, CodeLensClientCapabilities.fromJson);

  CodeLensClientCapabilities({this.dynamicRegistration});
  static CodeLensClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return CodeLensClientCapabilities(dynamicRegistration: dynamicRegistration);
  }

  /// Whether code lens supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeLensClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeLensClientCapabilities &&
        other.runtimeType == CodeLensClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CodeLensOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CodeLensOptions.canParse, CodeLensOptions.fromJson);

  CodeLensOptions({this.resolveProvider, this.workDoneProgress});
  static CodeLensOptions fromJson(Map<String, dynamic> json) {
    if (CodeLensRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return CodeLensRegistrationOptions.fromJson(json);
    }
    final resolveProvider = json['resolveProvider'];
    final workDoneProgress = json['workDoneProgress'];
    return CodeLensOptions(
        resolveProvider: resolveProvider, workDoneProgress: workDoneProgress);
  }

  /// Code lens has a resolve provider as well.
  final bool resolveProvider;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (resolveProvider != null) {
      __result['resolveProvider'] = resolveProvider;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('resolveProvider');
      try {
        if (obj['resolveProvider'] != null &&
            !(obj['resolveProvider'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeLensOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeLensOptions && other.runtimeType == CodeLensOptions) {
      return resolveProvider == other.resolveProvider &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, resolveProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CodeLensParams
    implements WorkDoneProgressParams, PartialResultParams, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CodeLensParams.canParse, CodeLensParams.fromJson);

  CodeLensParams(
      {@required this.textDocument,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
  }
  static CodeLensParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return CodeLensParams(
        textDocument: textDocument,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The document to request code lens for.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeLensParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeLensParams && other.runtimeType == CodeLensParams) {
      return textDocument == other.textDocument &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CodeLensRegistrationOptions
    implements TextDocumentRegistrationOptions, CodeLensOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CodeLensRegistrationOptions.canParse,
      CodeLensRegistrationOptions.fromJson);

  CodeLensRegistrationOptions(
      {this.documentSelector, this.resolveProvider, this.workDoneProgress});
  static CodeLensRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final resolveProvider = json['resolveProvider'];
    final workDoneProgress = json['workDoneProgress'];
    return CodeLensRegistrationOptions(
        documentSelector: documentSelector,
        resolveProvider: resolveProvider,
        workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// Code lens has a resolve provider as well.
  final bool resolveProvider;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (resolveProvider != null) {
      __result['resolveProvider'] = resolveProvider;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('resolveProvider');
      try {
        if (obj['resolveProvider'] != null &&
            !(obj['resolveProvider'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CodeLensRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CodeLensRegistrationOptions &&
        other.runtimeType == CodeLensRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          resolveProvider == other.resolveProvider &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, resolveProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Represents a color in RGBA space.
class Color implements ToJsonable {
  static const jsonHandler = LspJsonHandler(Color.canParse, Color.fromJson);

  Color(
      {@required this.red,
      @required this.green,
      @required this.blue,
      @required this.alpha}) {
    if (red == null) {
      throw 'red is required but was not provided';
    }
    if (green == null) {
      throw 'green is required but was not provided';
    }
    if (blue == null) {
      throw 'blue is required but was not provided';
    }
    if (alpha == null) {
      throw 'alpha is required but was not provided';
    }
  }
  static Color fromJson(Map<String, dynamic> json) {
    final red = json['red'];
    final green = json['green'];
    final blue = json['blue'];
    final alpha = json['alpha'];
    return Color(red: red, green: green, blue: blue, alpha: alpha);
  }

  /// The alpha component of this color in the range [0-1].
  final num alpha;

  /// The blue component of this color in the range [0-1].
  final num blue;

  /// The green component of this color in the range [0-1].
  final num green;

  /// The red component of this color in the range [0-1].
  final num red;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['red'] = red ?? (throw 'red is required but was not set');
    __result['green'] = green ?? (throw 'green is required but was not set');
    __result['blue'] = blue ?? (throw 'blue is required but was not set');
    __result['alpha'] = alpha ?? (throw 'alpha is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('red');
      try {
        if (!obj.containsKey('red')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['red'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['red'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('green');
      try {
        if (!obj.containsKey('green')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['green'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['green'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('blue');
      try {
        if (!obj.containsKey('blue')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['blue'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['blue'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('alpha');
      try {
        if (!obj.containsKey('alpha')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['alpha'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['alpha'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type Color');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Color && other.runtimeType == Color) {
      return red == other.red &&
          green == other.green &&
          blue == other.blue &&
          alpha == other.alpha &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, red.hashCode);
    hash = JenkinsSmiHash.combine(hash, green.hashCode);
    hash = JenkinsSmiHash.combine(hash, blue.hashCode);
    hash = JenkinsSmiHash.combine(hash, alpha.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ColorInformation implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ColorInformation.canParse, ColorInformation.fromJson);

  ColorInformation({@required this.range, @required this.color}) {
    if (range == null) {
      throw 'range is required but was not provided';
    }
    if (color == null) {
      throw 'color is required but was not provided';
    }
  }
  static ColorInformation fromJson(Map<String, dynamic> json) {
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final color = json['color'] != null ? Color.fromJson(json['color']) : null;
    return ColorInformation(range: range, color: color);
  }

  /// The actual color value for this color range.
  final Color color;

  /// The range in the document where this color appears.
  final Range range;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['range'] = range ?? (throw 'range is required but was not set');
    __result['color'] = color ?? (throw 'color is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('color');
      try {
        if (!obj.containsKey('color')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['color'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Color.canParse(obj['color'], reporter))) {
          reporter.reportError('must be of type Color');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ColorInformation');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ColorInformation && other.runtimeType == ColorInformation) {
      return range == other.range && color == other.color && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, color.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ColorPresentation implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ColorPresentation.canParse, ColorPresentation.fromJson);

  ColorPresentation(
      {@required this.label, this.textEdit, this.additionalTextEdits}) {
    if (label == null) {
      throw 'label is required but was not provided';
    }
  }
  static ColorPresentation fromJson(Map<String, dynamic> json) {
    final label = json['label'];
    final textEdit =
        json['textEdit'] != null ? TextEdit.fromJson(json['textEdit']) : null;
    final additionalTextEdits = json['additionalTextEdits']
        ?.map((item) => item != null ? TextEdit.fromJson(item) : null)
        ?.cast<TextEdit>()
        ?.toList();
    return ColorPresentation(
        label: label,
        textEdit: textEdit,
        additionalTextEdits: additionalTextEdits);
  }

  /// An optional array of additional text edits ([TextEdit]) that are applied
  /// when selecting this color presentation. Edits must not overlap with the
  /// main [edit](#ColorPresentation.textEdit) nor with themselves.
  final List<TextEdit> additionalTextEdits;

  /// The label of this color presentation. It will be shown on the color picker
  /// header. By default this is also the text that is inserted when selecting
  /// this color presentation.
  final String label;

  /// An edit ([TextEdit]) which is applied to a document when selecting this
  /// presentation for the color.  When `falsy` the
  /// [label](#ColorPresentation.label) is used.
  final TextEdit textEdit;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['label'] = label ?? (throw 'label is required but was not set');
    if (textEdit != null) {
      __result['textEdit'] = textEdit;
    }
    if (additionalTextEdits != null) {
      __result['additionalTextEdits'] = additionalTextEdits;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('label');
      try {
        if (!obj.containsKey('label')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['label'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['label'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('textEdit');
      try {
        if (obj['textEdit'] != null &&
            !(TextEdit.canParse(obj['textEdit'], reporter))) {
          reporter.reportError('must be of type TextEdit');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('additionalTextEdits');
      try {
        if (obj['additionalTextEdits'] != null &&
            !((obj['additionalTextEdits'] is List &&
                (obj['additionalTextEdits']
                    .every((item) => TextEdit.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<TextEdit>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ColorPresentation');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ColorPresentation && other.runtimeType == ColorPresentation) {
      return label == other.label &&
          textEdit == other.textEdit &&
          listEqual(additionalTextEdits, other.additionalTextEdits,
              (TextEdit a, TextEdit b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, label.hashCode);
    hash = JenkinsSmiHash.combine(hash, textEdit.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(additionalTextEdits));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ColorPresentationParams
    implements WorkDoneProgressParams, PartialResultParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ColorPresentationParams.canParse, ColorPresentationParams.fromJson);

  ColorPresentationParams(
      {@required this.textDocument,
      @required this.color,
      @required this.range,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (color == null) {
      throw 'color is required but was not provided';
    }
    if (range == null) {
      throw 'range is required but was not provided';
    }
  }
  static ColorPresentationParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final color = json['color'] != null ? Color.fromJson(json['color']) : null;
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return ColorPresentationParams(
        textDocument: textDocument,
        color: color,
        range: range,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// The color information to request presentations for.
  final Color color;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The range where the color would be inserted. Serves as a context.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['color'] = color ?? (throw 'color is required but was not set');
    __result['range'] = range ?? (throw 'range is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('color');
      try {
        if (!obj.containsKey('color')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['color'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Color.canParse(obj['color'], reporter))) {
          reporter.reportError('must be of type Color');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ColorPresentationParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ColorPresentationParams &&
        other.runtimeType == ColorPresentationParams) {
      return textDocument == other.textDocument &&
          color == other.color &&
          range == other.range &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, color.hashCode);
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class Command implements ToJsonable {
  static const jsonHandler = LspJsonHandler(Command.canParse, Command.fromJson);

  Command({@required this.title, @required this.command, this.arguments}) {
    if (title == null) {
      throw 'title is required but was not provided';
    }
    if (command == null) {
      throw 'command is required but was not provided';
    }
  }
  static Command fromJson(Map<String, dynamic> json) {
    final title = json['title'];
    final command = json['command'];
    final arguments =
        json['arguments']?.map((item) => item)?.cast<dynamic>()?.toList();
    return Command(title: title, command: command, arguments: arguments);
  }

  /// Arguments that the command handler should be invoked with.
  final List<dynamic> arguments;

  /// The identifier of the actual command handler.
  final String command;

  /// Title of the command, like `save`.
  final String title;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['title'] = title ?? (throw 'title is required but was not set');
    __result['command'] =
        command ?? (throw 'command is required but was not set');
    if (arguments != null) {
      __result['arguments'] = arguments;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('title');
      try {
        if (!obj.containsKey('title')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['title'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['title'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('command');
      try {
        if (!obj.containsKey('command')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['command'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['command'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('arguments');
      try {
        if (obj['arguments'] != null &&
            !((obj['arguments'] is List &&
                (obj['arguments'].every((item) => true))))) {
          reporter.reportError('must be of type List<dynamic>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type Command');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Command && other.runtimeType == Command) {
      return title == other.title &&
          command == other.command &&
          listEqual(
              arguments, other.arguments, (dynamic a, dynamic b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, title.hashCode);
    hash = JenkinsSmiHash.combine(hash, command.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(arguments));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CompletionClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CompletionClientCapabilities.canParse,
      CompletionClientCapabilities.fromJson);

  CompletionClientCapabilities(
      {this.dynamicRegistration,
      this.completionItem,
      this.completionItemKind,
      this.contextSupport});
  static CompletionClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final completionItem = json['completionItem'] != null
        ? CompletionClientCapabilitiesCompletionItem.fromJson(
            json['completionItem'])
        : null;
    final completionItemKind = json['completionItemKind'] != null
        ? CompletionClientCapabilitiesCompletionItemKind.fromJson(
            json['completionItemKind'])
        : null;
    final contextSupport = json['contextSupport'];
    return CompletionClientCapabilities(
        dynamicRegistration: dynamicRegistration,
        completionItem: completionItem,
        completionItemKind: completionItemKind,
        contextSupport: contextSupport);
  }

  /// The client supports the following `CompletionItem` specific capabilities.
  final CompletionClientCapabilitiesCompletionItem completionItem;
  final CompletionClientCapabilitiesCompletionItemKind completionItemKind;

  /// The client supports to send additional context information for a
  /// `textDocument/completion` request.
  final bool contextSupport;

  /// Whether completion supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (completionItem != null) {
      __result['completionItem'] = completionItem;
    }
    if (completionItemKind != null) {
      __result['completionItemKind'] = completionItemKind;
    }
    if (contextSupport != null) {
      __result['contextSupport'] = contextSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('completionItem');
      try {
        if (obj['completionItem'] != null &&
            !(CompletionClientCapabilitiesCompletionItem.canParse(
                obj['completionItem'], reporter))) {
          reporter.reportError(
              'must be of type CompletionClientCapabilitiesCompletionItem');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('completionItemKind');
      try {
        if (obj['completionItemKind'] != null &&
            !(CompletionClientCapabilitiesCompletionItemKind.canParse(
                obj['completionItemKind'], reporter))) {
          reporter.reportError(
              'must be of type CompletionClientCapabilitiesCompletionItemKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('contextSupport');
      try {
        if (obj['contextSupport'] != null && !(obj['contextSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CompletionClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CompletionClientCapabilities &&
        other.runtimeType == CompletionClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          completionItem == other.completionItem &&
          completionItemKind == other.completionItemKind &&
          contextSupport == other.contextSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, completionItem.hashCode);
    hash = JenkinsSmiHash.combine(hash, completionItemKind.hashCode);
    hash = JenkinsSmiHash.combine(hash, contextSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CompletionClientCapabilitiesCompletionItem implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CompletionClientCapabilitiesCompletionItem.canParse,
      CompletionClientCapabilitiesCompletionItem.fromJson);

  CompletionClientCapabilitiesCompletionItem(
      {this.snippetSupport,
      this.commitCharactersSupport,
      this.documentationFormat,
      this.deprecatedSupport,
      this.preselectSupport,
      this.tagSupport});
  static CompletionClientCapabilitiesCompletionItem fromJson(
      Map<String, dynamic> json) {
    final snippetSupport = json['snippetSupport'];
    final commitCharactersSupport = json['commitCharactersSupport'];
    final documentationFormat = json['documentationFormat']
        ?.map((item) => item != null ? MarkupKind.fromJson(item) : null)
        ?.cast<MarkupKind>()
        ?.toList();
    final deprecatedSupport = json['deprecatedSupport'];
    final preselectSupport = json['preselectSupport'];
    final tagSupport = json['tagSupport'] != null
        ? CompletionClientCapabilitiesTagSupport.fromJson(json['tagSupport'])
        : null;
    return CompletionClientCapabilitiesCompletionItem(
        snippetSupport: snippetSupport,
        commitCharactersSupport: commitCharactersSupport,
        documentationFormat: documentationFormat,
        deprecatedSupport: deprecatedSupport,
        preselectSupport: preselectSupport,
        tagSupport: tagSupport);
  }

  /// Client supports commit characters on a completion item.
  final bool commitCharactersSupport;

  /// Client supports the deprecated property on a completion item.
  final bool deprecatedSupport;

  /// Client supports the follow content formats for the documentation property.
  /// The order describes the preferred format of the client.
  final List<MarkupKind> documentationFormat;

  /// Client supports the preselect property on a completion item.
  final bool preselectSupport;

  /// Client supports snippets as insert text.
  ///
  /// A snippet can define tab stops and placeholders with `$1`, `$2` and
  /// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of the
  /// snippet. Placeholders with equal identifiers are linked, that is typing in
  /// one will update others too.
  final bool snippetSupport;

  /// Client supports the tag property on a completion item. Clients supporting
  /// tags have to handle unknown tags gracefully. Clients especially need to
  /// preserve unknown tags when sending a completion item back to the server in
  /// a resolve call.
  ///  @since 3.15.0
  final CompletionClientCapabilitiesTagSupport tagSupport;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (snippetSupport != null) {
      __result['snippetSupport'] = snippetSupport;
    }
    if (commitCharactersSupport != null) {
      __result['commitCharactersSupport'] = commitCharactersSupport;
    }
    if (documentationFormat != null) {
      __result['documentationFormat'] = documentationFormat;
    }
    if (deprecatedSupport != null) {
      __result['deprecatedSupport'] = deprecatedSupport;
    }
    if (preselectSupport != null) {
      __result['preselectSupport'] = preselectSupport;
    }
    if (tagSupport != null) {
      __result['tagSupport'] = tagSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('snippetSupport');
      try {
        if (obj['snippetSupport'] != null && !(obj['snippetSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('commitCharactersSupport');
      try {
        if (obj['commitCharactersSupport'] != null &&
            !(obj['commitCharactersSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentationFormat');
      try {
        if (obj['documentationFormat'] != null &&
            !((obj['documentationFormat'] is List &&
                (obj['documentationFormat']
                    .every((item) => MarkupKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<MarkupKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('deprecatedSupport');
      try {
        if (obj['deprecatedSupport'] != null &&
            !(obj['deprecatedSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('preselectSupport');
      try {
        if (obj['preselectSupport'] != null &&
            !(obj['preselectSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('tagSupport');
      try {
        if (obj['tagSupport'] != null &&
            !(CompletionClientCapabilitiesTagSupport.canParse(
                obj['tagSupport'], reporter))) {
          reporter.reportError(
              'must be of type CompletionClientCapabilitiesTagSupport');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type CompletionClientCapabilitiesCompletionItem');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CompletionClientCapabilitiesCompletionItem &&
        other.runtimeType == CompletionClientCapabilitiesCompletionItem) {
      return snippetSupport == other.snippetSupport &&
          commitCharactersSupport == other.commitCharactersSupport &&
          listEqual(documentationFormat, other.documentationFormat,
              (MarkupKind a, MarkupKind b) => a == b) &&
          deprecatedSupport == other.deprecatedSupport &&
          preselectSupport == other.preselectSupport &&
          tagSupport == other.tagSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, snippetSupport.hashCode);
    hash = JenkinsSmiHash.combine(hash, commitCharactersSupport.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentationFormat));
    hash = JenkinsSmiHash.combine(hash, deprecatedSupport.hashCode);
    hash = JenkinsSmiHash.combine(hash, preselectSupport.hashCode);
    hash = JenkinsSmiHash.combine(hash, tagSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CompletionClientCapabilitiesCompletionItemKind implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CompletionClientCapabilitiesCompletionItemKind.canParse,
      CompletionClientCapabilitiesCompletionItemKind.fromJson);

  CompletionClientCapabilitiesCompletionItemKind({this.valueSet});
  static CompletionClientCapabilitiesCompletionItemKind fromJson(
      Map<String, dynamic> json) {
    final valueSet = json['valueSet']
        ?.map((item) => item != null ? CompletionItemKind.fromJson(item) : null)
        ?.cast<CompletionItemKind>()
        ?.toList();
    return CompletionClientCapabilitiesCompletionItemKind(valueSet: valueSet);
  }

  /// The completion item kind values the client supports. When this property
  /// exists the client also guarantees that it will handle values outside its
  /// set gracefully and falls back to a default value when unknown.
  ///
  /// If this property is not present the client only supports the completion
  /// items kinds from `Text` to `Reference` as defined in the initial version
  /// of the protocol.
  final List<CompletionItemKind> valueSet;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (valueSet != null) {
      __result['valueSet'] = valueSet;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('valueSet');
      try {
        if (obj['valueSet'] != null &&
            !((obj['valueSet'] is List &&
                (obj['valueSet'].every(
                    (item) => CompletionItemKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<CompletionItemKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type CompletionClientCapabilitiesCompletionItemKind');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CompletionClientCapabilitiesCompletionItemKind &&
        other.runtimeType == CompletionClientCapabilitiesCompletionItemKind) {
      return listEqual(valueSet, other.valueSet,
              (CompletionItemKind a, CompletionItemKind b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(valueSet));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CompletionClientCapabilitiesTagSupport implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CompletionClientCapabilitiesTagSupport.canParse,
      CompletionClientCapabilitiesTagSupport.fromJson);

  CompletionClientCapabilitiesTagSupport({@required this.valueSet}) {
    if (valueSet == null) {
      throw 'valueSet is required but was not provided';
    }
  }
  static CompletionClientCapabilitiesTagSupport fromJson(
      Map<String, dynamic> json) {
    final valueSet = json['valueSet']
        ?.map((item) => item != null ? CompletionItemTag.fromJson(item) : null)
        ?.cast<CompletionItemTag>()
        ?.toList();
    return CompletionClientCapabilitiesTagSupport(valueSet: valueSet);
  }

  /// The tags supported by the client.
  final List<CompletionItemTag> valueSet;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['valueSet'] =
        valueSet ?? (throw 'valueSet is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('valueSet');
      try {
        if (!obj.containsKey('valueSet')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['valueSet'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['valueSet'] is List &&
            (obj['valueSet'].every(
                (item) => CompletionItemTag.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<CompletionItemTag>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type CompletionClientCapabilitiesTagSupport');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CompletionClientCapabilitiesTagSupport &&
        other.runtimeType == CompletionClientCapabilitiesTagSupport) {
      return listEqual(valueSet, other.valueSet,
              (CompletionItemTag a, CompletionItemTag b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(valueSet));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Contains additional information about the context in which a completion
/// request is triggered.
class CompletionContext implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CompletionContext.canParse, CompletionContext.fromJson);

  CompletionContext({@required this.triggerKind, this.triggerCharacter}) {
    if (triggerKind == null) {
      throw 'triggerKind is required but was not provided';
    }
  }
  static CompletionContext fromJson(Map<String, dynamic> json) {
    final triggerKind = json['triggerKind'] != null
        ? CompletionTriggerKind.fromJson(json['triggerKind'])
        : null;
    final triggerCharacter = json['triggerCharacter'];
    return CompletionContext(
        triggerKind: triggerKind, triggerCharacter: triggerCharacter);
  }

  /// The trigger character (a single character) that has trigger code complete.
  /// Is undefined if `triggerKind !== CompletionTriggerKind.TriggerCharacter`
  final String triggerCharacter;

  /// How the completion was triggered.
  final CompletionTriggerKind triggerKind;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['triggerKind'] =
        triggerKind ?? (throw 'triggerKind is required but was not set');
    if (triggerCharacter != null) {
      __result['triggerCharacter'] = triggerCharacter;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('triggerKind');
      try {
        if (!obj.containsKey('triggerKind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['triggerKind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(CompletionTriggerKind.canParse(obj['triggerKind'], reporter))) {
          reporter.reportError('must be of type CompletionTriggerKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('triggerCharacter');
      try {
        if (obj['triggerCharacter'] != null &&
            !(obj['triggerCharacter'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CompletionContext');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CompletionContext && other.runtimeType == CompletionContext) {
      return triggerKind == other.triggerKind &&
          triggerCharacter == other.triggerCharacter &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, triggerKind.hashCode);
    hash = JenkinsSmiHash.combine(hash, triggerCharacter.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CompletionItem implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CompletionItem.canParse, CompletionItem.fromJson);

  CompletionItem(
      {@required this.label,
      this.kind,
      this.tags,
      this.detail,
      this.documentation,
      this.deprecated,
      this.preselect,
      this.sortText,
      this.filterText,
      this.insertText,
      this.insertTextFormat,
      this.textEdit,
      this.additionalTextEdits,
      this.commitCharacters,
      this.command,
      this.data}) {
    if (label == null) {
      throw 'label is required but was not provided';
    }
  }
  static CompletionItem fromJson(Map<String, dynamic> json) {
    final label = json['label'];
    final kind =
        json['kind'] != null ? CompletionItemKind.fromJson(json['kind']) : null;
    final tags = json['tags']
        ?.map((item) => item != null ? CompletionItemTag.fromJson(item) : null)
        ?.cast<CompletionItemTag>()
        ?.toList();
    final detail = json['detail'];
    final documentation = json['documentation'] is String
        ? Either2<String, MarkupContent>.t1(json['documentation'])
        : (MarkupContent.canParse(json['documentation'], nullLspJsonReporter)
            ? Either2<String, MarkupContent>.t2(json['documentation'] != null
                ? MarkupContent.fromJson(json['documentation'])
                : null)
            : (json['documentation'] == null
                ? null
                : (throw '''${json['documentation']} was not one of (String, MarkupContent)''')));
    final deprecated = json['deprecated'];
    final preselect = json['preselect'];
    final sortText = json['sortText'];
    final filterText = json['filterText'];
    final insertText = json['insertText'];
    final insertTextFormat = json['insertTextFormat'] != null
        ? InsertTextFormat.fromJson(json['insertTextFormat'])
        : null;
    final textEdit =
        json['textEdit'] != null ? TextEdit.fromJson(json['textEdit']) : null;
    final additionalTextEdits = json['additionalTextEdits']
        ?.map((item) => item != null ? TextEdit.fromJson(item) : null)
        ?.cast<TextEdit>()
        ?.toList();
    final commitCharacters =
        json['commitCharacters']?.map((item) => item)?.cast<String>()?.toList();
    final command =
        json['command'] != null ? Command.fromJson(json['command']) : null;
    final data = json['data'] != null
        ? CompletionItemResolutionInfo.fromJson(json['data'])
        : null;
    return CompletionItem(
        label: label,
        kind: kind,
        tags: tags,
        detail: detail,
        documentation: documentation,
        deprecated: deprecated,
        preselect: preselect,
        sortText: sortText,
        filterText: filterText,
        insertText: insertText,
        insertTextFormat: insertTextFormat,
        textEdit: textEdit,
        additionalTextEdits: additionalTextEdits,
        commitCharacters: commitCharacters,
        command: command,
        data: data);
  }

  /// An optional array of additional text edits that are applied when selecting
  /// this completion. Edits must not overlap (including the same insert
  /// position) with the main edit nor with themselves.
  ///
  /// Additional text edits should be used to change text unrelated to the
  /// current cursor position (for example adding an import statement at the top
  /// of the file if the completion item will insert an unqualified type).
  final List<TextEdit> additionalTextEdits;

  /// An optional command that is executed *after* inserting this completion.
  /// *Note* that additional modifications to the current document should be
  /// described with the additionalTextEdits-property.
  final Command command;

  /// An optional set of characters that when pressed while this completion is
  /// active will accept it first and then type that character. *Note* that all
  /// commit characters should have `length=1` and that superfluous characters
  /// will be ignored.
  final List<String> commitCharacters;

  /// A data entry field that is preserved on a completion item between a
  /// completion and a completion resolve request.
  final CompletionItemResolutionInfo data;

  /// Indicates if this item is deprecated.
  ///  @deprecated Use `tags` instead if supported.
  @core.deprecated
  final bool deprecated;

  /// A human-readable string with additional information about this item, like
  /// type or symbol information.
  final String detail;

  /// A human-readable string that represents a doc-comment.
  final Either2<String, MarkupContent> documentation;

  /// A string that should be used when filtering a set of completion items.
  /// When `falsy` the label is used.
  final String filterText;

  /// A string that should be inserted into a document when selecting this
  /// completion. When `falsy` the label is used.
  ///
  /// The `insertText` is subject to interpretation by the client side. Some
  /// tools might not take the string literally. For example VS Code when code
  /// complete is requested in this example `con<cursor position>` and a
  /// completion item with an `insertText` of `console` is provided it will only
  /// insert `sole`. Therefore it is recommended to use `textEdit` instead since
  /// it avoids additional client side interpretation.
  final String insertText;

  /// The format of the insert text. The format applies to both the `insertText`
  /// property and the `newText` property of a provided `textEdit`. If omitted
  /// defaults to `InsertTextFormat.PlainText`.
  final InsertTextFormat insertTextFormat;

  /// The kind of this completion item. Based of the kind an icon is chosen by
  /// the editor. The standardized set of available values is defined in
  /// `CompletionItemKind`.
  final CompletionItemKind kind;

  /// The label of this completion item. By default also the text that is
  /// inserted when selecting this completion.
  final String label;

  /// Select this item when showing.
  ///
  /// *Note* that only one completion item can be selected and that the tool /
  /// client decides which item that is. The rule is that the *first* item of
  /// those that match best is selected.
  final bool preselect;

  /// A string that should be used when comparing this item with other items.
  /// When `falsy` the label is used.
  final String sortText;

  /// Tags for this completion item.
  ///  @since 3.15.0
  final List<CompletionItemTag> tags;

  /// An edit which is applied to a document when selecting this completion.
  /// When an edit is provided the value of `insertText` is ignored.
  ///
  /// *Note:* The range of the edit must be a single line range and it must
  /// contain the position at which completion has been requested.
  final TextEdit textEdit;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['label'] = label ?? (throw 'label is required but was not set');
    if (kind != null) {
      __result['kind'] = kind;
    }
    if (tags != null) {
      __result['tags'] = tags;
    }
    if (detail != null) {
      __result['detail'] = detail;
    }
    if (documentation != null) {
      __result['documentation'] = documentation;
    }
    if (deprecated != null) {
      __result['deprecated'] = deprecated;
    }
    if (preselect != null) {
      __result['preselect'] = preselect;
    }
    if (sortText != null) {
      __result['sortText'] = sortText;
    }
    if (filterText != null) {
      __result['filterText'] = filterText;
    }
    if (insertText != null) {
      __result['insertText'] = insertText;
    }
    if (insertTextFormat != null) {
      __result['insertTextFormat'] = insertTextFormat;
    }
    if (textEdit != null) {
      __result['textEdit'] = textEdit;
    }
    if (additionalTextEdits != null) {
      __result['additionalTextEdits'] = additionalTextEdits;
    }
    if (commitCharacters != null) {
      __result['commitCharacters'] = commitCharacters;
    }
    if (command != null) {
      __result['command'] = command;
    }
    if (data != null) {
      __result['data'] = data;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('label');
      try {
        if (!obj.containsKey('label')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['label'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['label'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('kind');
      try {
        if (obj['kind'] != null &&
            !(CompletionItemKind.canParse(obj['kind'], reporter))) {
          reporter.reportError('must be of type CompletionItemKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('tags');
      try {
        if (obj['tags'] != null &&
            !((obj['tags'] is List &&
                (obj['tags'].every(
                    (item) => CompletionItemTag.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<CompletionItemTag>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('detail');
      try {
        if (obj['detail'] != null && !(obj['detail'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentation');
      try {
        if (obj['documentation'] != null &&
            !((obj['documentation'] is String ||
                MarkupContent.canParse(obj['documentation'], reporter)))) {
          reporter
              .reportError('must be of type Either2<String, MarkupContent>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('deprecated');
      try {
        if (obj['deprecated'] != null && !(obj['deprecated'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('preselect');
      try {
        if (obj['preselect'] != null && !(obj['preselect'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('sortText');
      try {
        if (obj['sortText'] != null && !(obj['sortText'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('filterText');
      try {
        if (obj['filterText'] != null && !(obj['filterText'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('insertText');
      try {
        if (obj['insertText'] != null && !(obj['insertText'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('insertTextFormat');
      try {
        if (obj['insertTextFormat'] != null &&
            !(InsertTextFormat.canParse(obj['insertTextFormat'], reporter))) {
          reporter.reportError('must be of type InsertTextFormat');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('textEdit');
      try {
        if (obj['textEdit'] != null &&
            !(TextEdit.canParse(obj['textEdit'], reporter))) {
          reporter.reportError('must be of type TextEdit');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('additionalTextEdits');
      try {
        if (obj['additionalTextEdits'] != null &&
            !((obj['additionalTextEdits'] is List &&
                (obj['additionalTextEdits']
                    .every((item) => TextEdit.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<TextEdit>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('commitCharacters');
      try {
        if (obj['commitCharacters'] != null &&
            !((obj['commitCharacters'] is List &&
                (obj['commitCharacters'].every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('command');
      try {
        if (obj['command'] != null &&
            !(Command.canParse(obj['command'], reporter))) {
          reporter.reportError('must be of type Command');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('data');
      try {
        if (obj['data'] != null &&
            !(CompletionItemResolutionInfo.canParse(obj['data'], reporter))) {
          reporter.reportError('must be of type CompletionItemResolutionInfo');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CompletionItem');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CompletionItem && other.runtimeType == CompletionItem) {
      return label == other.label &&
          kind == other.kind &&
          listEqual(tags, other.tags,
              (CompletionItemTag a, CompletionItemTag b) => a == b) &&
          detail == other.detail &&
          documentation == other.documentation &&
          deprecated == other.deprecated &&
          preselect == other.preselect &&
          sortText == other.sortText &&
          filterText == other.filterText &&
          insertText == other.insertText &&
          insertTextFormat == other.insertTextFormat &&
          textEdit == other.textEdit &&
          listEqual(additionalTextEdits, other.additionalTextEdits,
              (TextEdit a, TextEdit b) => a == b) &&
          listEqual(commitCharacters, other.commitCharacters,
              (String a, String b) => a == b) &&
          command == other.command &&
          data == other.data &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, label.hashCode);
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(tags));
    hash = JenkinsSmiHash.combine(hash, detail.hashCode);
    hash = JenkinsSmiHash.combine(hash, documentation.hashCode);
    hash = JenkinsSmiHash.combine(hash, deprecated.hashCode);
    hash = JenkinsSmiHash.combine(hash, preselect.hashCode);
    hash = JenkinsSmiHash.combine(hash, sortText.hashCode);
    hash = JenkinsSmiHash.combine(hash, filterText.hashCode);
    hash = JenkinsSmiHash.combine(hash, insertText.hashCode);
    hash = JenkinsSmiHash.combine(hash, insertTextFormat.hashCode);
    hash = JenkinsSmiHash.combine(hash, textEdit.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(additionalTextEdits));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(commitCharacters));
    hash = JenkinsSmiHash.combine(hash, command.hashCode);
    hash = JenkinsSmiHash.combine(hash, data.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// The kind of a completion entry.
class CompletionItemKind {
  const CompletionItemKind(this._value);
  const CompletionItemKind.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  static const Text = CompletionItemKind(1);
  static const Method = CompletionItemKind(2);
  static const Function = CompletionItemKind(3);
  static const Constructor = CompletionItemKind(4);
  static const Field = CompletionItemKind(5);
  static const Variable = CompletionItemKind(6);
  static const Class = CompletionItemKind(7);
  static const Interface = CompletionItemKind(8);
  static const Module = CompletionItemKind(9);
  static const Property = CompletionItemKind(10);
  static const Unit = CompletionItemKind(11);
  static const Value = CompletionItemKind(12);
  static const Enum = CompletionItemKind(13);
  static const Keyword = CompletionItemKind(14);
  static const Snippet = CompletionItemKind(15);
  static const Color = CompletionItemKind(16);
  static const File = CompletionItemKind(17);
  static const Reference = CompletionItemKind(18);
  static const Folder = CompletionItemKind(19);
  static const EnumMember = CompletionItemKind(20);
  static const Constant = CompletionItemKind(21);
  static const Struct = CompletionItemKind(22);
  static const Event = CompletionItemKind(23);
  static const Operator = CompletionItemKind(24);
  static const TypeParameter = CompletionItemKind(25);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is CompletionItemKind && o._value == _value;
}

/// Completion item tags are extra annotations that tweak the rendering of a
/// completion item.
///  @since 3.15.0
class CompletionItemTag {
  const CompletionItemTag(this._value);
  const CompletionItemTag.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// Render a completion as obsolete, usually using a strike-out.
  static const Deprecated = CompletionItemTag(1);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is CompletionItemTag && o._value == _value;
}

/// Represents a collection of completion items ([CompletionItem]) to be
/// presented in the editor.
class CompletionList implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CompletionList.canParse, CompletionList.fromJson);

  CompletionList({@required this.isIncomplete, @required this.items}) {
    if (isIncomplete == null) {
      throw 'isIncomplete is required but was not provided';
    }
    if (items == null) {
      throw 'items is required but was not provided';
    }
  }
  static CompletionList fromJson(Map<String, dynamic> json) {
    final isIncomplete = json['isIncomplete'];
    final items = json['items']
        ?.map((item) => item != null ? CompletionItem.fromJson(item) : null)
        ?.cast<CompletionItem>()
        ?.toList();
    return CompletionList(isIncomplete: isIncomplete, items: items);
  }

  /// This list it not complete. Further typing should result in recomputing
  /// this list.
  final bool isIncomplete;

  /// The completion items.
  final List<CompletionItem> items;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['isIncomplete'] =
        isIncomplete ?? (throw 'isIncomplete is required but was not set');
    __result['items'] = items ?? (throw 'items is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('isIncomplete');
      try {
        if (!obj.containsKey('isIncomplete')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['isIncomplete'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['isIncomplete'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('items');
      try {
        if (!obj.containsKey('items')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['items'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['items'] is List &&
            (obj['items']
                .every((item) => CompletionItem.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<CompletionItem>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CompletionList');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CompletionList && other.runtimeType == CompletionList) {
      return isIncomplete == other.isIncomplete &&
          listEqual(items, other.items,
              (CompletionItem a, CompletionItem b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, isIncomplete.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(items));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Completion options.
class CompletionOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CompletionOptions.canParse, CompletionOptions.fromJson);

  CompletionOptions(
      {this.triggerCharacters,
      this.allCommitCharacters,
      this.resolveProvider,
      this.workDoneProgress});
  static CompletionOptions fromJson(Map<String, dynamic> json) {
    if (CompletionRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return CompletionRegistrationOptions.fromJson(json);
    }
    final triggerCharacters = json['triggerCharacters']
        ?.map((item) => item)
        ?.cast<String>()
        ?.toList();
    final allCommitCharacters = json['allCommitCharacters']
        ?.map((item) => item)
        ?.cast<String>()
        ?.toList();
    final resolveProvider = json['resolveProvider'];
    final workDoneProgress = json['workDoneProgress'];
    return CompletionOptions(
        triggerCharacters: triggerCharacters,
        allCommitCharacters: allCommitCharacters,
        resolveProvider: resolveProvider,
        workDoneProgress: workDoneProgress);
  }

  /// The list of all possible characters that commit a completion. This field
  /// can be used if clients don't support individual commit characters per
  /// completion item. See
  /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`.
  ///
  /// If a server provides both `allCommitCharacters` and commit characters on
  /// an individual completion item the ones on the completion item win.
  ///  @since 3.2.0
  final List<String> allCommitCharacters;

  /// The server provides support to resolve additional information for a
  /// completion item.
  final bool resolveProvider;

  /// Most tools trigger completion request automatically without explicitly
  /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically they
  /// do so when the user starts to type an identifier. For example if the user
  /// types `c` in a JavaScript file code complete will automatically pop up
  /// present `console` besides others as a completion item. Characters that
  /// make up identifiers don't need to be listed here.
  ///
  /// If code complete should automatically be trigger on characters not being
  /// valid inside an identifier (for example `.` in JavaScript) list them in
  /// `triggerCharacters`.
  final List<String> triggerCharacters;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (triggerCharacters != null) {
      __result['triggerCharacters'] = triggerCharacters;
    }
    if (allCommitCharacters != null) {
      __result['allCommitCharacters'] = allCommitCharacters;
    }
    if (resolveProvider != null) {
      __result['resolveProvider'] = resolveProvider;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('triggerCharacters');
      try {
        if (obj['triggerCharacters'] != null &&
            !((obj['triggerCharacters'] is List &&
                (obj['triggerCharacters'].every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('allCommitCharacters');
      try {
        if (obj['allCommitCharacters'] != null &&
            !((obj['allCommitCharacters'] is List &&
                (obj['allCommitCharacters']
                    .every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('resolveProvider');
      try {
        if (obj['resolveProvider'] != null &&
            !(obj['resolveProvider'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CompletionOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CompletionOptions && other.runtimeType == CompletionOptions) {
      return listEqual(triggerCharacters, other.triggerCharacters,
              (String a, String b) => a == b) &&
          listEqual(allCommitCharacters, other.allCommitCharacters,
              (String a, String b) => a == b) &&
          resolveProvider == other.resolveProvider &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(triggerCharacters));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(allCommitCharacters));
    hash = JenkinsSmiHash.combine(hash, resolveProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CompletionParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams,
        ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CompletionParams.canParse, CompletionParams.fromJson);

  CompletionParams(
      {this.context,
      @required this.textDocument,
      @required this.position,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static CompletionParams fromJson(Map<String, dynamic> json) {
    final context = json['context'] != null
        ? CompletionContext.fromJson(json['context'])
        : null;
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return CompletionParams(
        context: context,
        textDocument: textDocument,
        position: position,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// The completion context. This is only available if the client specifies to
  /// send this using `ClientCapabilities.textDocument.completion.contextSupport
  /// === true`
  final CompletionContext context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (context != null) {
      __result['context'] = context;
    }
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('context');
      try {
        if (obj['context'] != null &&
            !(CompletionContext.canParse(obj['context'], reporter))) {
          reporter.reportError('must be of type CompletionContext');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CompletionParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CompletionParams && other.runtimeType == CompletionParams) {
      return context == other.context &&
          textDocument == other.textDocument &&
          position == other.position &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, context.hashCode);
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class CompletionRegistrationOptions
    implements TextDocumentRegistrationOptions, CompletionOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      CompletionRegistrationOptions.canParse,
      CompletionRegistrationOptions.fromJson);

  CompletionRegistrationOptions(
      {this.documentSelector,
      this.triggerCharacters,
      this.allCommitCharacters,
      this.resolveProvider,
      this.workDoneProgress});
  static CompletionRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final triggerCharacters = json['triggerCharacters']
        ?.map((item) => item)
        ?.cast<String>()
        ?.toList();
    final allCommitCharacters = json['allCommitCharacters']
        ?.map((item) => item)
        ?.cast<String>()
        ?.toList();
    final resolveProvider = json['resolveProvider'];
    final workDoneProgress = json['workDoneProgress'];
    return CompletionRegistrationOptions(
        documentSelector: documentSelector,
        triggerCharacters: triggerCharacters,
        allCommitCharacters: allCommitCharacters,
        resolveProvider: resolveProvider,
        workDoneProgress: workDoneProgress);
  }

  /// The list of all possible characters that commit a completion. This field
  /// can be used if clients don't support individual commit characters per
  /// completion item. See
  /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`.
  ///
  /// If a server provides both `allCommitCharacters` and commit characters on
  /// an individual completion item the ones on the completion item win.
  ///  @since 3.2.0
  final List<String> allCommitCharacters;

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// The server provides support to resolve additional information for a
  /// completion item.
  final bool resolveProvider;

  /// Most tools trigger completion request automatically without explicitly
  /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically they
  /// do so when the user starts to type an identifier. For example if the user
  /// types `c` in a JavaScript file code complete will automatically pop up
  /// present `console` besides others as a completion item. Characters that
  /// make up identifiers don't need to be listed here.
  ///
  /// If code complete should automatically be trigger on characters not being
  /// valid inside an identifier (for example `.` in JavaScript) list them in
  /// `triggerCharacters`.
  final List<String> triggerCharacters;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (triggerCharacters != null) {
      __result['triggerCharacters'] = triggerCharacters;
    }
    if (allCommitCharacters != null) {
      __result['allCommitCharacters'] = allCommitCharacters;
    }
    if (resolveProvider != null) {
      __result['resolveProvider'] = resolveProvider;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('triggerCharacters');
      try {
        if (obj['triggerCharacters'] != null &&
            !((obj['triggerCharacters'] is List &&
                (obj['triggerCharacters'].every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('allCommitCharacters');
      try {
        if (obj['allCommitCharacters'] != null &&
            !((obj['allCommitCharacters'] is List &&
                (obj['allCommitCharacters']
                    .every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('resolveProvider');
      try {
        if (obj['resolveProvider'] != null &&
            !(obj['resolveProvider'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CompletionRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CompletionRegistrationOptions &&
        other.runtimeType == CompletionRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          listEqual(triggerCharacters, other.triggerCharacters,
              (String a, String b) => a == b) &&
          listEqual(allCommitCharacters, other.allCommitCharacters,
              (String a, String b) => a == b) &&
          resolveProvider == other.resolveProvider &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(triggerCharacters));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(allCommitCharacters));
    hash = JenkinsSmiHash.combine(hash, resolveProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// How a completion was triggered
class CompletionTriggerKind {
  const CompletionTriggerKind._(this._value);
  const CompletionTriggerKind.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    switch (obj) {
      case 1:
      case 2:
      case 3:
        return true;
    }
    return false;
  }

  /// Completion was triggered by typing an identifier (24x7 code complete),
  /// manual invocation (e.g Ctrl+Space) or via API.
  static const Invoked = CompletionTriggerKind._(1);

  /// Completion was triggered by a trigger character specified by the
  /// `triggerCharacters` properties of the `CompletionRegistrationOptions`.
  static const TriggerCharacter = CompletionTriggerKind._(2);

  /// Completion was re-triggered as the current completion list is incomplete.
  static const TriggerForIncompleteCompletions = CompletionTriggerKind._(3);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) =>
      o is CompletionTriggerKind && o._value == _value;
}

class ConfigurationItem implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ConfigurationItem.canParse, ConfigurationItem.fromJson);

  ConfigurationItem({this.scopeUri, this.section});
  static ConfigurationItem fromJson(Map<String, dynamic> json) {
    final scopeUri = json['scopeUri'];
    final section = json['section'];
    return ConfigurationItem(scopeUri: scopeUri, section: section);
  }

  /// The scope to get the configuration section for.
  final String scopeUri;

  /// The configuration section asked for.
  final String section;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (scopeUri != null) {
      __result['scopeUri'] = scopeUri;
    }
    if (section != null) {
      __result['section'] = section;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('scopeUri');
      try {
        if (obj['scopeUri'] != null && !(obj['scopeUri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('section');
      try {
        if (obj['section'] != null && !(obj['section'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ConfigurationItem');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ConfigurationItem && other.runtimeType == ConfigurationItem) {
      return scopeUri == other.scopeUri && section == other.section && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, scopeUri.hashCode);
    hash = JenkinsSmiHash.combine(hash, section.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ConfigurationParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ConfigurationParams.canParse, ConfigurationParams.fromJson);

  ConfigurationParams({@required this.items}) {
    if (items == null) {
      throw 'items is required but was not provided';
    }
  }
  static ConfigurationParams fromJson(Map<String, dynamic> json) {
    final items = json['items']
        ?.map((item) => item != null ? ConfigurationItem.fromJson(item) : null)
        ?.cast<ConfigurationItem>()
        ?.toList();
    return ConfigurationParams(items: items);
  }

  final List<ConfigurationItem> items;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['items'] = items ?? (throw 'items is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('items');
      try {
        if (!obj.containsKey('items')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['items'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['items'] is List &&
            (obj['items'].every(
                (item) => ConfigurationItem.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<ConfigurationItem>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ConfigurationParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ConfigurationParams &&
        other.runtimeType == ConfigurationParams) {
      return listEqual(items, other.items,
              (ConfigurationItem a, ConfigurationItem b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(items));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Create file operation
class CreateFile implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CreateFile.canParse, CreateFile.fromJson);

  CreateFile({@required this.kind, @required this.uri, this.options}) {
    if (kind == null) {
      throw 'kind is required but was not provided';
    }
    if (uri == null) {
      throw 'uri is required but was not provided';
    }
  }
  static CreateFile fromJson(Map<String, dynamic> json) {
    final kind = json['kind'];
    final uri = json['uri'];
    final options = json['options'] != null
        ? CreateFileOptions.fromJson(json['options'])
        : null;
    return CreateFile(kind: kind, uri: uri, options: options);
  }

  /// A create
  final String kind;

  /// Additional options
  final CreateFileOptions options;

  /// The resource to create.
  final String uri;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['kind'] = kind ?? (throw 'kind is required but was not set');
    __result['uri'] = uri ?? (throw 'uri is required but was not set');
    if (options != null) {
      __result['options'] = options;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('kind');
      try {
        if (!obj.containsKey('kind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['kind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['kind'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('uri');
      try {
        if (!obj.containsKey('uri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['uri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['uri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('options');
      try {
        if (obj['options'] != null &&
            !(CreateFileOptions.canParse(obj['options'], reporter))) {
          reporter.reportError('must be of type CreateFileOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CreateFile');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CreateFile && other.runtimeType == CreateFile) {
      return kind == other.kind &&
          uri == other.uri &&
          options == other.options &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, uri.hashCode);
    hash = JenkinsSmiHash.combine(hash, options.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Options to create a file.
class CreateFileOptions implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(CreateFileOptions.canParse, CreateFileOptions.fromJson);

  CreateFileOptions({this.overwrite, this.ignoreIfExists});
  static CreateFileOptions fromJson(Map<String, dynamic> json) {
    final overwrite = json['overwrite'];
    final ignoreIfExists = json['ignoreIfExists'];
    return CreateFileOptions(
        overwrite: overwrite, ignoreIfExists: ignoreIfExists);
  }

  /// Ignore if exists.
  final bool ignoreIfExists;

  /// Overwrite existing file. Overwrite wins over `ignoreIfExists`
  final bool overwrite;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (overwrite != null) {
      __result['overwrite'] = overwrite;
    }
    if (ignoreIfExists != null) {
      __result['ignoreIfExists'] = ignoreIfExists;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('overwrite');
      try {
        if (obj['overwrite'] != null && !(obj['overwrite'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('ignoreIfExists');
      try {
        if (obj['ignoreIfExists'] != null && !(obj['ignoreIfExists'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type CreateFileOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is CreateFileOptions && other.runtimeType == CreateFileOptions) {
      return overwrite == other.overwrite &&
          ignoreIfExists == other.ignoreIfExists &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, overwrite.hashCode);
    hash = JenkinsSmiHash.combine(hash, ignoreIfExists.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DeclarationClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DeclarationClientCapabilities.canParse,
      DeclarationClientCapabilities.fromJson);

  DeclarationClientCapabilities({this.dynamicRegistration, this.linkSupport});
  static DeclarationClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final linkSupport = json['linkSupport'];
    return DeclarationClientCapabilities(
        dynamicRegistration: dynamicRegistration, linkSupport: linkSupport);
  }

  /// Whether declaration supports dynamic registration. If this is set to
  /// `true` the client supports the new `DeclarationRegistrationOptions` return
  /// value for the corresponding server capability as well.
  final bool dynamicRegistration;

  /// The client supports additional metadata in the form of declaration links.
  final bool linkSupport;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (linkSupport != null) {
      __result['linkSupport'] = linkSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('linkSupport');
      try {
        if (obj['linkSupport'] != null && !(obj['linkSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DeclarationClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DeclarationClientCapabilities &&
        other.runtimeType == DeclarationClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          linkSupport == other.linkSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, linkSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DeclarationOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DeclarationOptions.canParse, DeclarationOptions.fromJson);

  DeclarationOptions({this.workDoneProgress});
  static DeclarationOptions fromJson(Map<String, dynamic> json) {
    if (DeclarationRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DeclarationRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return DeclarationOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DeclarationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DeclarationOptions &&
        other.runtimeType == DeclarationOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DeclarationParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams,
        ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DeclarationParams.canParse, DeclarationParams.fromJson);

  DeclarationParams(
      {@required this.textDocument,
      @required this.position,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static DeclarationParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return DeclarationParams(
        textDocument: textDocument,
        position: position,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DeclarationParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DeclarationParams && other.runtimeType == DeclarationParams) {
      return textDocument == other.textDocument &&
          position == other.position &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DeclarationRegistrationOptions
    implements
        DeclarationOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DeclarationRegistrationOptions.canParse,
      DeclarationRegistrationOptions.fromJson);

  DeclarationRegistrationOptions(
      {this.workDoneProgress, this.documentSelector, this.id});
  static DeclarationRegistrationOptions fromJson(Map<String, dynamic> json) {
    final workDoneProgress = json['workDoneProgress'];
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final id = json['id'];
    return DeclarationRegistrationOptions(
        workDoneProgress: workDoneProgress,
        documentSelector: documentSelector,
        id: id);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String id;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    __result['documentSelector'] = documentSelector;
    if (id != null) {
      __result['id'] = id;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('id');
      try {
        if (obj['id'] != null && !(obj['id'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DeclarationRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DeclarationRegistrationOptions &&
        other.runtimeType == DeclarationRegistrationOptions) {
      return workDoneProgress == other.workDoneProgress &&
          listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          id == other.id &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DefinitionClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DefinitionClientCapabilities.canParse,
      DefinitionClientCapabilities.fromJson);

  DefinitionClientCapabilities({this.dynamicRegistration, this.linkSupport});
  static DefinitionClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final linkSupport = json['linkSupport'];
    return DefinitionClientCapabilities(
        dynamicRegistration: dynamicRegistration, linkSupport: linkSupport);
  }

  /// Whether definition supports dynamic registration.
  final bool dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  ///  @since 3.14.0
  final bool linkSupport;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (linkSupport != null) {
      __result['linkSupport'] = linkSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('linkSupport');
      try {
        if (obj['linkSupport'] != null && !(obj['linkSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DefinitionClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DefinitionClientCapabilities &&
        other.runtimeType == DefinitionClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          linkSupport == other.linkSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, linkSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DefinitionOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DefinitionOptions.canParse, DefinitionOptions.fromJson);

  DefinitionOptions({this.workDoneProgress});
  static DefinitionOptions fromJson(Map<String, dynamic> json) {
    if (DefinitionRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DefinitionRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return DefinitionOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DefinitionOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DefinitionOptions && other.runtimeType == DefinitionOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DefinitionParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams,
        ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DefinitionParams.canParse, DefinitionParams.fromJson);

  DefinitionParams(
      {@required this.textDocument,
      @required this.position,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static DefinitionParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return DefinitionParams(
        textDocument: textDocument,
        position: position,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DefinitionParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DefinitionParams && other.runtimeType == DefinitionParams) {
      return textDocument == other.textDocument &&
          position == other.position &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DefinitionRegistrationOptions
    implements TextDocumentRegistrationOptions, DefinitionOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DefinitionRegistrationOptions.canParse,
      DefinitionRegistrationOptions.fromJson);

  DefinitionRegistrationOptions({this.documentSelector, this.workDoneProgress});
  static DefinitionRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return DefinitionRegistrationOptions(
        documentSelector: documentSelector, workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DefinitionRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DefinitionRegistrationOptions &&
        other.runtimeType == DefinitionRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Delete file operation
class DeleteFile implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DeleteFile.canParse, DeleteFile.fromJson);

  DeleteFile({@required this.kind, @required this.uri, this.options}) {
    if (kind == null) {
      throw 'kind is required but was not provided';
    }
    if (uri == null) {
      throw 'uri is required but was not provided';
    }
  }
  static DeleteFile fromJson(Map<String, dynamic> json) {
    final kind = json['kind'];
    final uri = json['uri'];
    final options = json['options'] != null
        ? DeleteFileOptions.fromJson(json['options'])
        : null;
    return DeleteFile(kind: kind, uri: uri, options: options);
  }

  /// A delete
  final String kind;

  /// Delete options.
  final DeleteFileOptions options;

  /// The file to delete.
  final String uri;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['kind'] = kind ?? (throw 'kind is required but was not set');
    __result['uri'] = uri ?? (throw 'uri is required but was not set');
    if (options != null) {
      __result['options'] = options;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('kind');
      try {
        if (!obj.containsKey('kind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['kind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['kind'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('uri');
      try {
        if (!obj.containsKey('uri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['uri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['uri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('options');
      try {
        if (obj['options'] != null &&
            !(DeleteFileOptions.canParse(obj['options'], reporter))) {
          reporter.reportError('must be of type DeleteFileOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DeleteFile');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DeleteFile && other.runtimeType == DeleteFile) {
      return kind == other.kind &&
          uri == other.uri &&
          options == other.options &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, uri.hashCode);
    hash = JenkinsSmiHash.combine(hash, options.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Delete file options
class DeleteFileOptions implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DeleteFileOptions.canParse, DeleteFileOptions.fromJson);

  DeleteFileOptions({this.recursive, this.ignoreIfNotExists});
  static DeleteFileOptions fromJson(Map<String, dynamic> json) {
    final recursive = json['recursive'];
    final ignoreIfNotExists = json['ignoreIfNotExists'];
    return DeleteFileOptions(
        recursive: recursive, ignoreIfNotExists: ignoreIfNotExists);
  }

  /// Ignore the operation if the file doesn't exist.
  final bool ignoreIfNotExists;

  /// Delete the content recursively if a folder is denoted.
  final bool recursive;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (recursive != null) {
      __result['recursive'] = recursive;
    }
    if (ignoreIfNotExists != null) {
      __result['ignoreIfNotExists'] = ignoreIfNotExists;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('recursive');
      try {
        if (obj['recursive'] != null && !(obj['recursive'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('ignoreIfNotExists');
      try {
        if (obj['ignoreIfNotExists'] != null &&
            !(obj['ignoreIfNotExists'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DeleteFileOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DeleteFileOptions && other.runtimeType == DeleteFileOptions) {
      return recursive == other.recursive &&
          ignoreIfNotExists == other.ignoreIfNotExists &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, recursive.hashCode);
    hash = JenkinsSmiHash.combine(hash, ignoreIfNotExists.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class Diagnostic implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(Diagnostic.canParse, Diagnostic.fromJson);

  Diagnostic(
      {@required this.range,
      this.severity,
      this.code,
      this.source,
      @required this.message,
      this.tags,
      this.relatedInformation}) {
    if (range == null) {
      throw 'range is required but was not provided';
    }
    if (message == null) {
      throw 'message is required but was not provided';
    }
  }
  static Diagnostic fromJson(Map<String, dynamic> json) {
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final severity = json['severity'] != null
        ? DiagnosticSeverity.fromJson(json['severity'])
        : null;
    final code = json['code'];
    final source = json['source'];
    final message = json['message'];
    final tags = json['tags']
        ?.map((item) => item != null ? DiagnosticTag.fromJson(item) : null)
        ?.cast<DiagnosticTag>()
        ?.toList();
    final relatedInformation = json['relatedInformation']
        ?.map((item) =>
            item != null ? DiagnosticRelatedInformation.fromJson(item) : null)
        ?.cast<DiagnosticRelatedInformation>()
        ?.toList();
    return Diagnostic(
        range: range,
        severity: severity,
        code: code,
        source: source,
        message: message,
        tags: tags,
        relatedInformation: relatedInformation);
  }

  /// The diagnostic's code, which might appear in the user interface.
  final String code;

  /// The diagnostic's message.
  final String message;

  /// The range at which the message applies.
  final Range range;

  /// An array of related diagnostic information, e.g. when symbol-names within
  /// a scope collide all definitions can be marked via this property.
  final List<DiagnosticRelatedInformation> relatedInformation;

  /// The diagnostic's severity. Can be omitted. If omitted it is up to the
  /// client to interpret diagnostics as error, warning, info or hint.
  final DiagnosticSeverity severity;

  /// A human-readable string describing the source of this diagnostic, e.g.
  /// 'typescript' or 'super lint'.
  final String source;

  /// Additional metadata about the diagnostic.
  ///  @since 3.15.0
  final List<DiagnosticTag> tags;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['range'] = range ?? (throw 'range is required but was not set');
    if (severity != null) {
      __result['severity'] = severity;
    }
    if (code != null) {
      __result['code'] = code;
    }
    if (source != null) {
      __result['source'] = source;
    }
    __result['message'] =
        message ?? (throw 'message is required but was not set');
    if (tags != null) {
      __result['tags'] = tags;
    }
    if (relatedInformation != null) {
      __result['relatedInformation'] = relatedInformation;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('severity');
      try {
        if (obj['severity'] != null &&
            !(DiagnosticSeverity.canParse(obj['severity'], reporter))) {
          reporter.reportError('must be of type DiagnosticSeverity');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('code');
      try {
        if (obj['code'] != null && !(obj['code'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('source');
      try {
        if (obj['source'] != null && !(obj['source'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('message');
      try {
        if (!obj.containsKey('message')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['message'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['message'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('tags');
      try {
        if (obj['tags'] != null &&
            !((obj['tags'] is List &&
                (obj['tags'].every(
                    (item) => DiagnosticTag.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DiagnosticTag>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('relatedInformation');
      try {
        if (obj['relatedInformation'] != null &&
            !((obj['relatedInformation'] is List &&
                (obj['relatedInformation'].every((item) =>
                    DiagnosticRelatedInformation.canParse(item, reporter)))))) {
          reporter.reportError(
              'must be of type List<DiagnosticRelatedInformation>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type Diagnostic');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Diagnostic && other.runtimeType == Diagnostic) {
      return range == other.range &&
          severity == other.severity &&
          code == other.code &&
          source == other.source &&
          message == other.message &&
          listEqual(
              tags, other.tags, (DiagnosticTag a, DiagnosticTag b) => a == b) &&
          listEqual(
              relatedInformation,
              other.relatedInformation,
              (DiagnosticRelatedInformation a,
                      DiagnosticRelatedInformation b) =>
                  a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, severity.hashCode);
    hash = JenkinsSmiHash.combine(hash, code.hashCode);
    hash = JenkinsSmiHash.combine(hash, source.hashCode);
    hash = JenkinsSmiHash.combine(hash, message.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(tags));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(relatedInformation));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Represents a related message and source code location for a diagnostic. This
/// should be used to point to code locations that cause or are related to a
/// diagnostics, e.g when duplicating a symbol in a scope.
class DiagnosticRelatedInformation implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DiagnosticRelatedInformation.canParse,
      DiagnosticRelatedInformation.fromJson);

  DiagnosticRelatedInformation(
      {@required this.location, @required this.message}) {
    if (location == null) {
      throw 'location is required but was not provided';
    }
    if (message == null) {
      throw 'message is required but was not provided';
    }
  }
  static DiagnosticRelatedInformation fromJson(Map<String, dynamic> json) {
    final location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    final message = json['message'];
    return DiagnosticRelatedInformation(location: location, message: message);
  }

  /// The location of this related diagnostic information.
  final Location location;

  /// The message of this related diagnostic information.
  final String message;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['location'] =
        location ?? (throw 'location is required but was not set');
    __result['message'] =
        message ?? (throw 'message is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('location');
      try {
        if (!obj.containsKey('location')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['location'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Location.canParse(obj['location'], reporter))) {
          reporter.reportError('must be of type Location');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('message');
      try {
        if (!obj.containsKey('message')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['message'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['message'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DiagnosticRelatedInformation');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DiagnosticRelatedInformation &&
        other.runtimeType == DiagnosticRelatedInformation) {
      return location == other.location && message == other.message && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, location.hashCode);
    hash = JenkinsSmiHash.combine(hash, message.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DiagnosticSeverity {
  const DiagnosticSeverity(this._value);
  const DiagnosticSeverity.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// Reports an error.
  static const Error = DiagnosticSeverity(1);

  /// Reports a warning.
  static const Warning = DiagnosticSeverity(2);

  /// Reports an information.
  static const Information = DiagnosticSeverity(3);

  /// Reports a hint.
  static const Hint = DiagnosticSeverity(4);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is DiagnosticSeverity && o._value == _value;
}

/// The diagnostic tags.
///  @since 3.15.0
class DiagnosticTag {
  const DiagnosticTag(this._value);
  const DiagnosticTag.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// Unused or unnecessary code.
  ///
  /// Clients are allowed to render diagnostics with this tag faded out instead
  /// of having an error squiggle.
  static const Unnecessary = DiagnosticTag(1);

  /// Deprecated or obsolete code.
  ///
  /// Clients are allowed to rendered diagnostics with this tag strike through.
  static const Deprecated = DiagnosticTag(2);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is DiagnosticTag && o._value == _value;
}

class DidChangeConfigurationClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DidChangeConfigurationClientCapabilities.canParse,
      DidChangeConfigurationClientCapabilities.fromJson);

  DidChangeConfigurationClientCapabilities({this.dynamicRegistration});
  static DidChangeConfigurationClientCapabilities fromJson(
      Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return DidChangeConfigurationClientCapabilities(
        dynamicRegistration: dynamicRegistration);
  }

  /// Did change configuration notification supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type DidChangeConfigurationClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DidChangeConfigurationClientCapabilities &&
        other.runtimeType == DidChangeConfigurationClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DidChangeConfigurationParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DidChangeConfigurationParams.canParse,
      DidChangeConfigurationParams.fromJson);

  DidChangeConfigurationParams({this.settings});
  static DidChangeConfigurationParams fromJson(Map<String, dynamic> json) {
    final settings = json['settings'];
    return DidChangeConfigurationParams(settings: settings);
  }

  /// The actual changed settings
  final dynamic settings;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['settings'] = settings;
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('settings');
      try {
        if (!obj.containsKey('settings')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['settings'] != null && !(true)) {
          reporter.reportError('must be of type dynamic');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DidChangeConfigurationParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DidChangeConfigurationParams &&
        other.runtimeType == DidChangeConfigurationParams) {
      return settings == other.settings && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, settings.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DidChangeTextDocumentParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DidChangeTextDocumentParams.canParse,
      DidChangeTextDocumentParams.fromJson);

  DidChangeTextDocumentParams(
      {@required this.textDocument, @required this.contentChanges}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (contentChanges == null) {
      throw 'contentChanges is required but was not provided';
    }
  }
  static DidChangeTextDocumentParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? VersionedTextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final contentChanges = json['contentChanges']
        ?.map((item) => TextDocumentContentChangeEvent1.canParse(
                item, nullLspJsonReporter)
            ? Either2<TextDocumentContentChangeEvent1, TextDocumentContentChangeEvent2>.t1(
                item != null
                    ? TextDocumentContentChangeEvent1.fromJson(item)
                    : null)
            : (TextDocumentContentChangeEvent2.canParse(item, nullLspJsonReporter)
                ? Either2<TextDocumentContentChangeEvent1,
                        TextDocumentContentChangeEvent2>.t2(
                    item != null
                        ? TextDocumentContentChangeEvent2.fromJson(item)
                        : null)
                : (throw '''${item} was not one of (TextDocumentContentChangeEvent1, TextDocumentContentChangeEvent2)''')))
        ?.cast<Either2<TextDocumentContentChangeEvent1, TextDocumentContentChangeEvent2>>()
        ?.toList();
    return DidChangeTextDocumentParams(
        textDocument: textDocument, contentChanges: contentChanges);
  }

  /// The actual content changes. The content changes describe single state
  /// changes to the document. So if there are two content changes c1 (at array
  /// index 0) and c2 (at array index 1) for a document in state S then c1 moves
  /// the document from S to S' and c2 from S' to S''. So c1 is computed on the
  /// state S and c2 is computed on the state S'.
  ///
  /// To mirror the content of a document using change events use the following
  /// approach:
  /// - start with the same initial content
  /// - apply the 'textDocument/didChange' notifications in the order you
  /// recevie them.
  /// - apply the `TextDocumentContentChangeEvent`s in a single notification in
  /// the order
  ///   you receive them.
  final List<
      Either2<TextDocumentContentChangeEvent1,
          TextDocumentContentChangeEvent2>> contentChanges;

  /// The document that did change. The version number points to the version
  /// after all provided content changes have been applied.
  final VersionedTextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['contentChanges'] =
        contentChanges ?? (throw 'contentChanges is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(VersionedTextDocumentIdentifier.canParse(
            obj['textDocument'], reporter))) {
          reporter
              .reportError('must be of type VersionedTextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('contentChanges');
      try {
        if (!obj.containsKey('contentChanges')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['contentChanges'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['contentChanges'] is List &&
            (obj['contentChanges'].every((item) =>
                (TextDocumentContentChangeEvent1.canParse(item, reporter) ||
                    TextDocumentContentChangeEvent2.canParse(
                        item, reporter))))))) {
          reporter.reportError(
              'must be of type List<Either2<TextDocumentContentChangeEvent1, TextDocumentContentChangeEvent2>>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DidChangeTextDocumentParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DidChangeTextDocumentParams &&
        other.runtimeType == DidChangeTextDocumentParams) {
      return textDocument == other.textDocument &&
          listEqual(
              contentChanges,
              other.contentChanges,
              (Either2<TextDocumentContentChangeEvent1,
                              TextDocumentContentChangeEvent2>
                          a,
                      Either2<TextDocumentContentChangeEvent1,
                              TextDocumentContentChangeEvent2>
                          b) =>
                  a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(contentChanges));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DidChangeWatchedFilesClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DidChangeWatchedFilesClientCapabilities.canParse,
      DidChangeWatchedFilesClientCapabilities.fromJson);

  DidChangeWatchedFilesClientCapabilities({this.dynamicRegistration});
  static DidChangeWatchedFilesClientCapabilities fromJson(
      Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return DidChangeWatchedFilesClientCapabilities(
        dynamicRegistration: dynamicRegistration);
  }

  /// Did change watched files notification supports dynamic registration.
  /// Please note that the current protocol doesn't support static configuration
  /// for file changes from the server side.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type DidChangeWatchedFilesClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DidChangeWatchedFilesClientCapabilities &&
        other.runtimeType == DidChangeWatchedFilesClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DidChangeWatchedFilesParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DidChangeWatchedFilesParams.canParse,
      DidChangeWatchedFilesParams.fromJson);

  DidChangeWatchedFilesParams({@required this.changes}) {
    if (changes == null) {
      throw 'changes is required but was not provided';
    }
  }
  static DidChangeWatchedFilesParams fromJson(Map<String, dynamic> json) {
    final changes = json['changes']
        ?.map((item) => item != null ? FileEvent.fromJson(item) : null)
        ?.cast<FileEvent>()
        ?.toList();
    return DidChangeWatchedFilesParams(changes: changes);
  }

  /// The actual file events.
  final List<FileEvent> changes;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['changes'] =
        changes ?? (throw 'changes is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('changes');
      try {
        if (!obj.containsKey('changes')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['changes'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['changes'] is List &&
            (obj['changes']
                .every((item) => FileEvent.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<FileEvent>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DidChangeWatchedFilesParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DidChangeWatchedFilesParams &&
        other.runtimeType == DidChangeWatchedFilesParams) {
      return listEqual(
              changes, other.changes, (FileEvent a, FileEvent b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(changes));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Describe options to be used when registering for file system change events.
class DidChangeWatchedFilesRegistrationOptions implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DidChangeWatchedFilesRegistrationOptions.canParse,
      DidChangeWatchedFilesRegistrationOptions.fromJson);

  DidChangeWatchedFilesRegistrationOptions({@required this.watchers}) {
    if (watchers == null) {
      throw 'watchers is required but was not provided';
    }
  }
  static DidChangeWatchedFilesRegistrationOptions fromJson(
      Map<String, dynamic> json) {
    final watchers = json['watchers']
        ?.map((item) => item != null ? FileSystemWatcher.fromJson(item) : null)
        ?.cast<FileSystemWatcher>()
        ?.toList();
    return DidChangeWatchedFilesRegistrationOptions(watchers: watchers);
  }

  /// The watchers to register.
  final List<FileSystemWatcher> watchers;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['watchers'] =
        watchers ?? (throw 'watchers is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('watchers');
      try {
        if (!obj.containsKey('watchers')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['watchers'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['watchers'] is List &&
            (obj['watchers'].every(
                (item) => FileSystemWatcher.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<FileSystemWatcher>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type DidChangeWatchedFilesRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DidChangeWatchedFilesRegistrationOptions &&
        other.runtimeType == DidChangeWatchedFilesRegistrationOptions) {
      return listEqual(watchers, other.watchers,
              (FileSystemWatcher a, FileSystemWatcher b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(watchers));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DidChangeWorkspaceFoldersParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DidChangeWorkspaceFoldersParams.canParse,
      DidChangeWorkspaceFoldersParams.fromJson);

  DidChangeWorkspaceFoldersParams({@required this.event}) {
    if (event == null) {
      throw 'event is required but was not provided';
    }
  }
  static DidChangeWorkspaceFoldersParams fromJson(Map<String, dynamic> json) {
    final event = json['event'] != null
        ? WorkspaceFoldersChangeEvent.fromJson(json['event'])
        : null;
    return DidChangeWorkspaceFoldersParams(event: event);
  }

  /// The actual workspace folder change event.
  final WorkspaceFoldersChangeEvent event;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['event'] = event ?? (throw 'event is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('event');
      try {
        if (!obj.containsKey('event')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['event'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(WorkspaceFoldersChangeEvent.canParse(obj['event'], reporter))) {
          reporter.reportError('must be of type WorkspaceFoldersChangeEvent');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DidChangeWorkspaceFoldersParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DidChangeWorkspaceFoldersParams &&
        other.runtimeType == DidChangeWorkspaceFoldersParams) {
      return event == other.event && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, event.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DidCloseTextDocumentParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DidCloseTextDocumentParams.canParse, DidCloseTextDocumentParams.fromJson);

  DidCloseTextDocumentParams({@required this.textDocument}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
  }
  static DidCloseTextDocumentParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    return DidCloseTextDocumentParams(textDocument: textDocument);
  }

  /// The document that was closed.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DidCloseTextDocumentParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DidCloseTextDocumentParams &&
        other.runtimeType == DidCloseTextDocumentParams) {
      return textDocument == other.textDocument && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DidOpenTextDocumentParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DidOpenTextDocumentParams.canParse, DidOpenTextDocumentParams.fromJson);

  DidOpenTextDocumentParams({@required this.textDocument}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
  }
  static DidOpenTextDocumentParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentItem.fromJson(json['textDocument'])
        : null;
    return DidOpenTextDocumentParams(textDocument: textDocument);
  }

  /// The document that was opened.
  final TextDocumentItem textDocument;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentItem.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentItem');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DidOpenTextDocumentParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DidOpenTextDocumentParams &&
        other.runtimeType == DidOpenTextDocumentParams) {
      return textDocument == other.textDocument && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DidSaveTextDocumentParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DidSaveTextDocumentParams.canParse, DidSaveTextDocumentParams.fromJson);

  DidSaveTextDocumentParams({@required this.textDocument, this.text}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
  }
  static DidSaveTextDocumentParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final text = json['text'];
    return DidSaveTextDocumentParams(textDocument: textDocument, text: text);
  }

  /// Optional the content when saved. Depends on the includeText value when the
  /// save notification was requested.
  final String text;

  /// The document that was saved.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    if (text != null) {
      __result['text'] = text;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('text');
      try {
        if (obj['text'] != null && !(obj['text'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DidSaveTextDocumentParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DidSaveTextDocumentParams &&
        other.runtimeType == DidSaveTextDocumentParams) {
      return textDocument == other.textDocument && text == other.text && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, text.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentColorClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentColorClientCapabilities.canParse,
      DocumentColorClientCapabilities.fromJson);

  DocumentColorClientCapabilities({this.dynamicRegistration});
  static DocumentColorClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return DocumentColorClientCapabilities(
        dynamicRegistration: dynamicRegistration);
  }

  /// Whether document color supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentColorClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentColorClientCapabilities &&
        other.runtimeType == DocumentColorClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentColorOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentColorOptions.canParse, DocumentColorOptions.fromJson);

  DocumentColorOptions({this.workDoneProgress});
  static DocumentColorOptions fromJson(Map<String, dynamic> json) {
    if (DocumentColorRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentColorRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return DocumentColorOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentColorOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentColorOptions &&
        other.runtimeType == DocumentColorOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentColorParams
    implements WorkDoneProgressParams, PartialResultParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentColorParams.canParse, DocumentColorParams.fromJson);

  DocumentColorParams(
      {@required this.textDocument,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
  }
  static DocumentColorParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return DocumentColorParams(
        textDocument: textDocument,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentColorParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentColorParams &&
        other.runtimeType == DocumentColorParams) {
      return textDocument == other.textDocument &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentColorRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions,
        DocumentColorOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentColorRegistrationOptions.canParse,
      DocumentColorRegistrationOptions.fromJson);

  DocumentColorRegistrationOptions(
      {this.documentSelector, this.id, this.workDoneProgress});
  static DocumentColorRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final id = json['id'];
    final workDoneProgress = json['workDoneProgress'];
    return DocumentColorRegistrationOptions(
        documentSelector: documentSelector,
        id: id,
        workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String id;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (id != null) {
      __result['id'] = id;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('id');
      try {
        if (obj['id'] != null && !(obj['id'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentColorRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentColorRegistrationOptions &&
        other.runtimeType == DocumentColorRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          id == other.id &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentFilter implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DocumentFilter.canParse, DocumentFilter.fromJson);

  DocumentFilter({this.language, this.scheme, this.pattern});
  static DocumentFilter fromJson(Map<String, dynamic> json) {
    final language = json['language'];
    final scheme = json['scheme'];
    final pattern = json['pattern'];
    return DocumentFilter(language: language, scheme: scheme, pattern: pattern);
  }

  /// A language id, like `typescript`.
  final String language;

  /// A glob pattern, like `*.{ts,js}`.
  ///
  /// Glob patterns can have the following syntax:
  /// - `*` to match one or more characters in a path segment
  /// - `?` to match on one character in a path segment
  /// - `**` to match any number of path segments, including none
  /// - `{}` to group conditions (e.g. `**​/*.{ts,js}` matches all TypeScript
  /// and JavaScript files)
  /// - `[]` to declare a range of characters to match in a path segment (e.g.,
  /// `example.[0-9]` to match on `example.0`, `example.1`, …)
  /// - `[!...]` to negate a range of characters to match in a path segment
  /// (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not
  /// `example.0`)
  final String pattern;

  /// A Uri [scheme](#Uri.scheme), like `file` or `untitled`.
  final String scheme;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (language != null) {
      __result['language'] = language;
    }
    if (scheme != null) {
      __result['scheme'] = scheme;
    }
    if (pattern != null) {
      __result['pattern'] = pattern;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('language');
      try {
        if (obj['language'] != null && !(obj['language'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('scheme');
      try {
        if (obj['scheme'] != null && !(obj['scheme'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('pattern');
      try {
        if (obj['pattern'] != null && !(obj['pattern'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentFilter');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentFilter && other.runtimeType == DocumentFilter) {
      return language == other.language &&
          scheme == other.scheme &&
          pattern == other.pattern &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, language.hashCode);
    hash = JenkinsSmiHash.combine(hash, scheme.hashCode);
    hash = JenkinsSmiHash.combine(hash, pattern.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentFormattingClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentFormattingClientCapabilities.canParse,
      DocumentFormattingClientCapabilities.fromJson);

  DocumentFormattingClientCapabilities({this.dynamicRegistration});
  static DocumentFormattingClientCapabilities fromJson(
      Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return DocumentFormattingClientCapabilities(
        dynamicRegistration: dynamicRegistration);
  }

  /// Whether formatting supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter
          .reportError('must be of type DocumentFormattingClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentFormattingClientCapabilities &&
        other.runtimeType == DocumentFormattingClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentFormattingOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentFormattingOptions.canParse, DocumentFormattingOptions.fromJson);

  DocumentFormattingOptions({this.workDoneProgress});
  static DocumentFormattingOptions fromJson(Map<String, dynamic> json) {
    if (DocumentFormattingRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return DocumentFormattingRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return DocumentFormattingOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentFormattingOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentFormattingOptions &&
        other.runtimeType == DocumentFormattingOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentFormattingParams implements WorkDoneProgressParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentFormattingParams.canParse, DocumentFormattingParams.fromJson);

  DocumentFormattingParams(
      {@required this.textDocument,
      @required this.options,
      this.workDoneToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (options == null) {
      throw 'options is required but was not provided';
    }
  }
  static DocumentFormattingParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final options = json['options'] != null
        ? FormattingOptions.fromJson(json['options'])
        : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    return DocumentFormattingParams(
        textDocument: textDocument,
        options: options,
        workDoneToken: workDoneToken);
  }

  /// The format options.
  final FormattingOptions options;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['options'] =
        options ?? (throw 'options is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('options');
      try {
        if (!obj.containsKey('options')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['options'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(FormattingOptions.canParse(obj['options'], reporter))) {
          reporter.reportError('must be of type FormattingOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentFormattingParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentFormattingParams &&
        other.runtimeType == DocumentFormattingParams) {
      return textDocument == other.textDocument &&
          options == other.options &&
          workDoneToken == other.workDoneToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, options.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentFormattingRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DocumentFormattingOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentFormattingRegistrationOptions.canParse,
      DocumentFormattingRegistrationOptions.fromJson);

  DocumentFormattingRegistrationOptions(
      {this.documentSelector, this.workDoneProgress});
  static DocumentFormattingRegistrationOptions fromJson(
      Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return DocumentFormattingRegistrationOptions(
        documentSelector: documentSelector, workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter
          .reportError('must be of type DocumentFormattingRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentFormattingRegistrationOptions &&
        other.runtimeType == DocumentFormattingRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// A document highlight is a range inside a text document which deserves
/// special attention. Usually a document highlight is visualized by changing
/// the background color of its range.
class DocumentHighlight implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DocumentHighlight.canParse, DocumentHighlight.fromJson);

  DocumentHighlight({@required this.range, this.kind}) {
    if (range == null) {
      throw 'range is required but was not provided';
    }
  }
  static DocumentHighlight fromJson(Map<String, dynamic> json) {
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final kind = json['kind'] != null
        ? DocumentHighlightKind.fromJson(json['kind'])
        : null;
    return DocumentHighlight(range: range, kind: kind);
  }

  /// The highlight kind, default is DocumentHighlightKind.Text.
  final DocumentHighlightKind kind;

  /// The range this highlight applies to.
  final Range range;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['range'] = range ?? (throw 'range is required but was not set');
    if (kind != null) {
      __result['kind'] = kind;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('kind');
      try {
        if (obj['kind'] != null &&
            !(DocumentHighlightKind.canParse(obj['kind'], reporter))) {
          reporter.reportError('must be of type DocumentHighlightKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentHighlight');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentHighlight && other.runtimeType == DocumentHighlight) {
      return range == other.range && kind == other.kind && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentHighlightClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentHighlightClientCapabilities.canParse,
      DocumentHighlightClientCapabilities.fromJson);

  DocumentHighlightClientCapabilities({this.dynamicRegistration});
  static DocumentHighlightClientCapabilities fromJson(
      Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return DocumentHighlightClientCapabilities(
        dynamicRegistration: dynamicRegistration);
  }

  /// Whether document highlight supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter
          .reportError('must be of type DocumentHighlightClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentHighlightClientCapabilities &&
        other.runtimeType == DocumentHighlightClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// A document highlight kind.
class DocumentHighlightKind {
  const DocumentHighlightKind(this._value);
  const DocumentHighlightKind.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// A textual occurrence.
  static const Text = DocumentHighlightKind(1);

  /// Read-access of a symbol, like reading a variable.
  static const Read = DocumentHighlightKind(2);

  /// Write-access of a symbol, like writing to a variable.
  static const Write = DocumentHighlightKind(3);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) =>
      o is DocumentHighlightKind && o._value == _value;
}

class DocumentHighlightOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentHighlightOptions.canParse, DocumentHighlightOptions.fromJson);

  DocumentHighlightOptions({this.workDoneProgress});
  static DocumentHighlightOptions fromJson(Map<String, dynamic> json) {
    if (DocumentHighlightRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return DocumentHighlightRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return DocumentHighlightOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentHighlightOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentHighlightOptions &&
        other.runtimeType == DocumentHighlightOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentHighlightParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentHighlightParams.canParse, DocumentHighlightParams.fromJson);

  DocumentHighlightParams(
      {@required this.textDocument,
      @required this.position,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static DocumentHighlightParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return DocumentHighlightParams(
        textDocument: textDocument,
        position: position,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentHighlightParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentHighlightParams &&
        other.runtimeType == DocumentHighlightParams) {
      return textDocument == other.textDocument &&
          position == other.position &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentHighlightRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DocumentHighlightOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentHighlightRegistrationOptions.canParse,
      DocumentHighlightRegistrationOptions.fromJson);

  DocumentHighlightRegistrationOptions(
      {this.documentSelector, this.workDoneProgress});
  static DocumentHighlightRegistrationOptions fromJson(
      Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return DocumentHighlightRegistrationOptions(
        documentSelector: documentSelector, workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter
          .reportError('must be of type DocumentHighlightRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentHighlightRegistrationOptions &&
        other.runtimeType == DocumentHighlightRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// A document link is a range in a text document that links to an internal or
/// external resource, like another text document or a web site.
class DocumentLink implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DocumentLink.canParse, DocumentLink.fromJson);

  DocumentLink({@required this.range, this.target, this.tooltip, this.data}) {
    if (range == null) {
      throw 'range is required but was not provided';
    }
  }
  static DocumentLink fromJson(Map<String, dynamic> json) {
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final target = json['target'];
    final tooltip = json['tooltip'];
    final data = json['data'];
    return DocumentLink(
        range: range, target: target, tooltip: tooltip, data: data);
  }

  /// A data entry field that is preserved on a document link between a
  /// DocumentLinkRequest and a DocumentLinkResolveRequest.
  final dynamic data;

  /// The range this link applies to.
  final Range range;

  /// The uri this link points to. If missing a resolve request is sent later.
  final String target;

  /// The tooltip text when you hover over this link.
  ///
  /// If a tooltip is provided, is will be displayed in a string that includes
  /// instructions on how to trigger the link, such as `{0} (ctrl + click)`. The
  /// specific instructions vary depending on OS, user settings, and
  /// localization.
  ///  @since 3.15.0
  final String tooltip;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['range'] = range ?? (throw 'range is required but was not set');
    if (target != null) {
      __result['target'] = target;
    }
    if (tooltip != null) {
      __result['tooltip'] = tooltip;
    }
    if (data != null) {
      __result['data'] = data;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('target');
      try {
        if (obj['target'] != null && !(obj['target'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('tooltip');
      try {
        if (obj['tooltip'] != null && !(obj['tooltip'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('data');
      try {
        if (obj['data'] != null && !(true)) {
          reporter.reportError('must be of type dynamic');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentLink');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentLink && other.runtimeType == DocumentLink) {
      return range == other.range &&
          target == other.target &&
          tooltip == other.tooltip &&
          data == other.data &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, target.hashCode);
    hash = JenkinsSmiHash.combine(hash, tooltip.hashCode);
    hash = JenkinsSmiHash.combine(hash, data.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentLinkClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentLinkClientCapabilities.canParse,
      DocumentLinkClientCapabilities.fromJson);

  DocumentLinkClientCapabilities(
      {this.dynamicRegistration, this.tooltipSupport});
  static DocumentLinkClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final tooltipSupport = json['tooltipSupport'];
    return DocumentLinkClientCapabilities(
        dynamicRegistration: dynamicRegistration,
        tooltipSupport: tooltipSupport);
  }

  /// Whether document link supports dynamic registration.
  final bool dynamicRegistration;

  /// Whether the client supports the `tooltip` property on `DocumentLink`.
  ///  @since 3.15.0
  final bool tooltipSupport;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (tooltipSupport != null) {
      __result['tooltipSupport'] = tooltipSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('tooltipSupport');
      try {
        if (obj['tooltipSupport'] != null && !(obj['tooltipSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentLinkClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentLinkClientCapabilities &&
        other.runtimeType == DocumentLinkClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          tooltipSupport == other.tooltipSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, tooltipSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentLinkOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentLinkOptions.canParse, DocumentLinkOptions.fromJson);

  DocumentLinkOptions({this.resolveProvider, this.workDoneProgress});
  static DocumentLinkOptions fromJson(Map<String, dynamic> json) {
    if (DocumentLinkRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentLinkRegistrationOptions.fromJson(json);
    }
    final resolveProvider = json['resolveProvider'];
    final workDoneProgress = json['workDoneProgress'];
    return DocumentLinkOptions(
        resolveProvider: resolveProvider, workDoneProgress: workDoneProgress);
  }

  /// Document links have a resolve provider as well.
  final bool resolveProvider;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (resolveProvider != null) {
      __result['resolveProvider'] = resolveProvider;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('resolveProvider');
      try {
        if (obj['resolveProvider'] != null &&
            !(obj['resolveProvider'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentLinkOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentLinkOptions &&
        other.runtimeType == DocumentLinkOptions) {
      return resolveProvider == other.resolveProvider &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, resolveProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentLinkParams
    implements WorkDoneProgressParams, PartialResultParams, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DocumentLinkParams.canParse, DocumentLinkParams.fromJson);

  DocumentLinkParams(
      {@required this.textDocument,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
  }
  static DocumentLinkParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return DocumentLinkParams(
        textDocument: textDocument,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The document to provide document links for.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentLinkParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentLinkParams &&
        other.runtimeType == DocumentLinkParams) {
      return textDocument == other.textDocument &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentLinkRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DocumentLinkOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentLinkRegistrationOptions.canParse,
      DocumentLinkRegistrationOptions.fromJson);

  DocumentLinkRegistrationOptions(
      {this.documentSelector, this.resolveProvider, this.workDoneProgress});
  static DocumentLinkRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final resolveProvider = json['resolveProvider'];
    final workDoneProgress = json['workDoneProgress'];
    return DocumentLinkRegistrationOptions(
        documentSelector: documentSelector,
        resolveProvider: resolveProvider,
        workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// Document links have a resolve provider as well.
  final bool resolveProvider;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (resolveProvider != null) {
      __result['resolveProvider'] = resolveProvider;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('resolveProvider');
      try {
        if (obj['resolveProvider'] != null &&
            !(obj['resolveProvider'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentLinkRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentLinkRegistrationOptions &&
        other.runtimeType == DocumentLinkRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          resolveProvider == other.resolveProvider &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, resolveProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentOnTypeFormattingClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentOnTypeFormattingClientCapabilities.canParse,
      DocumentOnTypeFormattingClientCapabilities.fromJson);

  DocumentOnTypeFormattingClientCapabilities({this.dynamicRegistration});
  static DocumentOnTypeFormattingClientCapabilities fromJson(
      Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return DocumentOnTypeFormattingClientCapabilities(
        dynamicRegistration: dynamicRegistration);
  }

  /// Whether on type formatting supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type DocumentOnTypeFormattingClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentOnTypeFormattingClientCapabilities &&
        other.runtimeType == DocumentOnTypeFormattingClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentOnTypeFormattingOptions implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentOnTypeFormattingOptions.canParse,
      DocumentOnTypeFormattingOptions.fromJson);

  DocumentOnTypeFormattingOptions(
      {@required this.firstTriggerCharacter, this.moreTriggerCharacter}) {
    if (firstTriggerCharacter == null) {
      throw 'firstTriggerCharacter is required but was not provided';
    }
  }
  static DocumentOnTypeFormattingOptions fromJson(Map<String, dynamic> json) {
    if (DocumentOnTypeFormattingRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return DocumentOnTypeFormattingRegistrationOptions.fromJson(json);
    }
    final firstTriggerCharacter = json['firstTriggerCharacter'];
    final moreTriggerCharacter = json['moreTriggerCharacter']
        ?.map((item) => item)
        ?.cast<String>()
        ?.toList();
    return DocumentOnTypeFormattingOptions(
        firstTriggerCharacter: firstTriggerCharacter,
        moreTriggerCharacter: moreTriggerCharacter);
  }

  /// A character on which formatting should be triggered, like `}`.
  final String firstTriggerCharacter;

  /// More trigger characters.
  final List<String> moreTriggerCharacter;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['firstTriggerCharacter'] = firstTriggerCharacter ??
        (throw 'firstTriggerCharacter is required but was not set');
    if (moreTriggerCharacter != null) {
      __result['moreTriggerCharacter'] = moreTriggerCharacter;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('firstTriggerCharacter');
      try {
        if (!obj.containsKey('firstTriggerCharacter')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['firstTriggerCharacter'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['firstTriggerCharacter'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('moreTriggerCharacter');
      try {
        if (obj['moreTriggerCharacter'] != null &&
            !((obj['moreTriggerCharacter'] is List &&
                (obj['moreTriggerCharacter']
                    .every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentOnTypeFormattingOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentOnTypeFormattingOptions &&
        other.runtimeType == DocumentOnTypeFormattingOptions) {
      return firstTriggerCharacter == other.firstTriggerCharacter &&
          listEqual(moreTriggerCharacter, other.moreTriggerCharacter,
              (String a, String b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, firstTriggerCharacter.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(moreTriggerCharacter));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentOnTypeFormattingParams
    implements TextDocumentPositionParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentOnTypeFormattingParams.canParse,
      DocumentOnTypeFormattingParams.fromJson);

  DocumentOnTypeFormattingParams(
      {@required this.ch,
      @required this.options,
      @required this.textDocument,
      @required this.position}) {
    if (ch == null) {
      throw 'ch is required but was not provided';
    }
    if (options == null) {
      throw 'options is required but was not provided';
    }
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static DocumentOnTypeFormattingParams fromJson(Map<String, dynamic> json) {
    final ch = json['ch'];
    final options = json['options'] != null
        ? FormattingOptions.fromJson(json['options'])
        : null;
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    return DocumentOnTypeFormattingParams(
        ch: ch,
        options: options,
        textDocument: textDocument,
        position: position);
  }

  /// The character that has been typed.
  final String ch;

  /// The format options.
  final FormattingOptions options;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['ch'] = ch ?? (throw 'ch is required but was not set');
    __result['options'] =
        options ?? (throw 'options is required but was not set');
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('ch');
      try {
        if (!obj.containsKey('ch')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['ch'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['ch'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('options');
      try {
        if (!obj.containsKey('options')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['options'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(FormattingOptions.canParse(obj['options'], reporter))) {
          reporter.reportError('must be of type FormattingOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentOnTypeFormattingParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentOnTypeFormattingParams &&
        other.runtimeType == DocumentOnTypeFormattingParams) {
      return ch == other.ch &&
          options == other.options &&
          textDocument == other.textDocument &&
          position == other.position &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, ch.hashCode);
    hash = JenkinsSmiHash.combine(hash, options.hashCode);
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentOnTypeFormattingRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DocumentOnTypeFormattingOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentOnTypeFormattingRegistrationOptions.canParse,
      DocumentOnTypeFormattingRegistrationOptions.fromJson);

  DocumentOnTypeFormattingRegistrationOptions(
      {this.documentSelector,
      @required this.firstTriggerCharacter,
      this.moreTriggerCharacter}) {
    if (firstTriggerCharacter == null) {
      throw 'firstTriggerCharacter is required but was not provided';
    }
  }
  static DocumentOnTypeFormattingRegistrationOptions fromJson(
      Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final firstTriggerCharacter = json['firstTriggerCharacter'];
    final moreTriggerCharacter = json['moreTriggerCharacter']
        ?.map((item) => item)
        ?.cast<String>()
        ?.toList();
    return DocumentOnTypeFormattingRegistrationOptions(
        documentSelector: documentSelector,
        firstTriggerCharacter: firstTriggerCharacter,
        moreTriggerCharacter: moreTriggerCharacter);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// A character on which formatting should be triggered, like `}`.
  final String firstTriggerCharacter;

  /// More trigger characters.
  final List<String> moreTriggerCharacter;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    __result['firstTriggerCharacter'] = firstTriggerCharacter ??
        (throw 'firstTriggerCharacter is required but was not set');
    if (moreTriggerCharacter != null) {
      __result['moreTriggerCharacter'] = moreTriggerCharacter;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('firstTriggerCharacter');
      try {
        if (!obj.containsKey('firstTriggerCharacter')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['firstTriggerCharacter'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['firstTriggerCharacter'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('moreTriggerCharacter');
      try {
        if (obj['moreTriggerCharacter'] != null &&
            !((obj['moreTriggerCharacter'] is List &&
                (obj['moreTriggerCharacter']
                    .every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type DocumentOnTypeFormattingRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentOnTypeFormattingRegistrationOptions &&
        other.runtimeType == DocumentOnTypeFormattingRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          firstTriggerCharacter == other.firstTriggerCharacter &&
          listEqual(moreTriggerCharacter, other.moreTriggerCharacter,
              (String a, String b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, firstTriggerCharacter.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(moreTriggerCharacter));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentRangeFormattingClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentRangeFormattingClientCapabilities.canParse,
      DocumentRangeFormattingClientCapabilities.fromJson);

  DocumentRangeFormattingClientCapabilities({this.dynamicRegistration});
  static DocumentRangeFormattingClientCapabilities fromJson(
      Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return DocumentRangeFormattingClientCapabilities(
        dynamicRegistration: dynamicRegistration);
  }

  /// Whether formatting supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type DocumentRangeFormattingClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentRangeFormattingClientCapabilities &&
        other.runtimeType == DocumentRangeFormattingClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentRangeFormattingOptions
    implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentRangeFormattingOptions.canParse,
      DocumentRangeFormattingOptions.fromJson);

  DocumentRangeFormattingOptions({this.workDoneProgress});
  static DocumentRangeFormattingOptions fromJson(Map<String, dynamic> json) {
    if (DocumentRangeFormattingRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return DocumentRangeFormattingRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return DocumentRangeFormattingOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentRangeFormattingOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentRangeFormattingOptions &&
        other.runtimeType == DocumentRangeFormattingOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentRangeFormattingParams
    implements WorkDoneProgressParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentRangeFormattingParams.canParse,
      DocumentRangeFormattingParams.fromJson);

  DocumentRangeFormattingParams(
      {@required this.textDocument,
      @required this.range,
      @required this.options,
      this.workDoneToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (range == null) {
      throw 'range is required but was not provided';
    }
    if (options == null) {
      throw 'options is required but was not provided';
    }
  }
  static DocumentRangeFormattingParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final options = json['options'] != null
        ? FormattingOptions.fromJson(json['options'])
        : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    return DocumentRangeFormattingParams(
        textDocument: textDocument,
        range: range,
        options: options,
        workDoneToken: workDoneToken);
  }

  /// The format options
  final FormattingOptions options;

  /// The range to format
  final Range range;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['range'] = range ?? (throw 'range is required but was not set');
    __result['options'] =
        options ?? (throw 'options is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('options');
      try {
        if (!obj.containsKey('options')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['options'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(FormattingOptions.canParse(obj['options'], reporter))) {
          reporter.reportError('must be of type FormattingOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentRangeFormattingParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentRangeFormattingParams &&
        other.runtimeType == DocumentRangeFormattingParams) {
      return textDocument == other.textDocument &&
          range == other.range &&
          options == other.options &&
          workDoneToken == other.workDoneToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, options.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentRangeFormattingRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DocumentRangeFormattingOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentRangeFormattingRegistrationOptions.canParse,
      DocumentRangeFormattingRegistrationOptions.fromJson);

  DocumentRangeFormattingRegistrationOptions(
      {this.documentSelector, this.workDoneProgress});
  static DocumentRangeFormattingRegistrationOptions fromJson(
      Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return DocumentRangeFormattingRegistrationOptions(
        documentSelector: documentSelector, workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type DocumentRangeFormattingRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentRangeFormattingRegistrationOptions &&
        other.runtimeType == DocumentRangeFormattingRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Represents programming constructs like variables, classes, interfaces etc.
/// that appear in a document. Document symbols can be hierarchical and they
/// have two ranges: one that encloses its definition and one that points to its
/// most interesting range, e.g. the range of an identifier.
class DocumentSymbol implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(DocumentSymbol.canParse, DocumentSymbol.fromJson);

  DocumentSymbol(
      {@required this.name,
      this.detail,
      @required this.kind,
      this.deprecated,
      @required this.range,
      @required this.selectionRange,
      this.children}) {
    if (name == null) {
      throw 'name is required but was not provided';
    }
    if (kind == null) {
      throw 'kind is required but was not provided';
    }
    if (range == null) {
      throw 'range is required but was not provided';
    }
    if (selectionRange == null) {
      throw 'selectionRange is required but was not provided';
    }
  }
  static DocumentSymbol fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final detail = json['detail'];
    final kind =
        json['kind'] != null ? SymbolKind.fromJson(json['kind']) : null;
    final deprecated = json['deprecated'];
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final selectionRange = json['selectionRange'] != null
        ? Range.fromJson(json['selectionRange'])
        : null;
    final children = json['children']
        ?.map((item) => item != null ? DocumentSymbol.fromJson(item) : null)
        ?.cast<DocumentSymbol>()
        ?.toList();
    return DocumentSymbol(
        name: name,
        detail: detail,
        kind: kind,
        deprecated: deprecated,
        range: range,
        selectionRange: selectionRange,
        children: children);
  }

  /// Children of this symbol, e.g. properties of a class.
  final List<DocumentSymbol> children;

  /// Indicates if this symbol is deprecated.
  final bool deprecated;

  /// More detail for this symbol, e.g the signature of a function.
  final String detail;

  /// The kind of this symbol.
  final SymbolKind kind;

  /// The name of this symbol. Will be displayed in the user interface and
  /// therefore must not be an empty string or a string only consisting of white
  /// spaces.
  final String name;

  /// The range enclosing this symbol not including leading/trailing whitespace
  /// but everything else like comments. This information is typically used to
  /// determine if the clients cursor is inside the symbol to reveal in the
  /// symbol in the UI.
  final Range range;

  /// The range that should be selected and revealed when this symbol is being
  /// picked, e.g the name of a function. Must be contained by the `range`.
  final Range selectionRange;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['name'] = name ?? (throw 'name is required but was not set');
    if (detail != null) {
      __result['detail'] = detail;
    }
    __result['kind'] = kind ?? (throw 'kind is required but was not set');
    if (deprecated != null) {
      __result['deprecated'] = deprecated;
    }
    __result['range'] = range ?? (throw 'range is required but was not set');
    __result['selectionRange'] =
        selectionRange ?? (throw 'selectionRange is required but was not set');
    if (children != null) {
      __result['children'] = children;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('name');
      try {
        if (!obj.containsKey('name')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['name'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['name'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('detail');
      try {
        if (obj['detail'] != null && !(obj['detail'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('kind');
      try {
        if (!obj.containsKey('kind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['kind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(SymbolKind.canParse(obj['kind'], reporter))) {
          reporter.reportError('must be of type SymbolKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('deprecated');
      try {
        if (obj['deprecated'] != null && !(obj['deprecated'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('selectionRange');
      try {
        if (!obj.containsKey('selectionRange')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['selectionRange'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['selectionRange'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('children');
      try {
        if (obj['children'] != null &&
            !((obj['children'] is List &&
                (obj['children'].every(
                    (item) => DocumentSymbol.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentSymbol>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentSymbol');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentSymbol && other.runtimeType == DocumentSymbol) {
      return name == other.name &&
          detail == other.detail &&
          kind == other.kind &&
          deprecated == other.deprecated &&
          range == other.range &&
          selectionRange == other.selectionRange &&
          listEqual(children, other.children,
              (DocumentSymbol a, DocumentSymbol b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, name.hashCode);
    hash = JenkinsSmiHash.combine(hash, detail.hashCode);
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, deprecated.hashCode);
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, selectionRange.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(children));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentSymbolClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentSymbolClientCapabilities.canParse,
      DocumentSymbolClientCapabilities.fromJson);

  DocumentSymbolClientCapabilities(
      {this.dynamicRegistration,
      this.symbolKind,
      this.hierarchicalDocumentSymbolSupport});
  static DocumentSymbolClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final symbolKind = json['symbolKind'] != null
        ? DocumentSymbolClientCapabilitiesSymbolKind.fromJson(
            json['symbolKind'])
        : null;
    final hierarchicalDocumentSymbolSupport =
        json['hierarchicalDocumentSymbolSupport'];
    return DocumentSymbolClientCapabilities(
        dynamicRegistration: dynamicRegistration,
        symbolKind: symbolKind,
        hierarchicalDocumentSymbolSupport: hierarchicalDocumentSymbolSupport);
  }

  /// Whether document symbol supports dynamic registration.
  final bool dynamicRegistration;

  /// The client supports hierarchical document symbols.
  final bool hierarchicalDocumentSymbolSupport;

  /// Specific capabilities for the `SymbolKind` in the
  /// `textDocument/documentSymbol` request.
  final DocumentSymbolClientCapabilitiesSymbolKind symbolKind;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (symbolKind != null) {
      __result['symbolKind'] = symbolKind;
    }
    if (hierarchicalDocumentSymbolSupport != null) {
      __result['hierarchicalDocumentSymbolSupport'] =
          hierarchicalDocumentSymbolSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('symbolKind');
      try {
        if (obj['symbolKind'] != null &&
            !(DocumentSymbolClientCapabilitiesSymbolKind.canParse(
                obj['symbolKind'], reporter))) {
          reporter.reportError(
              'must be of type DocumentSymbolClientCapabilitiesSymbolKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('hierarchicalDocumentSymbolSupport');
      try {
        if (obj['hierarchicalDocumentSymbolSupport'] != null &&
            !(obj['hierarchicalDocumentSymbolSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentSymbolClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentSymbolClientCapabilities &&
        other.runtimeType == DocumentSymbolClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          symbolKind == other.symbolKind &&
          hierarchicalDocumentSymbolSupport ==
              other.hierarchicalDocumentSymbolSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, symbolKind.hashCode);
    hash = JenkinsSmiHash.combine(
        hash, hierarchicalDocumentSymbolSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentSymbolClientCapabilitiesSymbolKind implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentSymbolClientCapabilitiesSymbolKind.canParse,
      DocumentSymbolClientCapabilitiesSymbolKind.fromJson);

  DocumentSymbolClientCapabilitiesSymbolKind({this.valueSet});
  static DocumentSymbolClientCapabilitiesSymbolKind fromJson(
      Map<String, dynamic> json) {
    final valueSet = json['valueSet']
        ?.map((item) => item != null ? SymbolKind.fromJson(item) : null)
        ?.cast<SymbolKind>()
        ?.toList();
    return DocumentSymbolClientCapabilitiesSymbolKind(valueSet: valueSet);
  }

  /// The symbol kind values the client supports. When this property exists the
  /// client also guarantees that it will handle values outside its set
  /// gracefully and falls back to a default value when unknown.
  ///
  /// If this property is not present the client only supports the symbol kinds
  /// from `File` to `Array` as defined in the initial version of the protocol.
  final List<SymbolKind> valueSet;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (valueSet != null) {
      __result['valueSet'] = valueSet;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('valueSet');
      try {
        if (obj['valueSet'] != null &&
            !((obj['valueSet'] is List &&
                (obj['valueSet']
                    .every((item) => SymbolKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<SymbolKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type DocumentSymbolClientCapabilitiesSymbolKind');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentSymbolClientCapabilitiesSymbolKind &&
        other.runtimeType == DocumentSymbolClientCapabilitiesSymbolKind) {
      return listEqual(valueSet, other.valueSet,
              (SymbolKind a, SymbolKind b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(valueSet));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentSymbolOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentSymbolOptions.canParse, DocumentSymbolOptions.fromJson);

  DocumentSymbolOptions({this.workDoneProgress});
  static DocumentSymbolOptions fromJson(Map<String, dynamic> json) {
    if (DocumentSymbolRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentSymbolRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return DocumentSymbolOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentSymbolOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentSymbolOptions &&
        other.runtimeType == DocumentSymbolOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentSymbolParams
    implements WorkDoneProgressParams, PartialResultParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentSymbolParams.canParse, DocumentSymbolParams.fromJson);

  DocumentSymbolParams(
      {@required this.textDocument,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
  }
  static DocumentSymbolParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return DocumentSymbolParams(
        textDocument: textDocument,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentSymbolParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentSymbolParams &&
        other.runtimeType == DocumentSymbolParams) {
      return textDocument == other.textDocument &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class DocumentSymbolRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DocumentSymbolOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      DocumentSymbolRegistrationOptions.canParse,
      DocumentSymbolRegistrationOptions.fromJson);

  DocumentSymbolRegistrationOptions(
      {this.documentSelector, this.workDoneProgress});
  static DocumentSymbolRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return DocumentSymbolRegistrationOptions(
        documentSelector: documentSelector, workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type DocumentSymbolRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is DocumentSymbolRegistrationOptions &&
        other.runtimeType == DocumentSymbolRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ErrorCodes {
  const ErrorCodes(this._value);
  const ErrorCodes.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// Defined by JSON RPC
  static const ParseError = ErrorCodes(-32700);
  static const InvalidRequest = ErrorCodes(-32600);
  static const MethodNotFound = ErrorCodes(-32601);
  static const InvalidParams = ErrorCodes(-32602);
  static const InternalError = ErrorCodes(-32603);
  static const serverErrorStart = ErrorCodes(-32099);
  static const serverErrorEnd = ErrorCodes(-32000);
  static const ServerNotInitialized = ErrorCodes(-32002);
  static const UnknownErrorCode = ErrorCodes(-32001);

  /// Defined by the protocol.
  static const RequestCancelled = ErrorCodes(-32800);
  static const ContentModified = ErrorCodes(-32801);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is ErrorCodes && o._value == _value;
}

class ExecuteCommandClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ExecuteCommandClientCapabilities.canParse,
      ExecuteCommandClientCapabilities.fromJson);

  ExecuteCommandClientCapabilities({this.dynamicRegistration});
  static ExecuteCommandClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return ExecuteCommandClientCapabilities(
        dynamicRegistration: dynamicRegistration);
  }

  /// Execute command supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ExecuteCommandClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ExecuteCommandClientCapabilities &&
        other.runtimeType == ExecuteCommandClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ExecuteCommandOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ExecuteCommandOptions.canParse, ExecuteCommandOptions.fromJson);

  ExecuteCommandOptions({@required this.commands, this.workDoneProgress}) {
    if (commands == null) {
      throw 'commands is required but was not provided';
    }
  }
  static ExecuteCommandOptions fromJson(Map<String, dynamic> json) {
    if (ExecuteCommandRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return ExecuteCommandRegistrationOptions.fromJson(json);
    }
    final commands =
        json['commands']?.map((item) => item)?.cast<String>()?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return ExecuteCommandOptions(
        commands: commands, workDoneProgress: workDoneProgress);
  }

  /// The commands to be executed on the server
  final List<String> commands;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['commands'] =
        commands ?? (throw 'commands is required but was not set');
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('commands');
      try {
        if (!obj.containsKey('commands')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['commands'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['commands'] is List &&
            (obj['commands'].every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ExecuteCommandOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ExecuteCommandOptions &&
        other.runtimeType == ExecuteCommandOptions) {
      return listEqual(
              commands, other.commands, (String a, String b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(commands));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ExecuteCommandParams implements WorkDoneProgressParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ExecuteCommandParams.canParse, ExecuteCommandParams.fromJson);

  ExecuteCommandParams(
      {@required this.command, this.arguments, this.workDoneToken}) {
    if (command == null) {
      throw 'command is required but was not provided';
    }
  }
  static ExecuteCommandParams fromJson(Map<String, dynamic> json) {
    final command = json['command'];
    final arguments =
        json['arguments']?.map((item) => item)?.cast<dynamic>()?.toList();
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    return ExecuteCommandParams(
        command: command, arguments: arguments, workDoneToken: workDoneToken);
  }

  /// Arguments that the command should be invoked with.
  final List<dynamic> arguments;

  /// The identifier of the actual command handler.
  final String command;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['command'] =
        command ?? (throw 'command is required but was not set');
    if (arguments != null) {
      __result['arguments'] = arguments;
    }
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('command');
      try {
        if (!obj.containsKey('command')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['command'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['command'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('arguments');
      try {
        if (obj['arguments'] != null &&
            !((obj['arguments'] is List &&
                (obj['arguments'].every((item) => true))))) {
          reporter.reportError('must be of type List<dynamic>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ExecuteCommandParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ExecuteCommandParams &&
        other.runtimeType == ExecuteCommandParams) {
      return command == other.command &&
          listEqual(
              arguments, other.arguments, (dynamic a, dynamic b) => a == b) &&
          workDoneToken == other.workDoneToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, command.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(arguments));
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Execute command registration options.
class ExecuteCommandRegistrationOptions
    implements ExecuteCommandOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ExecuteCommandRegistrationOptions.canParse,
      ExecuteCommandRegistrationOptions.fromJson);

  ExecuteCommandRegistrationOptions(
      {@required this.commands, this.workDoneProgress}) {
    if (commands == null) {
      throw 'commands is required but was not provided';
    }
  }
  static ExecuteCommandRegistrationOptions fromJson(Map<String, dynamic> json) {
    final commands =
        json['commands']?.map((item) => item)?.cast<String>()?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return ExecuteCommandRegistrationOptions(
        commands: commands, workDoneProgress: workDoneProgress);
  }

  /// The commands to be executed on the server
  final List<String> commands;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['commands'] =
        commands ?? (throw 'commands is required but was not set');
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('commands');
      try {
        if (!obj.containsKey('commands')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['commands'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['commands'] is List &&
            (obj['commands'].every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ExecuteCommandRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ExecuteCommandRegistrationOptions &&
        other.runtimeType == ExecuteCommandRegistrationOptions) {
      return listEqual(
              commands, other.commands, (String a, String b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(commands));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class FailureHandlingKind {
  const FailureHandlingKind._(this._value);
  const FailureHandlingKind.fromJson(this._value);

  final String _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    switch (obj) {
      case 'abort':
      case 'transactional':
      case 'textOnlyTransactional':
      case 'undo':
        return true;
    }
    return false;
  }

  /// Applying the workspace change is simply aborted if one of the changes
  /// provided fails. All operations executed before the failing operation stay
  /// executed.
  static const Abort = FailureHandlingKind._('abort');

  /// All operations are executed transactional. That means they either all
  /// succeed or no changes at all are applied to the workspace.
  static const Transactional = FailureHandlingKind._('transactional');

  /// If the workspace edit contains only textual file changes they are executed
  /// transactional. If resource changes (create, rename or delete file) are
  /// part of the change the failure handling strategy is abort.
  static const TextOnlyTransactional =
      FailureHandlingKind._('textOnlyTransactional');

  /// The client tries to undo the operations already executed. But there is no
  /// guarantee that this is succeeding.
  static const Undo = FailureHandlingKind._('undo');

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is FailureHandlingKind && o._value == _value;
}

/// The file event type.
class FileChangeType {
  const FileChangeType(this._value);
  const FileChangeType.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// The file got created.
  static const Created = FileChangeType(1);

  /// The file got changed.
  static const Changed = FileChangeType(2);

  /// The file got deleted.
  static const Deleted = FileChangeType(3);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is FileChangeType && o._value == _value;
}

/// An event describing a file change.
class FileEvent implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(FileEvent.canParse, FileEvent.fromJson);

  FileEvent({@required this.uri, @required this.type}) {
    if (uri == null) {
      throw 'uri is required but was not provided';
    }
    if (type == null) {
      throw 'type is required but was not provided';
    }
  }
  static FileEvent fromJson(Map<String, dynamic> json) {
    final uri = json['uri'];
    final type = json['type'];
    return FileEvent(uri: uri, type: type);
  }

  /// The change type.
  final num type;

  /// The file's URI.
  final String uri;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['uri'] = uri ?? (throw 'uri is required but was not set');
    __result['type'] = type ?? (throw 'type is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('uri');
      try {
        if (!obj.containsKey('uri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['uri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['uri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('type');
      try {
        if (!obj.containsKey('type')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['type'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['type'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type FileEvent');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is FileEvent && other.runtimeType == FileEvent) {
      return uri == other.uri && type == other.type && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, uri.hashCode);
    hash = JenkinsSmiHash.combine(hash, type.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class FileSystemWatcher implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(FileSystemWatcher.canParse, FileSystemWatcher.fromJson);

  FileSystemWatcher({@required this.globPattern, this.kind}) {
    if (globPattern == null) {
      throw 'globPattern is required but was not provided';
    }
  }
  static FileSystemWatcher fromJson(Map<String, dynamic> json) {
    final globPattern = json['globPattern'];
    final kind = json['kind'] != null ? WatchKind.fromJson(json['kind']) : null;
    return FileSystemWatcher(globPattern: globPattern, kind: kind);
  }

  /// The  glob pattern to watch.
  ///
  /// Glob patterns can have the following syntax:
  /// - `*` to match one or more characters in a path segment
  /// - `?` to match on one character in a path segment
  /// - `**` to match any number of path segments, including none
  /// - `{}` to group conditions (e.g. `**​/*.{ts,js}` matches all TypeScript
  /// and JavaScript files)
  /// - `[]` to declare a range of characters to match in a path segment (e.g.,
  /// `example.[0-9]` to match on `example.0`, `example.1`, …)
  /// - `[!...]` to negate a range of characters to match in a path segment
  /// (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not
  /// `example.0`)
  final String globPattern;

  /// The kind of events of interest. If omitted it defaults to WatchKind.Create
  /// | WatchKind.Change | WatchKind.Delete which is 7.
  final WatchKind kind;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['globPattern'] =
        globPattern ?? (throw 'globPattern is required but was not set');
    if (kind != null) {
      __result['kind'] = kind;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('globPattern');
      try {
        if (!obj.containsKey('globPattern')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['globPattern'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['globPattern'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('kind');
      try {
        if (obj['kind'] != null &&
            !(WatchKind.canParse(obj['kind'], reporter))) {
          reporter.reportError('must be of type WatchKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type FileSystemWatcher');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is FileSystemWatcher && other.runtimeType == FileSystemWatcher) {
      return globPattern == other.globPattern && kind == other.kind && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, globPattern.hashCode);
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Represents a folding range.
class FoldingRange implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(FoldingRange.canParse, FoldingRange.fromJson);

  FoldingRange(
      {@required this.startLine,
      this.startCharacter,
      @required this.endLine,
      this.endCharacter,
      this.kind}) {
    if (startLine == null) {
      throw 'startLine is required but was not provided';
    }
    if (endLine == null) {
      throw 'endLine is required but was not provided';
    }
  }
  static FoldingRange fromJson(Map<String, dynamic> json) {
    final startLine = json['startLine'];
    final startCharacter = json['startCharacter'];
    final endLine = json['endLine'];
    final endCharacter = json['endCharacter'];
    final kind =
        json['kind'] != null ? FoldingRangeKind.fromJson(json['kind']) : null;
    return FoldingRange(
        startLine: startLine,
        startCharacter: startCharacter,
        endLine: endLine,
        endCharacter: endCharacter,
        kind: kind);
  }

  /// The zero-based character offset before the folded range ends. If not
  /// defined, defaults to the length of the end line.
  final num endCharacter;

  /// The zero-based line number where the folded range ends.
  final num endLine;

  /// Describes the kind of the folding range such as `comment` or `region`. The
  /// kind is used to categorize folding ranges and used by commands like 'Fold
  /// all comments'. See [FoldingRangeKind] for an enumeration of standardized
  /// kinds.
  final FoldingRangeKind kind;

  /// The zero-based character offset from where the folded range starts. If not
  /// defined, defaults to the length of the start line.
  final num startCharacter;

  /// The zero-based line number from where the folded range starts.
  final num startLine;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['startLine'] =
        startLine ?? (throw 'startLine is required but was not set');
    if (startCharacter != null) {
      __result['startCharacter'] = startCharacter;
    }
    __result['endLine'] =
        endLine ?? (throw 'endLine is required but was not set');
    if (endCharacter != null) {
      __result['endCharacter'] = endCharacter;
    }
    if (kind != null) {
      __result['kind'] = kind;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('startLine');
      try {
        if (!obj.containsKey('startLine')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['startLine'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['startLine'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('startCharacter');
      try {
        if (obj['startCharacter'] != null && !(obj['startCharacter'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('endLine');
      try {
        if (!obj.containsKey('endLine')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['endLine'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['endLine'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('endCharacter');
      try {
        if (obj['endCharacter'] != null && !(obj['endCharacter'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('kind');
      try {
        if (obj['kind'] != null &&
            !(FoldingRangeKind.canParse(obj['kind'], reporter))) {
          reporter.reportError('must be of type FoldingRangeKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type FoldingRange');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is FoldingRange && other.runtimeType == FoldingRange) {
      return startLine == other.startLine &&
          startCharacter == other.startCharacter &&
          endLine == other.endLine &&
          endCharacter == other.endCharacter &&
          kind == other.kind &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, startLine.hashCode);
    hash = JenkinsSmiHash.combine(hash, startCharacter.hashCode);
    hash = JenkinsSmiHash.combine(hash, endLine.hashCode);
    hash = JenkinsSmiHash.combine(hash, endCharacter.hashCode);
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class FoldingRangeClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      FoldingRangeClientCapabilities.canParse,
      FoldingRangeClientCapabilities.fromJson);

  FoldingRangeClientCapabilities(
      {this.dynamicRegistration, this.rangeLimit, this.lineFoldingOnly});
  static FoldingRangeClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final rangeLimit = json['rangeLimit'];
    final lineFoldingOnly = json['lineFoldingOnly'];
    return FoldingRangeClientCapabilities(
        dynamicRegistration: dynamicRegistration,
        rangeLimit: rangeLimit,
        lineFoldingOnly: lineFoldingOnly);
  }

  /// Whether implementation supports dynamic registration for folding range
  /// providers. If this is set to `true` the client supports the new
  /// `FoldingRangeRegistrationOptions` return value for the corresponding
  /// server capability as well.
  final bool dynamicRegistration;

  /// If set, the client signals that it only supports folding complete lines.
  /// If set, client will ignore specified `startCharacter` and `endCharacter`
  /// properties in a FoldingRange.
  final bool lineFoldingOnly;

  /// The maximum number of folding ranges that the client prefers to receive
  /// per document. The value serves as a hint, servers are free to follow the
  /// limit.
  final num rangeLimit;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (rangeLimit != null) {
      __result['rangeLimit'] = rangeLimit;
    }
    if (lineFoldingOnly != null) {
      __result['lineFoldingOnly'] = lineFoldingOnly;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('rangeLimit');
      try {
        if (obj['rangeLimit'] != null && !(obj['rangeLimit'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('lineFoldingOnly');
      try {
        if (obj['lineFoldingOnly'] != null &&
            !(obj['lineFoldingOnly'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type FoldingRangeClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is FoldingRangeClientCapabilities &&
        other.runtimeType == FoldingRangeClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          rangeLimit == other.rangeLimit &&
          lineFoldingOnly == other.lineFoldingOnly &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, rangeLimit.hashCode);
    hash = JenkinsSmiHash.combine(hash, lineFoldingOnly.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Enum of known range kinds
class FoldingRangeKind {
  const FoldingRangeKind(this._value);
  const FoldingRangeKind.fromJson(this._value);

  final String _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is String;
  }

  /// Folding range for a comment
  static const Comment = FoldingRangeKind(r'comment');

  /// Folding range for a imports or includes
  static const Imports = FoldingRangeKind(r'imports');

  /// Folding range for a region (e.g. `#region`)
  static const Region = FoldingRangeKind(r'region');

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is FoldingRangeKind && o._value == _value;
}

class FoldingRangeOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      FoldingRangeOptions.canParse, FoldingRangeOptions.fromJson);

  FoldingRangeOptions({this.workDoneProgress});
  static FoldingRangeOptions fromJson(Map<String, dynamic> json) {
    if (FoldingRangeRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return FoldingRangeRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return FoldingRangeOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type FoldingRangeOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is FoldingRangeOptions &&
        other.runtimeType == FoldingRangeOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class FoldingRangeParams
    implements WorkDoneProgressParams, PartialResultParams, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(FoldingRangeParams.canParse, FoldingRangeParams.fromJson);

  FoldingRangeParams(
      {@required this.textDocument,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
  }
  static FoldingRangeParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return FoldingRangeParams(
        textDocument: textDocument,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type FoldingRangeParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is FoldingRangeParams &&
        other.runtimeType == FoldingRangeParams) {
      return textDocument == other.textDocument &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class FoldingRangeRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        FoldingRangeOptions,
        StaticRegistrationOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      FoldingRangeRegistrationOptions.canParse,
      FoldingRangeRegistrationOptions.fromJson);

  FoldingRangeRegistrationOptions(
      {this.documentSelector, this.workDoneProgress, this.id});
  static FoldingRangeRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    final id = json['id'];
    return FoldingRangeRegistrationOptions(
        documentSelector: documentSelector,
        workDoneProgress: workDoneProgress,
        id: id);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String id;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    if (id != null) {
      __result['id'] = id;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('id');
      try {
        if (obj['id'] != null && !(obj['id'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type FoldingRangeRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is FoldingRangeRegistrationOptions &&
        other.runtimeType == FoldingRangeRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          id == other.id &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Value-object describing what options formatting should use.
class FormattingOptions implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(FormattingOptions.canParse, FormattingOptions.fromJson);

  FormattingOptions(
      {@required this.tabSize,
      @required this.insertSpaces,
      this.trimTrailingWhitespace,
      this.insertFinalNewline,
      this.trimFinalNewlines}) {
    if (tabSize == null) {
      throw 'tabSize is required but was not provided';
    }
    if (insertSpaces == null) {
      throw 'insertSpaces is required but was not provided';
    }
  }
  static FormattingOptions fromJson(Map<String, dynamic> json) {
    final tabSize = json['tabSize'];
    final insertSpaces = json['insertSpaces'];
    final trimTrailingWhitespace = json['trimTrailingWhitespace'];
    final insertFinalNewline = json['insertFinalNewline'];
    final trimFinalNewlines = json['trimFinalNewlines'];
    return FormattingOptions(
        tabSize: tabSize,
        insertSpaces: insertSpaces,
        trimTrailingWhitespace: trimTrailingWhitespace,
        insertFinalNewline: insertFinalNewline,
        trimFinalNewlines: trimFinalNewlines);
  }

  /// Insert a newline character at the end of the file if one does not exist.
  ///  @since 3.15.0
  final bool insertFinalNewline;

  /// Prefer spaces over tabs.
  final bool insertSpaces;

  /// Size of a tab in spaces.
  final num tabSize;

  /// Trim all newlines after the final newline at the end of the file.
  ///  @since 3.15.0
  final bool trimFinalNewlines;

  /// Trim trailing whitespace on a line.
  ///  @since 3.15.0
  final bool trimTrailingWhitespace;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['tabSize'] =
        tabSize ?? (throw 'tabSize is required but was not set');
    __result['insertSpaces'] =
        insertSpaces ?? (throw 'insertSpaces is required but was not set');
    if (trimTrailingWhitespace != null) {
      __result['trimTrailingWhitespace'] = trimTrailingWhitespace;
    }
    if (insertFinalNewline != null) {
      __result['insertFinalNewline'] = insertFinalNewline;
    }
    if (trimFinalNewlines != null) {
      __result['trimFinalNewlines'] = trimFinalNewlines;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('tabSize');
      try {
        if (!obj.containsKey('tabSize')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['tabSize'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['tabSize'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('insertSpaces');
      try {
        if (!obj.containsKey('insertSpaces')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['insertSpaces'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['insertSpaces'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('trimTrailingWhitespace');
      try {
        if (obj['trimTrailingWhitespace'] != null &&
            !(obj['trimTrailingWhitespace'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('insertFinalNewline');
      try {
        if (obj['insertFinalNewline'] != null &&
            !(obj['insertFinalNewline'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('trimFinalNewlines');
      try {
        if (obj['trimFinalNewlines'] != null &&
            !(obj['trimFinalNewlines'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type FormattingOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is FormattingOptions && other.runtimeType == FormattingOptions) {
      return tabSize == other.tabSize &&
          insertSpaces == other.insertSpaces &&
          trimTrailingWhitespace == other.trimTrailingWhitespace &&
          insertFinalNewline == other.insertFinalNewline &&
          trimFinalNewlines == other.trimFinalNewlines &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, tabSize.hashCode);
    hash = JenkinsSmiHash.combine(hash, insertSpaces.hashCode);
    hash = JenkinsSmiHash.combine(hash, trimTrailingWhitespace.hashCode);
    hash = JenkinsSmiHash.combine(hash, insertFinalNewline.hashCode);
    hash = JenkinsSmiHash.combine(hash, trimFinalNewlines.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// The result of a hover request.
class Hover implements ToJsonable {
  static const jsonHandler = LspJsonHandler(Hover.canParse, Hover.fromJson);

  Hover({@required this.contents, this.range}) {
    if (contents == null) {
      throw 'contents is required but was not provided';
    }
  }
  static Hover fromJson(Map<String, dynamic> json) {
    final contents = json['contents'] is String
        ? Either2<String, MarkupContent>.t1(json['contents'])
        : (MarkupContent.canParse(json['contents'], nullLspJsonReporter)
            ? Either2<String, MarkupContent>.t2(json['contents'] != null
                ? MarkupContent.fromJson(json['contents'])
                : null)
            : (throw '''${json['contents']} was not one of (String, MarkupContent)'''));
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    return Hover(contents: contents, range: range);
  }

  /// The hover's content
  final Either2<String, MarkupContent> contents;

  /// An optional range is a range inside a text document that is used to
  /// visualize a hover, e.g. by changing the background color.
  final Range range;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['contents'] =
        contents ?? (throw 'contents is required but was not set');
    if (range != null) {
      __result['range'] = range;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('contents');
      try {
        if (!obj.containsKey('contents')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['contents'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['contents'] is String ||
            MarkupContent.canParse(obj['contents'], reporter)))) {
          reporter
              .reportError('must be of type Either2<String, MarkupContent>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('range');
      try {
        if (obj['range'] != null && !(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type Hover');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Hover && other.runtimeType == Hover) {
      return contents == other.contents && range == other.range && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, contents.hashCode);
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class HoverClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      HoverClientCapabilities.canParse, HoverClientCapabilities.fromJson);

  HoverClientCapabilities({this.dynamicRegistration, this.contentFormat});
  static HoverClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final contentFormat = json['contentFormat']
        ?.map((item) => item != null ? MarkupKind.fromJson(item) : null)
        ?.cast<MarkupKind>()
        ?.toList();
    return HoverClientCapabilities(
        dynamicRegistration: dynamicRegistration, contentFormat: contentFormat);
  }

  /// Client supports the follow content formats for the content property. The
  /// order describes the preferred format of the client.
  final List<MarkupKind> contentFormat;

  /// Whether hover supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (contentFormat != null) {
      __result['contentFormat'] = contentFormat;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('contentFormat');
      try {
        if (obj['contentFormat'] != null &&
            !((obj['contentFormat'] is List &&
                (obj['contentFormat']
                    .every((item) => MarkupKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<MarkupKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type HoverClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is HoverClientCapabilities &&
        other.runtimeType == HoverClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          listEqual(contentFormat, other.contentFormat,
              (MarkupKind a, MarkupKind b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(contentFormat));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class HoverOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(HoverOptions.canParse, HoverOptions.fromJson);

  HoverOptions({this.workDoneProgress});
  static HoverOptions fromJson(Map<String, dynamic> json) {
    if (HoverRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return HoverRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return HoverOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type HoverOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is HoverOptions && other.runtimeType == HoverOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class HoverParams
    implements TextDocumentPositionParams, WorkDoneProgressParams, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(HoverParams.canParse, HoverParams.fromJson);

  HoverParams(
      {@required this.textDocument,
      @required this.position,
      this.workDoneToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static HoverParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    return HoverParams(
        textDocument: textDocument,
        position: position,
        workDoneToken: workDoneToken);
  }

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type HoverParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is HoverParams && other.runtimeType == HoverParams) {
      return textDocument == other.textDocument &&
          position == other.position &&
          workDoneToken == other.workDoneToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class HoverRegistrationOptions
    implements TextDocumentRegistrationOptions, HoverOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      HoverRegistrationOptions.canParse, HoverRegistrationOptions.fromJson);

  HoverRegistrationOptions({this.documentSelector, this.workDoneProgress});
  static HoverRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return HoverRegistrationOptions(
        documentSelector: documentSelector, workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type HoverRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is HoverRegistrationOptions &&
        other.runtimeType == HoverRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ImplementationClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ImplementationClientCapabilities.canParse,
      ImplementationClientCapabilities.fromJson);

  ImplementationClientCapabilities(
      {this.dynamicRegistration, this.linkSupport});
  static ImplementationClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final linkSupport = json['linkSupport'];
    return ImplementationClientCapabilities(
        dynamicRegistration: dynamicRegistration, linkSupport: linkSupport);
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `ImplementationRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  ///  @since 3.14.0
  final bool linkSupport;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (linkSupport != null) {
      __result['linkSupport'] = linkSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('linkSupport');
      try {
        if (obj['linkSupport'] != null && !(obj['linkSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ImplementationClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ImplementationClientCapabilities &&
        other.runtimeType == ImplementationClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          linkSupport == other.linkSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, linkSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ImplementationOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ImplementationOptions.canParse, ImplementationOptions.fromJson);

  ImplementationOptions({this.workDoneProgress});
  static ImplementationOptions fromJson(Map<String, dynamic> json) {
    if (ImplementationRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return ImplementationRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return ImplementationOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ImplementationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ImplementationOptions &&
        other.runtimeType == ImplementationOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ImplementationParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ImplementationParams.canParse, ImplementationParams.fromJson);

  ImplementationParams(
      {@required this.textDocument,
      @required this.position,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static ImplementationParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return ImplementationParams(
        textDocument: textDocument,
        position: position,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ImplementationParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ImplementationParams &&
        other.runtimeType == ImplementationParams) {
      return textDocument == other.textDocument &&
          position == other.position &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ImplementationRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        ImplementationOptions,
        StaticRegistrationOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ImplementationRegistrationOptions.canParse,
      ImplementationRegistrationOptions.fromJson);

  ImplementationRegistrationOptions(
      {this.documentSelector, this.workDoneProgress, this.id});
  static ImplementationRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    final id = json['id'];
    return ImplementationRegistrationOptions(
        documentSelector: documentSelector,
        workDoneProgress: workDoneProgress,
        id: id);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String id;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    if (id != null) {
      __result['id'] = id;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('id');
      try {
        if (obj['id'] != null && !(obj['id'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ImplementationRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ImplementationRegistrationOptions &&
        other.runtimeType == ImplementationRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          id == other.id &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class InitializeParams implements WorkDoneProgressParams, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(InitializeParams.canParse, InitializeParams.fromJson);

  InitializeParams(
      {this.processId,
      this.clientInfo,
      this.rootPath,
      this.rootUri,
      this.initializationOptions,
      @required this.capabilities,
      this.trace,
      this.workspaceFolders,
      this.workDoneToken}) {
    if (capabilities == null) {
      throw 'capabilities is required but was not provided';
    }
  }
  static InitializeParams fromJson(Map<String, dynamic> json) {
    final processId = json['processId'];
    final clientInfo = json['clientInfo'] != null
        ? InitializeParamsClientInfo.fromJson(json['clientInfo'])
        : null;
    final rootPath = json['rootPath'];
    final rootUri = json['rootUri'];
    final initializationOptions = json['initializationOptions'];
    final capabilities = json['capabilities'] != null
        ? ClientCapabilities.fromJson(json['capabilities'])
        : null;
    final trace = json['trace'];
    final workspaceFolders = json['workspaceFolders']
        ?.map((item) => item != null ? WorkspaceFolder.fromJson(item) : null)
        ?.cast<WorkspaceFolder>()
        ?.toList();
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    return InitializeParams(
        processId: processId,
        clientInfo: clientInfo,
        rootPath: rootPath,
        rootUri: rootUri,
        initializationOptions: initializationOptions,
        capabilities: capabilities,
        trace: trace,
        workspaceFolders: workspaceFolders,
        workDoneToken: workDoneToken);
  }

  /// The capabilities provided by the client (editor or tool)
  final ClientCapabilities capabilities;

  /// Information about the client
  ///  @since 3.15.0
  final InitializeParamsClientInfo clientInfo;

  /// User provided initialization options.
  final dynamic initializationOptions;

  /// The process Id of the parent process that started the server. Is null if
  /// the process has not been started by another process. If the parent process
  /// is not alive then the server should exit (see exit notification) its
  /// process.
  final num processId;

  /// The rootPath of the workspace. Is null if no folder is open.
  ///  @deprecated in favour of rootUri.
  @core.deprecated
  final String rootPath;

  /// The rootUri of the workspace. Is null if no folder is open. If both
  /// `rootPath` and `rootUri` are set `rootUri` wins.
  final String rootUri;

  /// The initial trace setting. If omitted trace is disabled ('off').
  final String trace;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  /// The workspace folders configured in the client when the server starts.
  /// This property is only available if the client supports workspace folders.
  /// It can be `null` if the client supports workspace folders but none are
  /// configured.
  ///  @since 3.6.0
  final List<WorkspaceFolder> workspaceFolders;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['processId'] = processId;
    if (clientInfo != null) {
      __result['clientInfo'] = clientInfo;
    }
    if (rootPath != null) {
      __result['rootPath'] = rootPath;
    }
    __result['rootUri'] = rootUri;
    if (initializationOptions != null) {
      __result['initializationOptions'] = initializationOptions;
    }
    __result['capabilities'] =
        capabilities ?? (throw 'capabilities is required but was not set');
    if (trace != null) {
      __result['trace'] = trace;
    }
    if (workspaceFolders != null) {
      __result['workspaceFolders'] = workspaceFolders;
    }
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('processId');
      try {
        if (!obj.containsKey('processId')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['processId'] != null && !(obj['processId'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('clientInfo');
      try {
        if (obj['clientInfo'] != null &&
            !(InitializeParamsClientInfo.canParse(
                obj['clientInfo'], reporter))) {
          reporter.reportError('must be of type InitializeParamsClientInfo');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('rootPath');
      try {
        if (obj['rootPath'] != null && !(obj['rootPath'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('rootUri');
      try {
        if (!obj.containsKey('rootUri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['rootUri'] != null && !(obj['rootUri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('initializationOptions');
      try {
        if (obj['initializationOptions'] != null && !(true)) {
          reporter.reportError('must be of type dynamic');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('capabilities');
      try {
        if (!obj.containsKey('capabilities')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['capabilities'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(ClientCapabilities.canParse(obj['capabilities'], reporter))) {
          reporter.reportError('must be of type ClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('trace');
      try {
        if (obj['trace'] != null && !(obj['trace'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workspaceFolders');
      try {
        if (obj['workspaceFolders'] != null &&
            !((obj['workspaceFolders'] is List &&
                (obj['workspaceFolders'].every(
                    (item) => WorkspaceFolder.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<WorkspaceFolder>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type InitializeParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is InitializeParams && other.runtimeType == InitializeParams) {
      return processId == other.processId &&
          clientInfo == other.clientInfo &&
          rootPath == other.rootPath &&
          rootUri == other.rootUri &&
          initializationOptions == other.initializationOptions &&
          capabilities == other.capabilities &&
          trace == other.trace &&
          listEqual(workspaceFolders, other.workspaceFolders,
              (WorkspaceFolder a, WorkspaceFolder b) => a == b) &&
          workDoneToken == other.workDoneToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, processId.hashCode);
    hash = JenkinsSmiHash.combine(hash, clientInfo.hashCode);
    hash = JenkinsSmiHash.combine(hash, rootPath.hashCode);
    hash = JenkinsSmiHash.combine(hash, rootUri.hashCode);
    hash = JenkinsSmiHash.combine(hash, initializationOptions.hashCode);
    hash = JenkinsSmiHash.combine(hash, capabilities.hashCode);
    hash = JenkinsSmiHash.combine(hash, trace.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(workspaceFolders));
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class InitializeParamsClientInfo implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      InitializeParamsClientInfo.canParse, InitializeParamsClientInfo.fromJson);

  InitializeParamsClientInfo({@required this.name, this.version}) {
    if (name == null) {
      throw 'name is required but was not provided';
    }
  }
  static InitializeParamsClientInfo fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final version = json['version'];
    return InitializeParamsClientInfo(name: name, version: version);
  }

  /// The name of the client as defined by the client.
  final String name;

  /// The client's version as defined by the client.
  final String version;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['name'] = name ?? (throw 'name is required but was not set');
    if (version != null) {
      __result['version'] = version;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('name');
      try {
        if (!obj.containsKey('name')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['name'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['name'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('version');
      try {
        if (obj['version'] != null && !(obj['version'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type InitializeParamsClientInfo');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is InitializeParamsClientInfo &&
        other.runtimeType == InitializeParamsClientInfo) {
      return name == other.name && version == other.version && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, name.hashCode);
    hash = JenkinsSmiHash.combine(hash, version.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class InitializeResult implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(InitializeResult.canParse, InitializeResult.fromJson);

  InitializeResult({@required this.capabilities, this.serverInfo}) {
    if (capabilities == null) {
      throw 'capabilities is required but was not provided';
    }
  }
  static InitializeResult fromJson(Map<String, dynamic> json) {
    final capabilities = json['capabilities'] != null
        ? ServerCapabilities.fromJson(json['capabilities'])
        : null;
    final serverInfo = json['serverInfo'] != null
        ? InitializeResultServerInfo.fromJson(json['serverInfo'])
        : null;
    return InitializeResult(capabilities: capabilities, serverInfo: serverInfo);
  }

  /// The capabilities the language server provides.
  final ServerCapabilities capabilities;

  /// Information about the server.
  ///  @since 3.15.0
  final InitializeResultServerInfo serverInfo;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['capabilities'] =
        capabilities ?? (throw 'capabilities is required but was not set');
    if (serverInfo != null) {
      __result['serverInfo'] = serverInfo;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('capabilities');
      try {
        if (!obj.containsKey('capabilities')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['capabilities'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(ServerCapabilities.canParse(obj['capabilities'], reporter))) {
          reporter.reportError('must be of type ServerCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('serverInfo');
      try {
        if (obj['serverInfo'] != null &&
            !(InitializeResultServerInfo.canParse(
                obj['serverInfo'], reporter))) {
          reporter.reportError('must be of type InitializeResultServerInfo');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type InitializeResult');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is InitializeResult && other.runtimeType == InitializeResult) {
      return capabilities == other.capabilities &&
          serverInfo == other.serverInfo &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, capabilities.hashCode);
    hash = JenkinsSmiHash.combine(hash, serverInfo.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class InitializeResultServerInfo implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      InitializeResultServerInfo.canParse, InitializeResultServerInfo.fromJson);

  InitializeResultServerInfo({@required this.name, this.version}) {
    if (name == null) {
      throw 'name is required but was not provided';
    }
  }
  static InitializeResultServerInfo fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final version = json['version'];
    return InitializeResultServerInfo(name: name, version: version);
  }

  /// The name of the server as defined by the server.
  final String name;

  /// The server's version as defined by the server.
  final String version;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['name'] = name ?? (throw 'name is required but was not set');
    if (version != null) {
      __result['version'] = version;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('name');
      try {
        if (!obj.containsKey('name')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['name'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['name'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('version');
      try {
        if (obj['version'] != null && !(obj['version'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type InitializeResultServerInfo');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is InitializeResultServerInfo &&
        other.runtimeType == InitializeResultServerInfo) {
      return name == other.name && version == other.version && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, name.hashCode);
    hash = JenkinsSmiHash.combine(hash, version.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class InitializedParams implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(InitializedParams.canParse, InitializedParams.fromJson);

  static InitializedParams fromJson(Map<String, dynamic> json) {
    return InitializedParams();
  }

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      return true;
    } else {
      reporter.reportError('must be of type InitializedParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is InitializedParams && other.runtimeType == InitializedParams) {
      return true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Defines whether the insert text in a completion item should be interpreted
/// as plain text or a snippet.
class InsertTextFormat {
  const InsertTextFormat._(this._value);
  const InsertTextFormat.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    switch (obj) {
      case 1:
      case 2:
        return true;
    }
    return false;
  }

  /// The primary text to be inserted is treated as a plain string.
  static const PlainText = InsertTextFormat._(1);

  /// The primary text to be inserted is treated as a snippet.
  ///
  /// A snippet can define tab stops and placeholders with `$1`, `$2` and
  /// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of the
  /// snippet. Placeholders with equal identifiers are linked, that is typing in
  /// one will update others too.
  static const Snippet = InsertTextFormat._(2);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is InsertTextFormat && o._value == _value;
}

class Location implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(Location.canParse, Location.fromJson);

  Location({@required this.uri, @required this.range}) {
    if (uri == null) {
      throw 'uri is required but was not provided';
    }
    if (range == null) {
      throw 'range is required but was not provided';
    }
  }
  static Location fromJson(Map<String, dynamic> json) {
    final uri = json['uri'];
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    return Location(uri: uri, range: range);
  }

  final Range range;
  final String uri;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['uri'] = uri ?? (throw 'uri is required but was not set');
    __result['range'] = range ?? (throw 'range is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('uri');
      try {
        if (!obj.containsKey('uri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['uri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['uri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type Location');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Location && other.runtimeType == Location) {
      return uri == other.uri && range == other.range && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, uri.hashCode);
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class LocationLink implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(LocationLink.canParse, LocationLink.fromJson);

  LocationLink(
      {this.originSelectionRange,
      @required this.targetUri,
      @required this.targetRange,
      @required this.targetSelectionRange}) {
    if (targetUri == null) {
      throw 'targetUri is required but was not provided';
    }
    if (targetRange == null) {
      throw 'targetRange is required but was not provided';
    }
    if (targetSelectionRange == null) {
      throw 'targetSelectionRange is required but was not provided';
    }
  }
  static LocationLink fromJson(Map<String, dynamic> json) {
    final originSelectionRange = json['originSelectionRange'] != null
        ? Range.fromJson(json['originSelectionRange'])
        : null;
    final targetUri = json['targetUri'];
    final targetRange = json['targetRange'] != null
        ? Range.fromJson(json['targetRange'])
        : null;
    final targetSelectionRange = json['targetSelectionRange'] != null
        ? Range.fromJson(json['targetSelectionRange'])
        : null;
    return LocationLink(
        originSelectionRange: originSelectionRange,
        targetUri: targetUri,
        targetRange: targetRange,
        targetSelectionRange: targetSelectionRange);
  }

  /// Span of the origin of this link.
  ///
  /// Used as the underlined span for mouse interaction. Defaults to the word
  /// range at the mouse position.
  final Range originSelectionRange;

  /// The full target range of this link. If the target for example is a symbol
  /// then target range is the range enclosing this symbol not including
  /// leading/trailing whitespace but everything else like comments. This
  /// information is typically used to highlight the range in the editor.
  final Range targetRange;

  /// The range that should be selected and revealed when this link is being
  /// followed, e.g the name of a function. Must be contained by the the
  /// `targetRange`. See also `DocumentSymbol#range`
  final Range targetSelectionRange;

  /// The target resource identifier of this link.
  final String targetUri;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (originSelectionRange != null) {
      __result['originSelectionRange'] = originSelectionRange;
    }
    __result['targetUri'] =
        targetUri ?? (throw 'targetUri is required but was not set');
    __result['targetRange'] =
        targetRange ?? (throw 'targetRange is required but was not set');
    __result['targetSelectionRange'] = targetSelectionRange ??
        (throw 'targetSelectionRange is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('originSelectionRange');
      try {
        if (obj['originSelectionRange'] != null &&
            !(Range.canParse(obj['originSelectionRange'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('targetUri');
      try {
        if (!obj.containsKey('targetUri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['targetUri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['targetUri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('targetRange');
      try {
        if (!obj.containsKey('targetRange')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['targetRange'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['targetRange'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('targetSelectionRange');
      try {
        if (!obj.containsKey('targetSelectionRange')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['targetSelectionRange'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['targetSelectionRange'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type LocationLink');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is LocationLink && other.runtimeType == LocationLink) {
      return originSelectionRange == other.originSelectionRange &&
          targetUri == other.targetUri &&
          targetRange == other.targetRange &&
          targetSelectionRange == other.targetSelectionRange &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, originSelectionRange.hashCode);
    hash = JenkinsSmiHash.combine(hash, targetUri.hashCode);
    hash = JenkinsSmiHash.combine(hash, targetRange.hashCode);
    hash = JenkinsSmiHash.combine(hash, targetSelectionRange.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class LogMessageParams implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(LogMessageParams.canParse, LogMessageParams.fromJson);

  LogMessageParams({@required this.type, @required this.message}) {
    if (type == null) {
      throw 'type is required but was not provided';
    }
    if (message == null) {
      throw 'message is required but was not provided';
    }
  }
  static LogMessageParams fromJson(Map<String, dynamic> json) {
    final type =
        json['type'] != null ? MessageType.fromJson(json['type']) : null;
    final message = json['message'];
    return LogMessageParams(type: type, message: message);
  }

  /// The actual message
  final String message;

  /// The message type.
  final MessageType type;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['type'] = type ?? (throw 'type is required but was not set');
    __result['message'] =
        message ?? (throw 'message is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('type');
      try {
        if (!obj.containsKey('type')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['type'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(MessageType.canParse(obj['type'], reporter))) {
          reporter.reportError('must be of type MessageType');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('message');
      try {
        if (!obj.containsKey('message')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['message'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['message'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type LogMessageParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is LogMessageParams && other.runtimeType == LogMessageParams) {
      return type == other.type && message == other.message && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, type.hashCode);
    hash = JenkinsSmiHash.combine(hash, message.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// A `MarkupContent` literal represents a string value which content is
/// interpreted base on its kind flag. Currently the protocol supports
/// `plaintext` and `markdown` as markup kinds.
///
/// If the kind is `markdown` then the value can contain fenced code blocks like
/// in GitHub issues. See
/// https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
///
/// Here is an example how such a string can be constructed using JavaScript /
/// TypeScript: ```typescript let markdown: MarkdownContent = {
///
/// kind: MarkupKind.Markdown,
/// 	value: [
/// 		'# Header',
/// 		'Some text',
/// 		'```typescript',
/// 		'someCode();',
/// 		'```'
/// 	].join('\n') }; ```
///
/// *Please Note* that clients might sanitize the return markdown. A client
/// could decide to remove HTML from the markdown to avoid script execution.
class MarkupContent implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(MarkupContent.canParse, MarkupContent.fromJson);

  MarkupContent({@required this.kind, @required this.value}) {
    if (kind == null) {
      throw 'kind is required but was not provided';
    }
    if (value == null) {
      throw 'value is required but was not provided';
    }
  }
  static MarkupContent fromJson(Map<String, dynamic> json) {
    final kind =
        json['kind'] != null ? MarkupKind.fromJson(json['kind']) : null;
    final value = json['value'];
    return MarkupContent(kind: kind, value: value);
  }

  /// The type of the Markup
  final MarkupKind kind;

  /// The content itself
  final String value;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['kind'] = kind ?? (throw 'kind is required but was not set');
    __result['value'] = value ?? (throw 'value is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('kind');
      try {
        if (!obj.containsKey('kind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['kind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(MarkupKind.canParse(obj['kind'], reporter))) {
          reporter.reportError('must be of type MarkupKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('value');
      try {
        if (!obj.containsKey('value')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['value'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['value'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type MarkupContent');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is MarkupContent && other.runtimeType == MarkupContent) {
      return kind == other.kind && value == other.value && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, value.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Describes the content type that a client supports in various result literals
/// like `Hover`, `ParameterInfo` or `CompletionItem`.
///
/// Please note that `MarkupKinds` must not start with a `$`. This kinds are
/// reserved for internal usage.
class MarkupKind {
  const MarkupKind._(this._value);
  const MarkupKind.fromJson(this._value);

  final String _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    switch (obj) {
      case r'plaintext':
      case r'markdown':
        return true;
    }
    return false;
  }

  /// Plain text is supported as a content format
  static const PlainText = MarkupKind._(r'plaintext');

  /// Markdown is supported as a content format
  static const Markdown = MarkupKind._(r'markdown');

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is MarkupKind && o._value == _value;
}

class Message implements ToJsonable {
  static const jsonHandler = LspJsonHandler(Message.canParse, Message.fromJson);

  Message({@required this.jsonrpc}) {
    if (jsonrpc == null) {
      throw 'jsonrpc is required but was not provided';
    }
  }
  static Message fromJson(Map<String, dynamic> json) {
    if (RequestMessage.canParse(json, nullLspJsonReporter)) {
      return RequestMessage.fromJson(json);
    }
    if (ResponseMessage.canParse(json, nullLspJsonReporter)) {
      return ResponseMessage.fromJson(json);
    }
    if (NotificationMessage.canParse(json, nullLspJsonReporter)) {
      return NotificationMessage.fromJson(json);
    }
    final jsonrpc = json['jsonrpc'];
    return Message(jsonrpc: jsonrpc);
  }

  final String jsonrpc;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['jsonrpc'] =
        jsonrpc ?? (throw 'jsonrpc is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('jsonrpc');
      try {
        if (!obj.containsKey('jsonrpc')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['jsonrpc'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['jsonrpc'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type Message');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Message && other.runtimeType == Message) {
      return jsonrpc == other.jsonrpc && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, jsonrpc.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class MessageActionItem implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(MessageActionItem.canParse, MessageActionItem.fromJson);

  MessageActionItem({@required this.title}) {
    if (title == null) {
      throw 'title is required but was not provided';
    }
  }
  static MessageActionItem fromJson(Map<String, dynamic> json) {
    final title = json['title'];
    return MessageActionItem(title: title);
  }

  /// A short title like 'Retry', 'Open Log' etc.
  final String title;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['title'] = title ?? (throw 'title is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('title');
      try {
        if (!obj.containsKey('title')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['title'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['title'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type MessageActionItem');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is MessageActionItem && other.runtimeType == MessageActionItem) {
      return title == other.title && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, title.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class MessageType {
  const MessageType(this._value);
  const MessageType.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// An error message.
  static const Error = MessageType(1);

  /// A warning message.
  static const Warning = MessageType(2);

  /// An information message.
  static const Info = MessageType(3);

  /// A log message.
  static const Log = MessageType(4);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is MessageType && o._value == _value;
}

/// Valid LSP methods known at the time of code generation from the spec.
class Method {
  const Method(this._value);
  const Method.fromJson(this._value);

  final String _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is String;
  }

  /// Constant for the '$/cancelRequest' method.
  static const cancelRequest = Method(r'$/cancelRequest');

  /// Constant for the '$/progress' method.
  static const progress = Method(r'$/progress');

  /// Constant for the 'initialize' method.
  static const initialize = Method(r'initialize');

  /// Constant for the 'initialized' method.
  static const initialized = Method(r'initialized');

  /// Constant for the 'shutdown' method.
  static const shutdown = Method(r'shutdown');

  /// Constant for the 'exit' method.
  static const exit = Method(r'exit');

  /// Constant for the 'window/showMessage' method.
  static const window_showMessage = Method(r'window/showMessage');

  /// Constant for the 'window/showMessageRequest' method.
  static const window_showMessageRequest = Method(r'window/showMessageRequest');

  /// Constant for the 'window/logMessage' method.
  static const window_logMessage = Method(r'window/logMessage');

  /// Constant for the 'window/workDoneProgress/create' method.
  static const window_workDoneProgress_create =
      Method(r'window/workDoneProgress/create');

  /// Constant for the 'window/workDoneProgress/cancel' method.
  static const window_workDoneProgress_cancel =
      Method(r'window/workDoneProgress/cancel');

  /// Constant for the 'telemetry/event' method.
  static const telemetry_event = Method(r'telemetry/event');

  /// Constant for the 'client/registerCapability' method.
  static const client_registerCapability = Method(r'client/registerCapability');

  /// Constant for the 'client/unregisterCapability' method.
  static const client_unregisterCapability =
      Method(r'client/unregisterCapability');

  /// Constant for the 'workspace/workspaceFolders' method.
  static const workspace_workspaceFolders =
      Method(r'workspace/workspaceFolders');

  /// Constant for the 'workspace/didChangeWorkspaceFolders' method.
  static const workspace_didChangeWorkspaceFolders =
      Method(r'workspace/didChangeWorkspaceFolders');

  /// Constant for the 'workspace/didChangeConfiguration' method.
  static const workspace_didChangeConfiguration =
      Method(r'workspace/didChangeConfiguration');

  /// Constant for the 'workspace/configuration' method.
  static const workspace_configuration = Method(r'workspace/configuration');

  /// Constant for the 'workspace/didChangeWatchedFiles' method.
  static const workspace_didChangeWatchedFiles =
      Method(r'workspace/didChangeWatchedFiles');

  /// Constant for the 'workspace/symbol' method.
  static const workspace_symbol = Method(r'workspace/symbol');

  /// Constant for the 'workspace/executeCommand' method.
  static const workspace_executeCommand = Method(r'workspace/executeCommand');

  /// Constant for the 'workspace/applyEdit' method.
  static const workspace_applyEdit = Method(r'workspace/applyEdit');

  /// Constant for the 'textDocument/didOpen' method.
  static const textDocument_didOpen = Method(r'textDocument/didOpen');

  /// Constant for the 'textDocument/didChange' method.
  static const textDocument_didChange = Method(r'textDocument/didChange');

  /// Constant for the 'textDocument/willSave' method.
  static const textDocument_willSave = Method(r'textDocument/willSave');

  /// Constant for the 'textDocument/willSaveWaitUntil' method.
  static const textDocument_willSaveWaitUntil =
      Method(r'textDocument/willSaveWaitUntil');

  /// Constant for the 'textDocument/didSave' method.
  static const textDocument_didSave = Method(r'textDocument/didSave');

  /// Constant for the 'textDocument/didClose' method.
  static const textDocument_didClose = Method(r'textDocument/didClose');

  /// Constant for the 'textDocument/publishDiagnostics' method.
  static const textDocument_publishDiagnostics =
      Method(r'textDocument/publishDiagnostics');

  /// Constant for the 'textDocument/completion' method.
  static const textDocument_completion = Method(r'textDocument/completion');

  /// Constant for the 'completionItem/resolve' method.
  static const completionItem_resolve = Method(r'completionItem/resolve');

  /// Constant for the 'textDocument/hover' method.
  static const textDocument_hover = Method(r'textDocument/hover');

  /// Constant for the 'textDocument/signatureHelp' method.
  static const textDocument_signatureHelp =
      Method(r'textDocument/signatureHelp');

  /// Constant for the 'textDocument/declaration' method.
  static const textDocument_declaration = Method(r'textDocument/declaration');

  /// Constant for the 'textDocument/definition' method.
  static const textDocument_definition = Method(r'textDocument/definition');

  /// Constant for the 'textDocument/typeDefinition' method.
  static const textDocument_typeDefinition =
      Method(r'textDocument/typeDefinition');

  /// Constant for the 'textDocument/implementation' method.
  static const textDocument_implementation =
      Method(r'textDocument/implementation');

  /// Constant for the 'textDocument/references' method.
  static const textDocument_references = Method(r'textDocument/references');

  /// Constant for the 'textDocument/documentHighlight' method.
  static const textDocument_documentHighlight =
      Method(r'textDocument/documentHighlight');

  /// Constant for the 'textDocument/documentSymbol' method.
  static const textDocument_documentSymbol =
      Method(r'textDocument/documentSymbol');

  /// Constant for the 'textDocument/codeAction' method.
  static const textDocument_codeAction = Method(r'textDocument/codeAction');

  /// Constant for the 'textDocument/codeLens' method.
  static const textDocument_codeLens = Method(r'textDocument/codeLens');

  /// Constant for the 'codeLens/resolve' method.
  static const codeLens_resolve = Method(r'codeLens/resolve');

  /// Constant for the 'textDocument/documentLink' method.
  static const textDocument_documentLink = Method(r'textDocument/documentLink');

  /// Constant for the 'documentLink/resolve' method.
  static const documentLink_resolve = Method(r'documentLink/resolve');

  /// Constant for the 'textDocument/documentColor' method.
  static const textDocument_documentColor =
      Method(r'textDocument/documentColor');

  /// Constant for the 'textDocument/colorPresentation' method.
  static const textDocument_colorPresentation =
      Method(r'textDocument/colorPresentation');

  /// Constant for the 'textDocument/formatting' method.
  static const textDocument_formatting = Method(r'textDocument/formatting');

  /// Constant for the 'textDocument/rangeFormatting' method.
  static const textDocument_rangeFormatting =
      Method(r'textDocument/rangeFormatting');

  /// Constant for the 'textDocument/onTypeFormatting' method.
  static const textDocument_onTypeFormatting =
      Method(r'textDocument/onTypeFormatting');

  /// Constant for the 'textDocument/rename' method.
  static const textDocument_rename = Method(r'textDocument/rename');

  /// Constant for the 'textDocument/prepareRename' method.
  static const textDocument_prepareRename =
      Method(r'textDocument/prepareRename');

  /// Constant for the 'textDocument/foldingRange' method.
  static const textDocument_foldingRange = Method(r'textDocument/foldingRange');

  /// Constant for the 'textDocument/selectionRange' method.
  static const textDocument_selectionRange =
      Method(r'textDocument/selectionRange');

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is Method && o._value == _value;
}

class NotificationMessage implements Message, IncomingMessage, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      NotificationMessage.canParse, NotificationMessage.fromJson);

  NotificationMessage(
      {@required this.method, this.params, @required this.jsonrpc}) {
    if (method == null) {
      throw 'method is required but was not provided';
    }
    if (jsonrpc == null) {
      throw 'jsonrpc is required but was not provided';
    }
  }
  static NotificationMessage fromJson(Map<String, dynamic> json) {
    final method =
        json['method'] != null ? Method.fromJson(json['method']) : null;
    final params = json['params'];
    final jsonrpc = json['jsonrpc'];
    return NotificationMessage(
        method: method, params: params, jsonrpc: jsonrpc);
  }

  final String jsonrpc;

  /// The method to be invoked.
  final Method method;

  /// The notification's params.
  final dynamic params;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['method'] = method ?? (throw 'method is required but was not set');
    if (params != null) {
      __result['params'] = params;
    }
    __result['jsonrpc'] =
        jsonrpc ?? (throw 'jsonrpc is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('method');
      try {
        if (!obj.containsKey('method')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['method'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Method.canParse(obj['method'], reporter))) {
          reporter.reportError('must be of type Method');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('params');
      try {
        if (obj['params'] != null && !(true)) {
          reporter.reportError('must be of type dynamic');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('jsonrpc');
      try {
        if (!obj.containsKey('jsonrpc')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['jsonrpc'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['jsonrpc'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type NotificationMessage');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is NotificationMessage &&
        other.runtimeType == NotificationMessage) {
      return method == other.method &&
          params == other.params &&
          jsonrpc == other.jsonrpc &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, method.hashCode);
    hash = JenkinsSmiHash.combine(hash, params.hashCode);
    hash = JenkinsSmiHash.combine(hash, jsonrpc.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Represents a parameter of a callable-signature. A parameter can have a label
/// and a doc-comment.
class ParameterInformation implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ParameterInformation.canParse, ParameterInformation.fromJson);

  ParameterInformation({@required this.label, this.documentation}) {
    if (label == null) {
      throw 'label is required but was not provided';
    }
  }
  static ParameterInformation fromJson(Map<String, dynamic> json) {
    final label = json['label'];
    final documentation = json['documentation'] is String
        ? Either2<String, MarkupContent>.t1(json['documentation'])
        : (MarkupContent.canParse(json['documentation'], nullLspJsonReporter)
            ? Either2<String, MarkupContent>.t2(json['documentation'] != null
                ? MarkupContent.fromJson(json['documentation'])
                : null)
            : (json['documentation'] == null
                ? null
                : (throw '''${json['documentation']} was not one of (String, MarkupContent)''')));
    return ParameterInformation(label: label, documentation: documentation);
  }

  /// The human-readable doc-comment of this parameter. Will be shown in the UI
  /// but can be omitted.
  final Either2<String, MarkupContent> documentation;

  /// The label of this parameter information.
  ///
  /// Either a string or an inclusive start and exclusive end offsets within its
  /// containing signature label. (see SignatureInformation.label). The offsets
  /// are based on a UTF-16 string representation as `Position` and `Range`
  /// does.
  ///
  /// *Note*: a label of type string should be a substring of its containing
  /// signature label. Its intended use case is to highlight the parameter label
  /// part in the `SignatureInformation.label`.
  final String label;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['label'] = label ?? (throw 'label is required but was not set');
    if (documentation != null) {
      __result['documentation'] = documentation;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('label');
      try {
        if (!obj.containsKey('label')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['label'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['label'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentation');
      try {
        if (obj['documentation'] != null &&
            !((obj['documentation'] is String ||
                MarkupContent.canParse(obj['documentation'], reporter)))) {
          reporter
              .reportError('must be of type Either2<String, MarkupContent>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ParameterInformation');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ParameterInformation &&
        other.runtimeType == ParameterInformation) {
      return label == other.label &&
          documentation == other.documentation &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, label.hashCode);
    hash = JenkinsSmiHash.combine(hash, documentation.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class PartialResultParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      PartialResultParams.canParse, PartialResultParams.fromJson);

  PartialResultParams({this.partialResultToken});
  static PartialResultParams fromJson(Map<String, dynamic> json) {
    if (WorkspaceSymbolParams.canParse(json, nullLspJsonReporter)) {
      return WorkspaceSymbolParams.fromJson(json);
    }
    if (CompletionParams.canParse(json, nullLspJsonReporter)) {
      return CompletionParams.fromJson(json);
    }
    if (DeclarationParams.canParse(json, nullLspJsonReporter)) {
      return DeclarationParams.fromJson(json);
    }
    if (DefinitionParams.canParse(json, nullLspJsonReporter)) {
      return DefinitionParams.fromJson(json);
    }
    if (TypeDefinitionParams.canParse(json, nullLspJsonReporter)) {
      return TypeDefinitionParams.fromJson(json);
    }
    if (ImplementationParams.canParse(json, nullLspJsonReporter)) {
      return ImplementationParams.fromJson(json);
    }
    if (ReferenceParams.canParse(json, nullLspJsonReporter)) {
      return ReferenceParams.fromJson(json);
    }
    if (DocumentHighlightParams.canParse(json, nullLspJsonReporter)) {
      return DocumentHighlightParams.fromJson(json);
    }
    if (DocumentSymbolParams.canParse(json, nullLspJsonReporter)) {
      return DocumentSymbolParams.fromJson(json);
    }
    if (CodeActionParams.canParse(json, nullLspJsonReporter)) {
      return CodeActionParams.fromJson(json);
    }
    if (CodeLensParams.canParse(json, nullLspJsonReporter)) {
      return CodeLensParams.fromJson(json);
    }
    if (DocumentLinkParams.canParse(json, nullLspJsonReporter)) {
      return DocumentLinkParams.fromJson(json);
    }
    if (DocumentColorParams.canParse(json, nullLspJsonReporter)) {
      return DocumentColorParams.fromJson(json);
    }
    if (ColorPresentationParams.canParse(json, nullLspJsonReporter)) {
      return ColorPresentationParams.fromJson(json);
    }
    if (FoldingRangeParams.canParse(json, nullLspJsonReporter)) {
      return FoldingRangeParams.fromJson(json);
    }
    if (SelectionRangeParams.canParse(json, nullLspJsonReporter)) {
      return SelectionRangeParams.fromJson(json);
    }
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return PartialResultParams(partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type PartialResultParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is PartialResultParams &&
        other.runtimeType == PartialResultParams) {
      return partialResultToken == other.partialResultToken && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class Position implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(Position.canParse, Position.fromJson);

  Position({@required this.line, @required this.character}) {
    if (line == null) {
      throw 'line is required but was not provided';
    }
    if (character == null) {
      throw 'character is required but was not provided';
    }
  }
  static Position fromJson(Map<String, dynamic> json) {
    final line = json['line'];
    final character = json['character'];
    return Position(line: line, character: character);
  }

  /// Character offset on a line in a document (zero-based). Assuming that the
  /// line is represented as a string, the `character` value represents the gap
  /// between the `character` and `character + 1`.
  ///
  /// If the character value is greater than the line length it defaults back to
  /// the line length.
  final num character;

  /// Line position in a document (zero-based).
  final num line;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['line'] = line ?? (throw 'line is required but was not set');
    __result['character'] =
        character ?? (throw 'character is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('line');
      try {
        if (!obj.containsKey('line')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['line'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['line'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('character');
      try {
        if (!obj.containsKey('character')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['character'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['character'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type Position');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Position && other.runtimeType == Position) {
      return line == other.line && character == other.character && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, line.hashCode);
    hash = JenkinsSmiHash.combine(hash, character.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class PrepareRenameParams implements TextDocumentPositionParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      PrepareRenameParams.canParse, PrepareRenameParams.fromJson);

  PrepareRenameParams({@required this.textDocument, @required this.position}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static PrepareRenameParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    return PrepareRenameParams(textDocument: textDocument, position: position);
  }

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type PrepareRenameParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is PrepareRenameParams &&
        other.runtimeType == PrepareRenameParams) {
      return textDocument == other.textDocument &&
          position == other.position &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ProgressParams<T> implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ProgressParams.canParse, ProgressParams.fromJson);

  ProgressParams({@required this.token, @required this.value}) {
    if (token == null) {
      throw 'token is required but was not provided';
    }
    if (value == null) {
      throw 'value is required but was not provided';
    }
  }
  static ProgressParams<T> fromJson<T>(Map<String, dynamic> json) {
    final token = json['token'] is num
        ? Either2<num, String>.t1(json['token'])
        : (json['token'] is String
            ? Either2<num, String>.t2(json['token'])
            : (throw '''${json['token']} was not one of (num, String)'''));
    final value = json['value'];
    return ProgressParams<T>(token: token, value: value);
  }

  /// The progress token provided by the client or server.
  final Either2<num, String> token;

  /// The progress data.
  final T value;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['token'] = token ?? (throw 'token is required but was not set');
    __result['value'] = value ?? (throw 'value is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('token');
      try {
        if (!obj.containsKey('token')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['token'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['token'] is num || obj['token'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('value');
      try {
        if (!obj.containsKey('value')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['value'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(true /* T.canParse(obj['value']) */)) {
          reporter.reportError('must be of type T');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ProgressParams<T>');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ProgressParams && other.runtimeType == ProgressParams) {
      return token == other.token && value == other.value && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, token.hashCode);
    hash = JenkinsSmiHash.combine(hash, value.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class PublishDiagnosticsClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      PublishDiagnosticsClientCapabilities.canParse,
      PublishDiagnosticsClientCapabilities.fromJson);

  PublishDiagnosticsClientCapabilities(
      {this.relatedInformation, this.tagSupport, this.versionSupport});
  static PublishDiagnosticsClientCapabilities fromJson(
      Map<String, dynamic> json) {
    final relatedInformation = json['relatedInformation'];
    final tagSupport = json['tagSupport'] != null
        ? PublishDiagnosticsClientCapabilitiesTagSupport.fromJson(
            json['tagSupport'])
        : null;
    final versionSupport = json['versionSupport'];
    return PublishDiagnosticsClientCapabilities(
        relatedInformation: relatedInformation,
        tagSupport: tagSupport,
        versionSupport: versionSupport);
  }

  /// Whether the clients accepts diagnostics with related information.
  final bool relatedInformation;

  /// Client supports the tag property to provide meta data about a diagnostic.
  /// Clients supporting tags have to handle unknown tags gracefully.
  ///  @since 3.15.0
  final PublishDiagnosticsClientCapabilitiesTagSupport tagSupport;

  /// Whether the client interprets the version property of the
  /// `textDocument/publishDiagnostics` notification's parameter.
  ///  @since 3.15.0
  final bool versionSupport;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (relatedInformation != null) {
      __result['relatedInformation'] = relatedInformation;
    }
    if (tagSupport != null) {
      __result['tagSupport'] = tagSupport;
    }
    if (versionSupport != null) {
      __result['versionSupport'] = versionSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('relatedInformation');
      try {
        if (obj['relatedInformation'] != null &&
            !(obj['relatedInformation'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('tagSupport');
      try {
        if (obj['tagSupport'] != null &&
            !(PublishDiagnosticsClientCapabilitiesTagSupport.canParse(
                obj['tagSupport'], reporter))) {
          reporter.reportError(
              'must be of type PublishDiagnosticsClientCapabilitiesTagSupport');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('versionSupport');
      try {
        if (obj['versionSupport'] != null && !(obj['versionSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter
          .reportError('must be of type PublishDiagnosticsClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is PublishDiagnosticsClientCapabilities &&
        other.runtimeType == PublishDiagnosticsClientCapabilities) {
      return relatedInformation == other.relatedInformation &&
          tagSupport == other.tagSupport &&
          versionSupport == other.versionSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, relatedInformation.hashCode);
    hash = JenkinsSmiHash.combine(hash, tagSupport.hashCode);
    hash = JenkinsSmiHash.combine(hash, versionSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class PublishDiagnosticsClientCapabilitiesTagSupport implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      PublishDiagnosticsClientCapabilitiesTagSupport.canParse,
      PublishDiagnosticsClientCapabilitiesTagSupport.fromJson);

  PublishDiagnosticsClientCapabilitiesTagSupport({@required this.valueSet}) {
    if (valueSet == null) {
      throw 'valueSet is required but was not provided';
    }
  }
  static PublishDiagnosticsClientCapabilitiesTagSupport fromJson(
      Map<String, dynamic> json) {
    final valueSet = json['valueSet']
        ?.map((item) => item != null ? DiagnosticTag.fromJson(item) : null)
        ?.cast<DiagnosticTag>()
        ?.toList();
    return PublishDiagnosticsClientCapabilitiesTagSupport(valueSet: valueSet);
  }

  /// The tags supported by the client.
  final List<DiagnosticTag> valueSet;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['valueSet'] =
        valueSet ?? (throw 'valueSet is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('valueSet');
      try {
        if (!obj.containsKey('valueSet')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['valueSet'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['valueSet'] is List &&
            (obj['valueSet']
                .every((item) => DiagnosticTag.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DiagnosticTag>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type PublishDiagnosticsClientCapabilitiesTagSupport');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is PublishDiagnosticsClientCapabilitiesTagSupport &&
        other.runtimeType == PublishDiagnosticsClientCapabilitiesTagSupport) {
      return listEqual(valueSet, other.valueSet,
              (DiagnosticTag a, DiagnosticTag b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(valueSet));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class PublishDiagnosticsParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      PublishDiagnosticsParams.canParse, PublishDiagnosticsParams.fromJson);

  PublishDiagnosticsParams(
      {@required this.uri, this.version, @required this.diagnostics}) {
    if (uri == null) {
      throw 'uri is required but was not provided';
    }
    if (diagnostics == null) {
      throw 'diagnostics is required but was not provided';
    }
  }
  static PublishDiagnosticsParams fromJson(Map<String, dynamic> json) {
    final uri = json['uri'];
    final version = json['version'];
    final diagnostics = json['diagnostics']
        ?.map((item) => item != null ? Diagnostic.fromJson(item) : null)
        ?.cast<Diagnostic>()
        ?.toList();
    return PublishDiagnosticsParams(
        uri: uri, version: version, diagnostics: diagnostics);
  }

  /// An array of diagnostic information items.
  final List<Diagnostic> diagnostics;

  /// The URI for which diagnostic information is reported.
  final String uri;

  /// Optional the version number of the document the diagnostics are published
  /// for.
  ///  @since 3.15.0
  final num version;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['uri'] = uri ?? (throw 'uri is required but was not set');
    if (version != null) {
      __result['version'] = version;
    }
    __result['diagnostics'] =
        diagnostics ?? (throw 'diagnostics is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('uri');
      try {
        if (!obj.containsKey('uri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['uri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['uri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('version');
      try {
        if (obj['version'] != null && !(obj['version'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('diagnostics');
      try {
        if (!obj.containsKey('diagnostics')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['diagnostics'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['diagnostics'] is List &&
            (obj['diagnostics']
                .every((item) => Diagnostic.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<Diagnostic>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type PublishDiagnosticsParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is PublishDiagnosticsParams &&
        other.runtimeType == PublishDiagnosticsParams) {
      return uri == other.uri &&
          version == other.version &&
          listEqual(diagnostics, other.diagnostics,
              (Diagnostic a, Diagnostic b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, uri.hashCode);
    hash = JenkinsSmiHash.combine(hash, version.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(diagnostics));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class Range implements ToJsonable {
  static const jsonHandler = LspJsonHandler(Range.canParse, Range.fromJson);

  Range({@required this.start, @required this.end}) {
    if (start == null) {
      throw 'start is required but was not provided';
    }
    if (end == null) {
      throw 'end is required but was not provided';
    }
  }
  static Range fromJson(Map<String, dynamic> json) {
    final start =
        json['start'] != null ? Position.fromJson(json['start']) : null;
    final end = json['end'] != null ? Position.fromJson(json['end']) : null;
    return Range(start: start, end: end);
  }

  /// The range's end position.
  final Position end;

  /// The range's start position.
  final Position start;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['start'] = start ?? (throw 'start is required but was not set');
    __result['end'] = end ?? (throw 'end is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('start');
      try {
        if (!obj.containsKey('start')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['start'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['start'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('end');
      try {
        if (!obj.containsKey('end')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['end'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['end'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type Range');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Range && other.runtimeType == Range) {
      return start == other.start && end == other.end && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, start.hashCode);
    hash = JenkinsSmiHash.combine(hash, end.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class RangeAndPlaceholder implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      RangeAndPlaceholder.canParse, RangeAndPlaceholder.fromJson);

  RangeAndPlaceholder({@required this.range, @required this.placeholder}) {
    if (range == null) {
      throw 'range is required but was not provided';
    }
    if (placeholder == null) {
      throw 'placeholder is required but was not provided';
    }
  }
  static RangeAndPlaceholder fromJson(Map<String, dynamic> json) {
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final placeholder = json['placeholder'];
    return RangeAndPlaceholder(range: range, placeholder: placeholder);
  }

  final String placeholder;
  final Range range;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['range'] = range ?? (throw 'range is required but was not set');
    __result['placeholder'] =
        placeholder ?? (throw 'placeholder is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('placeholder');
      try {
        if (!obj.containsKey('placeholder')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['placeholder'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['placeholder'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type RangeAndPlaceholder');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is RangeAndPlaceholder &&
        other.runtimeType == RangeAndPlaceholder) {
      return range == other.range && placeholder == other.placeholder && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, placeholder.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ReferenceClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ReferenceClientCapabilities.canParse,
      ReferenceClientCapabilities.fromJson);

  ReferenceClientCapabilities({this.dynamicRegistration});
  static ReferenceClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return ReferenceClientCapabilities(
        dynamicRegistration: dynamicRegistration);
  }

  /// Whether references supports dynamic registration.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ReferenceClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ReferenceClientCapabilities &&
        other.runtimeType == ReferenceClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ReferenceContext implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ReferenceContext.canParse, ReferenceContext.fromJson);

  ReferenceContext({@required this.includeDeclaration}) {
    if (includeDeclaration == null) {
      throw 'includeDeclaration is required but was not provided';
    }
  }
  static ReferenceContext fromJson(Map<String, dynamic> json) {
    final includeDeclaration = json['includeDeclaration'];
    return ReferenceContext(includeDeclaration: includeDeclaration);
  }

  /// Include the declaration of the current symbol.
  final bool includeDeclaration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['includeDeclaration'] = includeDeclaration ??
        (throw 'includeDeclaration is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('includeDeclaration');
      try {
        if (!obj.containsKey('includeDeclaration')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['includeDeclaration'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['includeDeclaration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ReferenceContext');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ReferenceContext && other.runtimeType == ReferenceContext) {
      return includeDeclaration == other.includeDeclaration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, includeDeclaration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ReferenceOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ReferenceOptions.canParse, ReferenceOptions.fromJson);

  ReferenceOptions({this.workDoneProgress});
  static ReferenceOptions fromJson(Map<String, dynamic> json) {
    if (ReferenceRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return ReferenceRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return ReferenceOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ReferenceOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ReferenceOptions && other.runtimeType == ReferenceOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ReferenceParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams,
        ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ReferenceParams.canParse, ReferenceParams.fromJson);

  ReferenceParams(
      {@required this.context,
      @required this.textDocument,
      @required this.position,
      this.workDoneToken,
      this.partialResultToken}) {
    if (context == null) {
      throw 'context is required but was not provided';
    }
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static ReferenceParams fromJson(Map<String, dynamic> json) {
    final context = json['context'] != null
        ? ReferenceContext.fromJson(json['context'])
        : null;
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return ReferenceParams(
        context: context,
        textDocument: textDocument,
        position: position,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  final ReferenceContext context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['context'] =
        context ?? (throw 'context is required but was not set');
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('context');
      try {
        if (!obj.containsKey('context')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['context'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(ReferenceContext.canParse(obj['context'], reporter))) {
          reporter.reportError('must be of type ReferenceContext');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ReferenceParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ReferenceParams && other.runtimeType == ReferenceParams) {
      return context == other.context &&
          textDocument == other.textDocument &&
          position == other.position &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, context.hashCode);
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ReferenceRegistrationOptions
    implements TextDocumentRegistrationOptions, ReferenceOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ReferenceRegistrationOptions.canParse,
      ReferenceRegistrationOptions.fromJson);

  ReferenceRegistrationOptions({this.documentSelector, this.workDoneProgress});
  static ReferenceRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return ReferenceRegistrationOptions(
        documentSelector: documentSelector, workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ReferenceRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ReferenceRegistrationOptions &&
        other.runtimeType == ReferenceRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// General parameters to register for a capability.
class Registration implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(Registration.canParse, Registration.fromJson);

  Registration(
      {@required this.id, @required this.method, this.registerOptions}) {
    if (id == null) {
      throw 'id is required but was not provided';
    }
    if (method == null) {
      throw 'method is required but was not provided';
    }
  }
  static Registration fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final method = json['method'];
    final registerOptions = json['registerOptions'];
    return Registration(
        id: id, method: method, registerOptions: registerOptions);
  }

  /// The id used to register the request. The id can be used to deregister the
  /// request again.
  final String id;

  /// The method / capability to register for.
  final String method;

  /// Options necessary for the registration.
  final dynamic registerOptions;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['id'] = id ?? (throw 'id is required but was not set');
    __result['method'] = method ?? (throw 'method is required but was not set');
    if (registerOptions != null) {
      __result['registerOptions'] = registerOptions;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('id');
      try {
        if (!obj.containsKey('id')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['id'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['id'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('method');
      try {
        if (!obj.containsKey('method')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['method'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['method'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('registerOptions');
      try {
        if (obj['registerOptions'] != null && !(true)) {
          reporter.reportError('must be of type dynamic');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type Registration');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Registration && other.runtimeType == Registration) {
      return id == other.id &&
          method == other.method &&
          registerOptions == other.registerOptions &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    hash = JenkinsSmiHash.combine(hash, method.hashCode);
    hash = JenkinsSmiHash.combine(hash, registerOptions.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class RegistrationParams implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(RegistrationParams.canParse, RegistrationParams.fromJson);

  RegistrationParams({@required this.registrations}) {
    if (registrations == null) {
      throw 'registrations is required but was not provided';
    }
  }
  static RegistrationParams fromJson(Map<String, dynamic> json) {
    final registrations = json['registrations']
        ?.map((item) => item != null ? Registration.fromJson(item) : null)
        ?.cast<Registration>()
        ?.toList();
    return RegistrationParams(registrations: registrations);
  }

  final List<Registration> registrations;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['registrations'] =
        registrations ?? (throw 'registrations is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('registrations');
      try {
        if (!obj.containsKey('registrations')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['registrations'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['registrations'] is List &&
            (obj['registrations']
                .every((item) => Registration.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<Registration>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type RegistrationParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is RegistrationParams &&
        other.runtimeType == RegistrationParams) {
      return listEqual(registrations, other.registrations,
              (Registration a, Registration b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(registrations));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class RenameClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      RenameClientCapabilities.canParse, RenameClientCapabilities.fromJson);

  RenameClientCapabilities({this.dynamicRegistration, this.prepareSupport});
  static RenameClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final prepareSupport = json['prepareSupport'];
    return RenameClientCapabilities(
        dynamicRegistration: dynamicRegistration,
        prepareSupport: prepareSupport);
  }

  /// Whether rename supports dynamic registration.
  final bool dynamicRegistration;

  /// Client supports testing for validity of rename operations before
  /// execution.
  ///  @since version 3.12.0
  final bool prepareSupport;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (prepareSupport != null) {
      __result['prepareSupport'] = prepareSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('prepareSupport');
      try {
        if (obj['prepareSupport'] != null && !(obj['prepareSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type RenameClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is RenameClientCapabilities &&
        other.runtimeType == RenameClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          prepareSupport == other.prepareSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, prepareSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Rename file operation
class RenameFile implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(RenameFile.canParse, RenameFile.fromJson);

  RenameFile(
      {@required this.kind,
      @required this.oldUri,
      @required this.newUri,
      this.options}) {
    if (kind == null) {
      throw 'kind is required but was not provided';
    }
    if (oldUri == null) {
      throw 'oldUri is required but was not provided';
    }
    if (newUri == null) {
      throw 'newUri is required but was not provided';
    }
  }
  static RenameFile fromJson(Map<String, dynamic> json) {
    final kind = json['kind'];
    final oldUri = json['oldUri'];
    final newUri = json['newUri'];
    final options = json['options'] != null
        ? RenameFileOptions.fromJson(json['options'])
        : null;
    return RenameFile(
        kind: kind, oldUri: oldUri, newUri: newUri, options: options);
  }

  /// A rename
  final String kind;

  /// The new location.
  final String newUri;

  /// The old (existing) location.
  final String oldUri;

  /// Rename options.
  final RenameFileOptions options;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['kind'] = kind ?? (throw 'kind is required but was not set');
    __result['oldUri'] = oldUri ?? (throw 'oldUri is required but was not set');
    __result['newUri'] = newUri ?? (throw 'newUri is required but was not set');
    if (options != null) {
      __result['options'] = options;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('kind');
      try {
        if (!obj.containsKey('kind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['kind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['kind'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('oldUri');
      try {
        if (!obj.containsKey('oldUri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['oldUri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['oldUri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('newUri');
      try {
        if (!obj.containsKey('newUri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['newUri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['newUri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('options');
      try {
        if (obj['options'] != null &&
            !(RenameFileOptions.canParse(obj['options'], reporter))) {
          reporter.reportError('must be of type RenameFileOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type RenameFile');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is RenameFile && other.runtimeType == RenameFile) {
      return kind == other.kind &&
          oldUri == other.oldUri &&
          newUri == other.newUri &&
          options == other.options &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, oldUri.hashCode);
    hash = JenkinsSmiHash.combine(hash, newUri.hashCode);
    hash = JenkinsSmiHash.combine(hash, options.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Rename file options
class RenameFileOptions implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(RenameFileOptions.canParse, RenameFileOptions.fromJson);

  RenameFileOptions({this.overwrite, this.ignoreIfExists});
  static RenameFileOptions fromJson(Map<String, dynamic> json) {
    final overwrite = json['overwrite'];
    final ignoreIfExists = json['ignoreIfExists'];
    return RenameFileOptions(
        overwrite: overwrite, ignoreIfExists: ignoreIfExists);
  }

  /// Ignores if target exists.
  final bool ignoreIfExists;

  /// Overwrite target if existing. Overwrite wins over `ignoreIfExists`
  final bool overwrite;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (overwrite != null) {
      __result['overwrite'] = overwrite;
    }
    if (ignoreIfExists != null) {
      __result['ignoreIfExists'] = ignoreIfExists;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('overwrite');
      try {
        if (obj['overwrite'] != null && !(obj['overwrite'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('ignoreIfExists');
      try {
        if (obj['ignoreIfExists'] != null && !(obj['ignoreIfExists'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type RenameFileOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is RenameFileOptions && other.runtimeType == RenameFileOptions) {
      return overwrite == other.overwrite &&
          ignoreIfExists == other.ignoreIfExists &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, overwrite.hashCode);
    hash = JenkinsSmiHash.combine(hash, ignoreIfExists.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class RenameOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(RenameOptions.canParse, RenameOptions.fromJson);

  RenameOptions({this.prepareProvider, this.workDoneProgress});
  static RenameOptions fromJson(Map<String, dynamic> json) {
    if (RenameRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return RenameRegistrationOptions.fromJson(json);
    }
    final prepareProvider = json['prepareProvider'];
    final workDoneProgress = json['workDoneProgress'];
    return RenameOptions(
        prepareProvider: prepareProvider, workDoneProgress: workDoneProgress);
  }

  /// Renames should be checked and tested before being executed.
  final bool prepareProvider;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (prepareProvider != null) {
      __result['prepareProvider'] = prepareProvider;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('prepareProvider');
      try {
        if (obj['prepareProvider'] != null &&
            !(obj['prepareProvider'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type RenameOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is RenameOptions && other.runtimeType == RenameOptions) {
      return prepareProvider == other.prepareProvider &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, prepareProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class RenameParams
    implements TextDocumentPositionParams, WorkDoneProgressParams, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(RenameParams.canParse, RenameParams.fromJson);

  RenameParams(
      {@required this.newName,
      @required this.textDocument,
      @required this.position,
      this.workDoneToken}) {
    if (newName == null) {
      throw 'newName is required but was not provided';
    }
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static RenameParams fromJson(Map<String, dynamic> json) {
    final newName = json['newName'];
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    return RenameParams(
        newName: newName,
        textDocument: textDocument,
        position: position,
        workDoneToken: workDoneToken);
  }

  /// The new name of the symbol. If the given name is not valid the request
  /// must return a [ResponseError] with an appropriate message set.
  final String newName;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['newName'] =
        newName ?? (throw 'newName is required but was not set');
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('newName');
      try {
        if (!obj.containsKey('newName')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['newName'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['newName'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type RenameParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is RenameParams && other.runtimeType == RenameParams) {
      return newName == other.newName &&
          textDocument == other.textDocument &&
          position == other.position &&
          workDoneToken == other.workDoneToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, newName.hashCode);
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class RenameRegistrationOptions
    implements TextDocumentRegistrationOptions, RenameOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      RenameRegistrationOptions.canParse, RenameRegistrationOptions.fromJson);

  RenameRegistrationOptions(
      {this.documentSelector, this.prepareProvider, this.workDoneProgress});
  static RenameRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final prepareProvider = json['prepareProvider'];
    final workDoneProgress = json['workDoneProgress'];
    return RenameRegistrationOptions(
        documentSelector: documentSelector,
        prepareProvider: prepareProvider,
        workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// Renames should be checked and tested before being executed.
  final bool prepareProvider;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (prepareProvider != null) {
      __result['prepareProvider'] = prepareProvider;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('prepareProvider');
      try {
        if (obj['prepareProvider'] != null &&
            !(obj['prepareProvider'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type RenameRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is RenameRegistrationOptions &&
        other.runtimeType == RenameRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          prepareProvider == other.prepareProvider &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, prepareProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class RequestMessage implements Message, IncomingMessage, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(RequestMessage.canParse, RequestMessage.fromJson);

  RequestMessage(
      {@required this.id,
      @required this.method,
      this.params,
      @required this.jsonrpc}) {
    if (id == null) {
      throw 'id is required but was not provided';
    }
    if (method == null) {
      throw 'method is required but was not provided';
    }
    if (jsonrpc == null) {
      throw 'jsonrpc is required but was not provided';
    }
  }
  static RequestMessage fromJson(Map<String, dynamic> json) {
    final id = json['id'] is num
        ? Either2<num, String>.t1(json['id'])
        : (json['id'] is String
            ? Either2<num, String>.t2(json['id'])
            : (throw '''${json['id']} was not one of (num, String)'''));
    final method =
        json['method'] != null ? Method.fromJson(json['method']) : null;
    final params = json['params'];
    final jsonrpc = json['jsonrpc'];
    return RequestMessage(
        id: id, method: method, params: params, jsonrpc: jsonrpc);
  }

  /// The request id.
  final Either2<num, String> id;
  final String jsonrpc;

  /// The method to be invoked.
  final Method method;

  /// The method's params.
  final dynamic params;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['id'] = id ?? (throw 'id is required but was not set');
    __result['method'] = method ?? (throw 'method is required but was not set');
    if (params != null) {
      __result['params'] = params;
    }
    __result['jsonrpc'] =
        jsonrpc ?? (throw 'jsonrpc is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('id');
      try {
        if (!obj.containsKey('id')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['id'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['id'] is num || obj['id'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('method');
      try {
        if (!obj.containsKey('method')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['method'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Method.canParse(obj['method'], reporter))) {
          reporter.reportError('must be of type Method');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('params');
      try {
        if (obj['params'] != null && !(true)) {
          reporter.reportError('must be of type dynamic');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('jsonrpc');
      try {
        if (!obj.containsKey('jsonrpc')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['jsonrpc'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['jsonrpc'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type RequestMessage');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is RequestMessage && other.runtimeType == RequestMessage) {
      return id == other.id &&
          method == other.method &&
          params == other.params &&
          jsonrpc == other.jsonrpc &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    hash = JenkinsSmiHash.combine(hash, method.hashCode);
    hash = JenkinsSmiHash.combine(hash, params.hashCode);
    hash = JenkinsSmiHash.combine(hash, jsonrpc.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ResourceOperationKind {
  const ResourceOperationKind._(this._value);
  const ResourceOperationKind.fromJson(this._value);

  final String _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    switch (obj) {
      case 'create':
      case 'rename':
      case 'delete':
        return true;
    }
    return false;
  }

  /// Supports creating new files and folders.
  static const Create = ResourceOperationKind._('create');

  /// Supports renaming existing files and folders.
  static const Rename = ResourceOperationKind._('rename');

  /// Supports deleting existing files and folders.
  static const Delete = ResourceOperationKind._('delete');

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) =>
      o is ResourceOperationKind && o._value == _value;
}

class ResponseError implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ResponseError.canParse, ResponseError.fromJson);

  ResponseError({@required this.code, @required this.message, this.data}) {
    if (code == null) {
      throw 'code is required but was not provided';
    }
    if (message == null) {
      throw 'message is required but was not provided';
    }
  }
  static ResponseError fromJson(Map<String, dynamic> json) {
    final code =
        json['code'] != null ? ErrorCodes.fromJson(json['code']) : null;
    final message = json['message'];
    final data = json['data'];
    return ResponseError(code: code, message: message, data: data);
  }

  /// A number indicating the error type that occurred.
  final ErrorCodes code;

  /// A string that contains additional information about the error. Can be
  /// omitted.
  final String data;

  /// A string providing a short description of the error.
  final String message;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['code'] = code ?? (throw 'code is required but was not set');
    __result['message'] =
        message ?? (throw 'message is required but was not set');
    if (data != null) {
      __result['data'] = data;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('code');
      try {
        if (!obj.containsKey('code')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['code'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(ErrorCodes.canParse(obj['code'], reporter))) {
          reporter.reportError('must be of type ErrorCodes');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('message');
      try {
        if (!obj.containsKey('message')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['message'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['message'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('data');
      try {
        if (obj['data'] != null && !(obj['data'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ResponseError');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ResponseError && other.runtimeType == ResponseError) {
      return code == other.code &&
          message == other.message &&
          data == other.data &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, code.hashCode);
    hash = JenkinsSmiHash.combine(hash, message.hashCode);
    hash = JenkinsSmiHash.combine(hash, data.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ResponseMessage implements Message, ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ResponseMessage.canParse, ResponseMessage.fromJson);

  ResponseMessage({this.id, this.result, this.error, @required this.jsonrpc}) {
    if (jsonrpc == null) {
      throw 'jsonrpc is required but was not provided';
    }
  }
  static ResponseMessage fromJson(Map<String, dynamic> json) {
    final id = json['id'] is num
        ? Either2<num, String>.t1(json['id'])
        : (json['id'] is String
            ? Either2<num, String>.t2(json['id'])
            : (json['id'] == null
                ? null
                : (throw '''${json['id']} was not one of (num, String)''')));
    final result = json['result'];
    final error =
        json['error'] != null ? ResponseError.fromJson(json['error']) : null;
    final jsonrpc = json['jsonrpc'];
    return ResponseMessage(
        id: id, result: result, error: error, jsonrpc: jsonrpc);
  }

  /// The error object in case a request fails.
  final ResponseError error;

  /// The request id.
  final Either2<num, String> id;
  final String jsonrpc;

  /// The result of a request. This member is REQUIRED on success. This member
  /// MUST NOT exist if there was an error invoking the method.
  final dynamic result;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['id'] = id;
    __result['jsonrpc'] =
        jsonrpc ?? (throw 'jsonrpc is required but was not set');
    if (error != null && result != null) {
      throw 'result and error cannot both be set';
    } else if (error != null) {
      __result['error'] = error;
    } else {
      __result['result'] = result;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('id');
      try {
        if (!obj.containsKey('id')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['id'] != null && !((obj['id'] is num || obj['id'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('result');
      try {
        if (obj['result'] != null && !(true)) {
          reporter.reportError('must be of type dynamic');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('error');
      try {
        if (obj['error'] != null &&
            !(ResponseError.canParse(obj['error'], reporter))) {
          reporter.reportError('must be of type ResponseError');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('jsonrpc');
      try {
        if (!obj.containsKey('jsonrpc')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['jsonrpc'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['jsonrpc'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ResponseMessage');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ResponseMessage && other.runtimeType == ResponseMessage) {
      return id == other.id &&
          result == other.result &&
          error == other.error &&
          jsonrpc == other.jsonrpc &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    hash = JenkinsSmiHash.combine(hash, result.hashCode);
    hash = JenkinsSmiHash.combine(hash, error.hashCode);
    hash = JenkinsSmiHash.combine(hash, jsonrpc.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SaveOptions implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(SaveOptions.canParse, SaveOptions.fromJson);

  SaveOptions({this.includeText});
  static SaveOptions fromJson(Map<String, dynamic> json) {
    final includeText = json['includeText'];
    return SaveOptions(includeText: includeText);
  }

  /// The client is supposed to include the content on save.
  final bool includeText;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (includeText != null) {
      __result['includeText'] = includeText;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('includeText');
      try {
        if (obj['includeText'] != null && !(obj['includeText'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SaveOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SaveOptions && other.runtimeType == SaveOptions) {
      return includeText == other.includeText && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, includeText.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SelectionRange implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(SelectionRange.canParse, SelectionRange.fromJson);

  SelectionRange({@required this.range, this.parent}) {
    if (range == null) {
      throw 'range is required but was not provided';
    }
  }
  static SelectionRange fromJson(Map<String, dynamic> json) {
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final parent =
        json['parent'] != null ? SelectionRange.fromJson(json['parent']) : null;
    return SelectionRange(range: range, parent: parent);
  }

  /// The parent selection range containing this range. Therefore `parent.range`
  /// must contain `this.range`.
  final SelectionRange parent;

  /// The range ([Range]) of this selection range.
  final Range range;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['range'] = range ?? (throw 'range is required but was not set');
    if (parent != null) {
      __result['parent'] = parent;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('parent');
      try {
        if (obj['parent'] != null &&
            !(SelectionRange.canParse(obj['parent'], reporter))) {
          reporter.reportError('must be of type SelectionRange');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SelectionRange');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SelectionRange && other.runtimeType == SelectionRange) {
      return range == other.range && parent == other.parent && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, parent.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SelectionRangeClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SelectionRangeClientCapabilities.canParse,
      SelectionRangeClientCapabilities.fromJson);

  SelectionRangeClientCapabilities({this.dynamicRegistration});
  static SelectionRangeClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    return SelectionRangeClientCapabilities(
        dynamicRegistration: dynamicRegistration);
  }

  /// Whether implementation supports dynamic registration for selection range
  /// providers. If this is set to `true` the client supports the new
  /// `SelectionRangeRegistrationOptions` return value for the corresponding
  /// server capability as well.
  final bool dynamicRegistration;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SelectionRangeClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SelectionRangeClientCapabilities &&
        other.runtimeType == SelectionRangeClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SelectionRangeOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SelectionRangeOptions.canParse, SelectionRangeOptions.fromJson);

  SelectionRangeOptions({this.workDoneProgress});
  static SelectionRangeOptions fromJson(Map<String, dynamic> json) {
    if (SelectionRangeRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return SelectionRangeRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return SelectionRangeOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SelectionRangeOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SelectionRangeOptions &&
        other.runtimeType == SelectionRangeOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SelectionRangeParams
    implements WorkDoneProgressParams, PartialResultParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SelectionRangeParams.canParse, SelectionRangeParams.fromJson);

  SelectionRangeParams(
      {@required this.textDocument,
      @required this.positions,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (positions == null) {
      throw 'positions is required but was not provided';
    }
  }
  static SelectionRangeParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final positions = json['positions']
        ?.map((item) => item != null ? Position.fromJson(item) : null)
        ?.cast<Position>()
        ?.toList();
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return SelectionRangeParams(
        textDocument: textDocument,
        positions: positions,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The positions inside the text document.
  final List<Position> positions;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['positions'] =
        positions ?? (throw 'positions is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('positions');
      try {
        if (!obj.containsKey('positions')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['positions'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['positions'] is List &&
            (obj['positions']
                .every((item) => Position.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<Position>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SelectionRangeParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SelectionRangeParams &&
        other.runtimeType == SelectionRangeParams) {
      return textDocument == other.textDocument &&
          listEqual(
              positions, other.positions, (Position a, Position b) => a == b) &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(positions));
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SelectionRangeRegistrationOptions
    implements
        SelectionRangeOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SelectionRangeRegistrationOptions.canParse,
      SelectionRangeRegistrationOptions.fromJson);

  SelectionRangeRegistrationOptions(
      {this.workDoneProgress, this.documentSelector, this.id});
  static SelectionRangeRegistrationOptions fromJson(Map<String, dynamic> json) {
    final workDoneProgress = json['workDoneProgress'];
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final id = json['id'];
    return SelectionRangeRegistrationOptions(
        workDoneProgress: workDoneProgress,
        documentSelector: documentSelector,
        id: id);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String id;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    __result['documentSelector'] = documentSelector;
    if (id != null) {
      __result['id'] = id;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('id');
      try {
        if (obj['id'] != null && !(obj['id'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SelectionRangeRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SelectionRangeRegistrationOptions &&
        other.runtimeType == SelectionRangeRegistrationOptions) {
      return workDoneProgress == other.workDoneProgress &&
          listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          id == other.id &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ServerCapabilities implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ServerCapabilities.canParse, ServerCapabilities.fromJson);

  ServerCapabilities(
      {this.textDocumentSync,
      this.completionProvider,
      this.hoverProvider,
      this.signatureHelpProvider,
      this.declarationProvider,
      this.definitionProvider,
      this.typeDefinitionProvider,
      this.implementationProvider,
      this.referencesProvider,
      this.documentHighlightProvider,
      this.documentSymbolProvider,
      this.codeActionProvider,
      this.codeLensProvider,
      this.documentLinkProvider,
      this.colorProvider,
      this.documentFormattingProvider,
      this.documentRangeFormattingProvider,
      this.documentOnTypeFormattingProvider,
      this.renameProvider,
      this.foldingRangeProvider,
      this.executeCommandProvider,
      this.selectionRangeProvider,
      this.workspaceSymbolProvider,
      this.workspace,
      this.experimental});
  static ServerCapabilities fromJson(Map<String, dynamic> json) {
    final textDocumentSync = TextDocumentSyncOptions.canParse(
            json['textDocumentSync'], nullLspJsonReporter)
        ? Either2<TextDocumentSyncOptions, num>.t1(
            json['textDocumentSync'] != null
                ? TextDocumentSyncOptions.fromJson(json['textDocumentSync'])
                : null)
        : (json['textDocumentSync'] is num
            ? Either2<TextDocumentSyncOptions, num>.t2(json['textDocumentSync'])
            : (json['textDocumentSync'] == null
                ? null
                : (throw '''${json['textDocumentSync']} was not one of (TextDocumentSyncOptions, num)''')));
    final completionProvider = json['completionProvider'] != null
        ? CompletionOptions.fromJson(json['completionProvider'])
        : null;
    final hoverProvider = json['hoverProvider'] is bool
        ? Either2<bool, HoverOptions>.t1(json['hoverProvider'])
        : (HoverOptions.canParse(json['hoverProvider'], nullLspJsonReporter)
            ? Either2<bool, HoverOptions>.t2(json['hoverProvider'] != null
                ? HoverOptions.fromJson(json['hoverProvider'])
                : null)
            : (json['hoverProvider'] == null
                ? null
                : (throw '''${json['hoverProvider']} was not one of (bool, HoverOptions)''')));
    final signatureHelpProvider = json['signatureHelpProvider'] != null
        ? SignatureHelpOptions.fromJson(json['signatureHelpProvider'])
        : null;
    final declarationProvider = json['declarationProvider'] is bool
        ? Either3<bool, DeclarationOptions, DeclarationRegistrationOptions>.t1(
            json['declarationProvider'])
        : (DeclarationOptions.canParse(
                json['declarationProvider'], nullLspJsonReporter)
            ? Either3<bool, DeclarationOptions, DeclarationRegistrationOptions>.t2(
                json['declarationProvider'] != null
                    ? DeclarationOptions.fromJson(json['declarationProvider'])
                    : null)
            : (DeclarationRegistrationOptions.canParse(
                    json['declarationProvider'], nullLspJsonReporter)
                ? Either3<bool, DeclarationOptions, DeclarationRegistrationOptions>.t3(
                    json['declarationProvider'] != null
                        ? DeclarationRegistrationOptions.fromJson(
                            json['declarationProvider'])
                        : null)
                : (json['declarationProvider'] == null
                    ? null
                    : (throw '''${json['declarationProvider']} was not one of (bool, DeclarationOptions, DeclarationRegistrationOptions)'''))));
    final definitionProvider = json['definitionProvider'] is bool
        ? Either2<bool, DefinitionOptions>.t1(json['definitionProvider'])
        : (DefinitionOptions.canParse(
                json['definitionProvider'], nullLspJsonReporter)
            ? Either2<bool, DefinitionOptions>.t2(
                json['definitionProvider'] != null
                    ? DefinitionOptions.fromJson(json['definitionProvider'])
                    : null)
            : (json['definitionProvider'] == null
                ? null
                : (throw '''${json['definitionProvider']} was not one of (bool, DefinitionOptions)''')));
    final typeDefinitionProvider = json['typeDefinitionProvider'] is bool
        ? Either3<bool, TypeDefinitionOptions, TypeDefinitionRegistrationOptions>.t1(
            json['typeDefinitionProvider'])
        : (TypeDefinitionOptions.canParse(
                json['typeDefinitionProvider'], nullLspJsonReporter)
            ? Either3<bool, TypeDefinitionOptions, TypeDefinitionRegistrationOptions>.t2(json['typeDefinitionProvider'] != null
                ? TypeDefinitionOptions.fromJson(json['typeDefinitionProvider'])
                : null)
            : (TypeDefinitionRegistrationOptions.canParse(
                    json['typeDefinitionProvider'], nullLspJsonReporter)
                ? Either3<bool, TypeDefinitionOptions, TypeDefinitionRegistrationOptions>.t3(
                    json['typeDefinitionProvider'] != null
                        ? TypeDefinitionRegistrationOptions.fromJson(
                            json['typeDefinitionProvider'])
                        : null)
                : (json['typeDefinitionProvider'] == null
                    ? null
                    : (throw '''${json['typeDefinitionProvider']} was not one of (bool, TypeDefinitionOptions, TypeDefinitionRegistrationOptions)'''))));
    final implementationProvider = json['implementationProvider'] is bool
        ? Either3<bool, ImplementationOptions, ImplementationRegistrationOptions>.t1(
            json['implementationProvider'])
        : (ImplementationOptions.canParse(
                json['implementationProvider'], nullLspJsonReporter)
            ? Either3<bool, ImplementationOptions, ImplementationRegistrationOptions>.t2(json['implementationProvider'] != null
                ? ImplementationOptions.fromJson(json['implementationProvider'])
                : null)
            : (ImplementationRegistrationOptions.canParse(
                    json['implementationProvider'], nullLspJsonReporter)
                ? Either3<bool, ImplementationOptions, ImplementationRegistrationOptions>.t3(
                    json['implementationProvider'] != null
                        ? ImplementationRegistrationOptions.fromJson(
                            json['implementationProvider'])
                        : null)
                : (json['implementationProvider'] == null
                    ? null
                    : (throw '''${json['implementationProvider']} was not one of (bool, ImplementationOptions, ImplementationRegistrationOptions)'''))));
    final referencesProvider = json['referencesProvider'] is bool
        ? Either2<bool, ReferenceOptions>.t1(json['referencesProvider'])
        : (ReferenceOptions.canParse(
                json['referencesProvider'], nullLspJsonReporter)
            ? Either2<bool, ReferenceOptions>.t2(
                json['referencesProvider'] != null
                    ? ReferenceOptions.fromJson(json['referencesProvider'])
                    : null)
            : (json['referencesProvider'] == null
                ? null
                : (throw '''${json['referencesProvider']} was not one of (bool, ReferenceOptions)''')));
    final documentHighlightProvider = json['documentHighlightProvider'] is bool
        ? Either2<bool, DocumentHighlightOptions>.t1(
            json['documentHighlightProvider'])
        : (DocumentHighlightOptions.canParse(
                json['documentHighlightProvider'], nullLspJsonReporter)
            ? Either2<bool, DocumentHighlightOptions>.t2(
                json['documentHighlightProvider'] != null
                    ? DocumentHighlightOptions.fromJson(
                        json['documentHighlightProvider'])
                    : null)
            : (json['documentHighlightProvider'] == null
                ? null
                : (throw '''${json['documentHighlightProvider']} was not one of (bool, DocumentHighlightOptions)''')));
    final documentSymbolProvider = json['documentSymbolProvider'] is bool
        ? Either2<bool, DocumentSymbolOptions>.t1(
            json['documentSymbolProvider'])
        : (DocumentSymbolOptions.canParse(
                json['documentSymbolProvider'], nullLspJsonReporter)
            ? Either2<bool, DocumentSymbolOptions>.t2(
                json['documentSymbolProvider'] != null
                    ? DocumentSymbolOptions.fromJson(
                        json['documentSymbolProvider'])
                    : null)
            : (json['documentSymbolProvider'] == null
                ? null
                : (throw '''${json['documentSymbolProvider']} was not one of (bool, DocumentSymbolOptions)''')));
    final codeActionProvider = json['codeActionProvider'] is bool
        ? Either2<bool, CodeActionOptions>.t1(json['codeActionProvider'])
        : (CodeActionOptions.canParse(
                json['codeActionProvider'], nullLspJsonReporter)
            ? Either2<bool, CodeActionOptions>.t2(
                json['codeActionProvider'] != null
                    ? CodeActionOptions.fromJson(json['codeActionProvider'])
                    : null)
            : (json['codeActionProvider'] == null
                ? null
                : (throw '''${json['codeActionProvider']} was not one of (bool, CodeActionOptions)''')));
    final codeLensProvider = json['codeLensProvider'] != null
        ? CodeLensOptions.fromJson(json['codeLensProvider'])
        : null;
    final documentLinkProvider = json['documentLinkProvider'] != null
        ? DocumentLinkOptions.fromJson(json['documentLinkProvider'])
        : null;
    final colorProvider = json['colorProvider'] is bool
        ? Either3<bool, DocumentColorOptions, DocumentColorRegistrationOptions>.t1(
            json['colorProvider'])
        : (DocumentColorOptions.canParse(
                json['colorProvider'], nullLspJsonReporter)
            ? Either3<bool, DocumentColorOptions, DocumentColorRegistrationOptions>.t2(
                json['colorProvider'] != null
                    ? DocumentColorOptions.fromJson(json['colorProvider'])
                    : null)
            : (DocumentColorRegistrationOptions.canParse(
                    json['colorProvider'], nullLspJsonReporter)
                ? Either3<bool, DocumentColorOptions, DocumentColorRegistrationOptions>.t3(
                    json['colorProvider'] != null
                        ? DocumentColorRegistrationOptions.fromJson(
                            json['colorProvider'])
                        : null)
                : (json['colorProvider'] == null
                    ? null
                    : (throw '''${json['colorProvider']} was not one of (bool, DocumentColorOptions, DocumentColorRegistrationOptions)'''))));
    final documentFormattingProvider = json['documentFormattingProvider']
            is bool
        ? Either2<bool, DocumentFormattingOptions>.t1(
            json['documentFormattingProvider'])
        : (DocumentFormattingOptions.canParse(
                json['documentFormattingProvider'], nullLspJsonReporter)
            ? Either2<bool, DocumentFormattingOptions>.t2(
                json['documentFormattingProvider'] != null
                    ? DocumentFormattingOptions.fromJson(
                        json['documentFormattingProvider'])
                    : null)
            : (json['documentFormattingProvider'] == null
                ? null
                : (throw '''${json['documentFormattingProvider']} was not one of (bool, DocumentFormattingOptions)''')));
    final documentRangeFormattingProvider = json[
            'documentRangeFormattingProvider'] is bool
        ? Either2<bool, DocumentRangeFormattingOptions>.t1(
            json['documentRangeFormattingProvider'])
        : (DocumentRangeFormattingOptions.canParse(
                json['documentRangeFormattingProvider'], nullLspJsonReporter)
            ? Either2<bool, DocumentRangeFormattingOptions>.t2(
                json['documentRangeFormattingProvider'] != null
                    ? DocumentRangeFormattingOptions.fromJson(
                        json['documentRangeFormattingProvider'])
                    : null)
            : (json['documentRangeFormattingProvider'] == null
                ? null
                : (throw '''${json['documentRangeFormattingProvider']} was not one of (bool, DocumentRangeFormattingOptions)''')));
    final documentOnTypeFormattingProvider =
        json['documentOnTypeFormattingProvider'] != null
            ? DocumentOnTypeFormattingOptions.fromJson(
                json['documentOnTypeFormattingProvider'])
            : null;
    final renameProvider = json['renameProvider'] is bool
        ? Either2<bool, RenameOptions>.t1(json['renameProvider'])
        : (RenameOptions.canParse(json['renameProvider'], nullLspJsonReporter)
            ? Either2<bool, RenameOptions>.t2(json['renameProvider'] != null
                ? RenameOptions.fromJson(json['renameProvider'])
                : null)
            : (json['renameProvider'] == null
                ? null
                : (throw '''${json['renameProvider']} was not one of (bool, RenameOptions)''')));
    final foldingRangeProvider = json['foldingRangeProvider'] is bool
        ? Either3<bool, FoldingRangeOptions, FoldingRangeRegistrationOptions>.t1(
            json['foldingRangeProvider'])
        : (FoldingRangeOptions.canParse(
                json['foldingRangeProvider'], nullLspJsonReporter)
            ? Either3<bool, FoldingRangeOptions, FoldingRangeRegistrationOptions>.t2(
                json['foldingRangeProvider'] != null
                    ? FoldingRangeOptions.fromJson(json['foldingRangeProvider'])
                    : null)
            : (FoldingRangeRegistrationOptions.canParse(
                    json['foldingRangeProvider'], nullLspJsonReporter)
                ? Either3<bool, FoldingRangeOptions, FoldingRangeRegistrationOptions>.t3(
                    json['foldingRangeProvider'] != null
                        ? FoldingRangeRegistrationOptions.fromJson(
                            json['foldingRangeProvider'])
                        : null)
                : (json['foldingRangeProvider'] == null
                    ? null
                    : (throw '''${json['foldingRangeProvider']} was not one of (bool, FoldingRangeOptions, FoldingRangeRegistrationOptions)'''))));
    final executeCommandProvider = json['executeCommandProvider'] != null
        ? ExecuteCommandOptions.fromJson(json['executeCommandProvider'])
        : null;
    final selectionRangeProvider = json['selectionRangeProvider'] is bool
        ? Either3<bool, SelectionRangeOptions, SelectionRangeRegistrationOptions>.t1(
            json['selectionRangeProvider'])
        : (SelectionRangeOptions.canParse(
                json['selectionRangeProvider'], nullLspJsonReporter)
            ? Either3<bool, SelectionRangeOptions, SelectionRangeRegistrationOptions>.t2(json['selectionRangeProvider'] != null
                ? SelectionRangeOptions.fromJson(json['selectionRangeProvider'])
                : null)
            : (SelectionRangeRegistrationOptions.canParse(
                    json['selectionRangeProvider'], nullLspJsonReporter)
                ? Either3<bool, SelectionRangeOptions, SelectionRangeRegistrationOptions>.t3(
                    json['selectionRangeProvider'] != null
                        ? SelectionRangeRegistrationOptions.fromJson(
                            json['selectionRangeProvider'])
                        : null)
                : (json['selectionRangeProvider'] == null
                    ? null
                    : (throw '''${json['selectionRangeProvider']} was not one of (bool, SelectionRangeOptions, SelectionRangeRegistrationOptions)'''))));
    final workspaceSymbolProvider = json['workspaceSymbolProvider'];
    final workspace = json['workspace'] != null
        ? ServerCapabilitiesWorkspace.fromJson(json['workspace'])
        : null;
    final experimental = json['experimental'];
    return ServerCapabilities(
        textDocumentSync: textDocumentSync,
        completionProvider: completionProvider,
        hoverProvider: hoverProvider,
        signatureHelpProvider: signatureHelpProvider,
        declarationProvider: declarationProvider,
        definitionProvider: definitionProvider,
        typeDefinitionProvider: typeDefinitionProvider,
        implementationProvider: implementationProvider,
        referencesProvider: referencesProvider,
        documentHighlightProvider: documentHighlightProvider,
        documentSymbolProvider: documentSymbolProvider,
        codeActionProvider: codeActionProvider,
        codeLensProvider: codeLensProvider,
        documentLinkProvider: documentLinkProvider,
        colorProvider: colorProvider,
        documentFormattingProvider: documentFormattingProvider,
        documentRangeFormattingProvider: documentRangeFormattingProvider,
        documentOnTypeFormattingProvider: documentOnTypeFormattingProvider,
        renameProvider: renameProvider,
        foldingRangeProvider: foldingRangeProvider,
        executeCommandProvider: executeCommandProvider,
        selectionRangeProvider: selectionRangeProvider,
        workspaceSymbolProvider: workspaceSymbolProvider,
        workspace: workspace,
        experimental: experimental);
  }

  /// The server provides code actions. The `CodeActionOptions` return type is
  /// only valid if the client signals code action literal support via the
  /// property `textDocument.codeAction.codeActionLiteralSupport`.
  final Either2<bool, CodeActionOptions> codeActionProvider;

  /// The server provides code lens.
  final CodeLensOptions codeLensProvider;

  /// The server provides color provider support.
  ///  @since 3.6.0
  final Either3<bool, DocumentColorOptions, DocumentColorRegistrationOptions>
      colorProvider;

  /// The server provides completion support.
  final CompletionOptions completionProvider;

  /// The server provides go to declaration support.
  ///  @since 3.14.0
  final Either3<bool, DeclarationOptions, DeclarationRegistrationOptions>
      declarationProvider;

  /// The server provides goto definition support.
  final Either2<bool, DefinitionOptions> definitionProvider;

  /// The server provides document formatting.
  final Either2<bool, DocumentFormattingOptions> documentFormattingProvider;

  /// The server provides document highlight support.
  final Either2<bool, DocumentHighlightOptions> documentHighlightProvider;

  /// The server provides document link support.
  final DocumentLinkOptions documentLinkProvider;

  /// The server provides document formatting on typing.
  final DocumentOnTypeFormattingOptions documentOnTypeFormattingProvider;

  /// The server provides document range formatting.
  final Either2<bool, DocumentRangeFormattingOptions>
      documentRangeFormattingProvider;

  /// The server provides document symbol support.
  final Either2<bool, DocumentSymbolOptions> documentSymbolProvider;

  /// The server provides execute command support.
  final ExecuteCommandOptions executeCommandProvider;

  /// Experimental server capabilities.
  final dynamic experimental;

  /// The server provides folding provider support.
  ///  @since 3.10.0
  final Either3<bool, FoldingRangeOptions, FoldingRangeRegistrationOptions>
      foldingRangeProvider;

  /// The server provides hover support.
  final Either2<bool, HoverOptions> hoverProvider;

  /// The server provides goto implementation support.
  ///  @since 3.6.0
  final Either3<bool, ImplementationOptions, ImplementationRegistrationOptions>
      implementationProvider;

  /// The server provides find references support.
  final Either2<bool, ReferenceOptions> referencesProvider;

  /// The server provides rename support. RenameOptions may only be specified if
  /// the client states that it supports `prepareSupport` in its initial
  /// `initialize` request.
  final Either2<bool, RenameOptions> renameProvider;

  /// The server provides selection range support.
  ///  @since 3.15.0
  final Either3<bool, SelectionRangeOptions, SelectionRangeRegistrationOptions>
      selectionRangeProvider;

  /// The server provides signature help support.
  final SignatureHelpOptions signatureHelpProvider;

  /// Defines how text documents are synced. Is either a detailed structure
  /// defining each notification or for backwards compatibility the
  /// TextDocumentSyncKind number. If omitted it defaults to
  /// `TextDocumentSyncKind.None`.
  final Either2<TextDocumentSyncOptions, num> textDocumentSync;

  /// The server provides goto type definition support.
  ///  @since 3.6.0
  final Either3<bool, TypeDefinitionOptions, TypeDefinitionRegistrationOptions>
      typeDefinitionProvider;

  /// Workspace specific server capabilities
  final ServerCapabilitiesWorkspace workspace;

  /// The server provides workspace symbol support.
  final bool workspaceSymbolProvider;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (textDocumentSync != null) {
      __result['textDocumentSync'] = textDocumentSync;
    }
    if (completionProvider != null) {
      __result['completionProvider'] = completionProvider;
    }
    if (hoverProvider != null) {
      __result['hoverProvider'] = hoverProvider;
    }
    if (signatureHelpProvider != null) {
      __result['signatureHelpProvider'] = signatureHelpProvider;
    }
    if (declarationProvider != null) {
      __result['declarationProvider'] = declarationProvider;
    }
    if (definitionProvider != null) {
      __result['definitionProvider'] = definitionProvider;
    }
    if (typeDefinitionProvider != null) {
      __result['typeDefinitionProvider'] = typeDefinitionProvider;
    }
    if (implementationProvider != null) {
      __result['implementationProvider'] = implementationProvider;
    }
    if (referencesProvider != null) {
      __result['referencesProvider'] = referencesProvider;
    }
    if (documentHighlightProvider != null) {
      __result['documentHighlightProvider'] = documentHighlightProvider;
    }
    if (documentSymbolProvider != null) {
      __result['documentSymbolProvider'] = documentSymbolProvider;
    }
    if (codeActionProvider != null) {
      __result['codeActionProvider'] = codeActionProvider;
    }
    if (codeLensProvider != null) {
      __result['codeLensProvider'] = codeLensProvider;
    }
    if (documentLinkProvider != null) {
      __result['documentLinkProvider'] = documentLinkProvider;
    }
    if (colorProvider != null) {
      __result['colorProvider'] = colorProvider;
    }
    if (documentFormattingProvider != null) {
      __result['documentFormattingProvider'] = documentFormattingProvider;
    }
    if (documentRangeFormattingProvider != null) {
      __result['documentRangeFormattingProvider'] =
          documentRangeFormattingProvider;
    }
    if (documentOnTypeFormattingProvider != null) {
      __result['documentOnTypeFormattingProvider'] =
          documentOnTypeFormattingProvider;
    }
    if (renameProvider != null) {
      __result['renameProvider'] = renameProvider;
    }
    if (foldingRangeProvider != null) {
      __result['foldingRangeProvider'] = foldingRangeProvider;
    }
    if (executeCommandProvider != null) {
      __result['executeCommandProvider'] = executeCommandProvider;
    }
    if (selectionRangeProvider != null) {
      __result['selectionRangeProvider'] = selectionRangeProvider;
    }
    if (workspaceSymbolProvider != null) {
      __result['workspaceSymbolProvider'] = workspaceSymbolProvider;
    }
    if (workspace != null) {
      __result['workspace'] = workspace;
    }
    if (experimental != null) {
      __result['experimental'] = experimental;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocumentSync');
      try {
        if (obj['textDocumentSync'] != null &&
            !((TextDocumentSyncOptions.canParse(
                    obj['textDocumentSync'], reporter) ||
                obj['textDocumentSync'] is num))) {
          reporter.reportError(
              'must be of type Either2<TextDocumentSyncOptions, num>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('completionProvider');
      try {
        if (obj['completionProvider'] != null &&
            !(CompletionOptions.canParse(
                obj['completionProvider'], reporter))) {
          reporter.reportError('must be of type CompletionOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('hoverProvider');
      try {
        if (obj['hoverProvider'] != null &&
            !((obj['hoverProvider'] is bool ||
                HoverOptions.canParse(obj['hoverProvider'], reporter)))) {
          reporter.reportError('must be of type Either2<bool, HoverOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('signatureHelpProvider');
      try {
        if (obj['signatureHelpProvider'] != null &&
            !(SignatureHelpOptions.canParse(
                obj['signatureHelpProvider'], reporter))) {
          reporter.reportError('must be of type SignatureHelpOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('declarationProvider');
      try {
        if (obj['declarationProvider'] != null &&
            !((obj['declarationProvider'] is bool ||
                DeclarationOptions.canParse(
                    obj['declarationProvider'], reporter) ||
                DeclarationRegistrationOptions.canParse(
                    obj['declarationProvider'], reporter)))) {
          reporter.reportError(
              'must be of type Either3<bool, DeclarationOptions, DeclarationRegistrationOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('definitionProvider');
      try {
        if (obj['definitionProvider'] != null &&
            !((obj['definitionProvider'] is bool ||
                DefinitionOptions.canParse(
                    obj['definitionProvider'], reporter)))) {
          reporter
              .reportError('must be of type Either2<bool, DefinitionOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('typeDefinitionProvider');
      try {
        if (obj['typeDefinitionProvider'] != null &&
            !((obj['typeDefinitionProvider'] is bool ||
                TypeDefinitionOptions.canParse(
                    obj['typeDefinitionProvider'], reporter) ||
                TypeDefinitionRegistrationOptions.canParse(
                    obj['typeDefinitionProvider'], reporter)))) {
          reporter.reportError(
              'must be of type Either3<bool, TypeDefinitionOptions, TypeDefinitionRegistrationOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('implementationProvider');
      try {
        if (obj['implementationProvider'] != null &&
            !((obj['implementationProvider'] is bool ||
                ImplementationOptions.canParse(
                    obj['implementationProvider'], reporter) ||
                ImplementationRegistrationOptions.canParse(
                    obj['implementationProvider'], reporter)))) {
          reporter.reportError(
              'must be of type Either3<bool, ImplementationOptions, ImplementationRegistrationOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('referencesProvider');
      try {
        if (obj['referencesProvider'] != null &&
            !((obj['referencesProvider'] is bool ||
                ReferenceOptions.canParse(
                    obj['referencesProvider'], reporter)))) {
          reporter
              .reportError('must be of type Either2<bool, ReferenceOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentHighlightProvider');
      try {
        if (obj['documentHighlightProvider'] != null &&
            !((obj['documentHighlightProvider'] is bool ||
                DocumentHighlightOptions.canParse(
                    obj['documentHighlightProvider'], reporter)))) {
          reporter.reportError(
              'must be of type Either2<bool, DocumentHighlightOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentSymbolProvider');
      try {
        if (obj['documentSymbolProvider'] != null &&
            !((obj['documentSymbolProvider'] is bool ||
                DocumentSymbolOptions.canParse(
                    obj['documentSymbolProvider'], reporter)))) {
          reporter.reportError(
              'must be of type Either2<bool, DocumentSymbolOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('codeActionProvider');
      try {
        if (obj['codeActionProvider'] != null &&
            !((obj['codeActionProvider'] is bool ||
                CodeActionOptions.canParse(
                    obj['codeActionProvider'], reporter)))) {
          reporter
              .reportError('must be of type Either2<bool, CodeActionOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('codeLensProvider');
      try {
        if (obj['codeLensProvider'] != null &&
            !(CodeLensOptions.canParse(obj['codeLensProvider'], reporter))) {
          reporter.reportError('must be of type CodeLensOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentLinkProvider');
      try {
        if (obj['documentLinkProvider'] != null &&
            !(DocumentLinkOptions.canParse(
                obj['documentLinkProvider'], reporter))) {
          reporter.reportError('must be of type DocumentLinkOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('colorProvider');
      try {
        if (obj['colorProvider'] != null &&
            !((obj['colorProvider'] is bool ||
                DocumentColorOptions.canParse(obj['colorProvider'], reporter) ||
                DocumentColorRegistrationOptions.canParse(
                    obj['colorProvider'], reporter)))) {
          reporter.reportError(
              'must be of type Either3<bool, DocumentColorOptions, DocumentColorRegistrationOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentFormattingProvider');
      try {
        if (obj['documentFormattingProvider'] != null &&
            !((obj['documentFormattingProvider'] is bool ||
                DocumentFormattingOptions.canParse(
                    obj['documentFormattingProvider'], reporter)))) {
          reporter.reportError(
              'must be of type Either2<bool, DocumentFormattingOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentRangeFormattingProvider');
      try {
        if (obj['documentRangeFormattingProvider'] != null &&
            !((obj['documentRangeFormattingProvider'] is bool ||
                DocumentRangeFormattingOptions.canParse(
                    obj['documentRangeFormattingProvider'], reporter)))) {
          reporter.reportError(
              'must be of type Either2<bool, DocumentRangeFormattingOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentOnTypeFormattingProvider');
      try {
        if (obj['documentOnTypeFormattingProvider'] != null &&
            !(DocumentOnTypeFormattingOptions.canParse(
                obj['documentOnTypeFormattingProvider'], reporter))) {
          reporter
              .reportError('must be of type DocumentOnTypeFormattingOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('renameProvider');
      try {
        if (obj['renameProvider'] != null &&
            !((obj['renameProvider'] is bool ||
                RenameOptions.canParse(obj['renameProvider'], reporter)))) {
          reporter.reportError('must be of type Either2<bool, RenameOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('foldingRangeProvider');
      try {
        if (obj['foldingRangeProvider'] != null &&
            !((obj['foldingRangeProvider'] is bool ||
                FoldingRangeOptions.canParse(
                    obj['foldingRangeProvider'], reporter) ||
                FoldingRangeRegistrationOptions.canParse(
                    obj['foldingRangeProvider'], reporter)))) {
          reporter.reportError(
              'must be of type Either3<bool, FoldingRangeOptions, FoldingRangeRegistrationOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('executeCommandProvider');
      try {
        if (obj['executeCommandProvider'] != null &&
            !(ExecuteCommandOptions.canParse(
                obj['executeCommandProvider'], reporter))) {
          reporter.reportError('must be of type ExecuteCommandOptions');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('selectionRangeProvider');
      try {
        if (obj['selectionRangeProvider'] != null &&
            !((obj['selectionRangeProvider'] is bool ||
                SelectionRangeOptions.canParse(
                    obj['selectionRangeProvider'], reporter) ||
                SelectionRangeRegistrationOptions.canParse(
                    obj['selectionRangeProvider'], reporter)))) {
          reporter.reportError(
              'must be of type Either3<bool, SelectionRangeOptions, SelectionRangeRegistrationOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workspaceSymbolProvider');
      try {
        if (obj['workspaceSymbolProvider'] != null &&
            !(obj['workspaceSymbolProvider'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workspace');
      try {
        if (obj['workspace'] != null &&
            !(ServerCapabilitiesWorkspace.canParse(
                obj['workspace'], reporter))) {
          reporter.reportError('must be of type ServerCapabilitiesWorkspace');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('experimental');
      try {
        if (obj['experimental'] != null && !(true)) {
          reporter.reportError('must be of type dynamic');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ServerCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ServerCapabilities &&
        other.runtimeType == ServerCapabilities) {
      return textDocumentSync == other.textDocumentSync &&
          completionProvider == other.completionProvider &&
          hoverProvider == other.hoverProvider &&
          signatureHelpProvider == other.signatureHelpProvider &&
          declarationProvider == other.declarationProvider &&
          definitionProvider == other.definitionProvider &&
          typeDefinitionProvider == other.typeDefinitionProvider &&
          implementationProvider == other.implementationProvider &&
          referencesProvider == other.referencesProvider &&
          documentHighlightProvider == other.documentHighlightProvider &&
          documentSymbolProvider == other.documentSymbolProvider &&
          codeActionProvider == other.codeActionProvider &&
          codeLensProvider == other.codeLensProvider &&
          documentLinkProvider == other.documentLinkProvider &&
          colorProvider == other.colorProvider &&
          documentFormattingProvider == other.documentFormattingProvider &&
          documentRangeFormattingProvider ==
              other.documentRangeFormattingProvider &&
          documentOnTypeFormattingProvider ==
              other.documentOnTypeFormattingProvider &&
          renameProvider == other.renameProvider &&
          foldingRangeProvider == other.foldingRangeProvider &&
          executeCommandProvider == other.executeCommandProvider &&
          selectionRangeProvider == other.selectionRangeProvider &&
          workspaceSymbolProvider == other.workspaceSymbolProvider &&
          workspace == other.workspace &&
          experimental == other.experimental &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocumentSync.hashCode);
    hash = JenkinsSmiHash.combine(hash, completionProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, hoverProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, signatureHelpProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, declarationProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, definitionProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, typeDefinitionProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, implementationProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, referencesProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, documentHighlightProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, documentSymbolProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, codeActionProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, codeLensProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, documentLinkProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, colorProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, documentFormattingProvider.hashCode);
    hash =
        JenkinsSmiHash.combine(hash, documentRangeFormattingProvider.hashCode);
    hash =
        JenkinsSmiHash.combine(hash, documentOnTypeFormattingProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, renameProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, foldingRangeProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, executeCommandProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, selectionRangeProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, workspaceSymbolProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, workspace.hashCode);
    hash = JenkinsSmiHash.combine(hash, experimental.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ServerCapabilitiesWorkspace implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ServerCapabilitiesWorkspace.canParse,
      ServerCapabilitiesWorkspace.fromJson);

  ServerCapabilitiesWorkspace({this.workspaceFolders});
  static ServerCapabilitiesWorkspace fromJson(Map<String, dynamic> json) {
    final workspaceFolders = json['workspaceFolders'] != null
        ? WorkspaceFoldersServerCapabilities.fromJson(json['workspaceFolders'])
        : null;
    return ServerCapabilitiesWorkspace(workspaceFolders: workspaceFolders);
  }

  /// The server supports workspace folder.
  ///  @since 3.6.0
  final WorkspaceFoldersServerCapabilities workspaceFolders;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workspaceFolders != null) {
      __result['workspaceFolders'] = workspaceFolders;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workspaceFolders');
      try {
        if (obj['workspaceFolders'] != null &&
            !(WorkspaceFoldersServerCapabilities.canParse(
                obj['workspaceFolders'], reporter))) {
          reporter.reportError(
              'must be of type WorkspaceFoldersServerCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ServerCapabilitiesWorkspace');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ServerCapabilitiesWorkspace &&
        other.runtimeType == ServerCapabilitiesWorkspace) {
      return workspaceFolders == other.workspaceFolders && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workspaceFolders.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ShowMessageParams implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(ShowMessageParams.canParse, ShowMessageParams.fromJson);

  ShowMessageParams({@required this.type, @required this.message}) {
    if (type == null) {
      throw 'type is required but was not provided';
    }
    if (message == null) {
      throw 'message is required but was not provided';
    }
  }
  static ShowMessageParams fromJson(Map<String, dynamic> json) {
    final type =
        json['type'] != null ? MessageType.fromJson(json['type']) : null;
    final message = json['message'];
    return ShowMessageParams(type: type, message: message);
  }

  /// The actual message.
  final String message;

  /// The message type.
  final MessageType type;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['type'] = type ?? (throw 'type is required but was not set');
    __result['message'] =
        message ?? (throw 'message is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('type');
      try {
        if (!obj.containsKey('type')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['type'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(MessageType.canParse(obj['type'], reporter))) {
          reporter.reportError('must be of type MessageType');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('message');
      try {
        if (!obj.containsKey('message')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['message'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['message'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ShowMessageParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ShowMessageParams && other.runtimeType == ShowMessageParams) {
      return type == other.type && message == other.message && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, type.hashCode);
    hash = JenkinsSmiHash.combine(hash, message.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class ShowMessageRequestParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      ShowMessageRequestParams.canParse, ShowMessageRequestParams.fromJson);

  ShowMessageRequestParams(
      {@required this.type, @required this.message, this.actions}) {
    if (type == null) {
      throw 'type is required but was not provided';
    }
    if (message == null) {
      throw 'message is required but was not provided';
    }
  }
  static ShowMessageRequestParams fromJson(Map<String, dynamic> json) {
    final type =
        json['type'] != null ? MessageType.fromJson(json['type']) : null;
    final message = json['message'];
    final actions = json['actions']
        ?.map((item) => item != null ? MessageActionItem.fromJson(item) : null)
        ?.cast<MessageActionItem>()
        ?.toList();
    return ShowMessageRequestParams(
        type: type, message: message, actions: actions);
  }

  /// The message action items to present.
  final List<MessageActionItem> actions;

  /// The actual message
  final String message;

  /// The message type.
  final MessageType type;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['type'] = type ?? (throw 'type is required but was not set');
    __result['message'] =
        message ?? (throw 'message is required but was not set');
    if (actions != null) {
      __result['actions'] = actions;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('type');
      try {
        if (!obj.containsKey('type')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['type'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(MessageType.canParse(obj['type'], reporter))) {
          reporter.reportError('must be of type MessageType');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('message');
      try {
        if (!obj.containsKey('message')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['message'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['message'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('actions');
      try {
        if (obj['actions'] != null &&
            !((obj['actions'] is List &&
                (obj['actions'].every(
                    (item) => MessageActionItem.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<MessageActionItem>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type ShowMessageRequestParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is ShowMessageRequestParams &&
        other.runtimeType == ShowMessageRequestParams) {
      return type == other.type &&
          message == other.message &&
          listEqual(actions, other.actions,
              (MessageActionItem a, MessageActionItem b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, type.hashCode);
    hash = JenkinsSmiHash.combine(hash, message.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(actions));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Signature help represents the signature of something callable. There can be
/// multiple signature but only one active and only one active parameter.
class SignatureHelp implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(SignatureHelp.canParse, SignatureHelp.fromJson);

  SignatureHelp(
      {@required this.signatures, this.activeSignature, this.activeParameter}) {
    if (signatures == null) {
      throw 'signatures is required but was not provided';
    }
  }
  static SignatureHelp fromJson(Map<String, dynamic> json) {
    final signatures = json['signatures']
        ?.map(
            (item) => item != null ? SignatureInformation.fromJson(item) : null)
        ?.cast<SignatureInformation>()
        ?.toList();
    final activeSignature = json['activeSignature'];
    final activeParameter = json['activeParameter'];
    return SignatureHelp(
        signatures: signatures,
        activeSignature: activeSignature,
        activeParameter: activeParameter);
  }

  /// The active parameter of the active signature. If omitted or the value lies
  /// outside the range of `signatures[activeSignature].parameters` defaults to
  /// 0 if the active signature has parameters. If the active signature has no
  /// parameters it is ignored. In future version of the protocol this property
  /// might become mandatory to better express the active parameter if the
  /// active signature does have any.
  final num activeParameter;

  /// The active signature. If omitted or the value lies outside the range of
  /// `signatures` the value defaults to zero or is ignore if the
  /// `SignatureHelp` as no signatures.
  ///
  /// Whenever possible implementors should make an active decision about the
  /// active signature and shouldn't rely on a default value.
  ///
  /// In future version of the protocol this property might become mandatory to
  /// better express this.
  final num activeSignature;

  /// One or more signatures. If no signaures are availabe the signature help
  /// request should return `null`.
  final List<SignatureInformation> signatures;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['signatures'] =
        signatures ?? (throw 'signatures is required but was not set');
    if (activeSignature != null) {
      __result['activeSignature'] = activeSignature;
    }
    if (activeParameter != null) {
      __result['activeParameter'] = activeParameter;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('signatures');
      try {
        if (!obj.containsKey('signatures')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['signatures'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['signatures'] is List &&
            (obj['signatures'].every(
                (item) => SignatureInformation.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<SignatureInformation>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('activeSignature');
      try {
        if (obj['activeSignature'] != null &&
            !(obj['activeSignature'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('activeParameter');
      try {
        if (obj['activeParameter'] != null &&
            !(obj['activeParameter'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SignatureHelp');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SignatureHelp && other.runtimeType == SignatureHelp) {
      return listEqual(signatures, other.signatures,
              (SignatureInformation a, SignatureInformation b) => a == b) &&
          activeSignature == other.activeSignature &&
          activeParameter == other.activeParameter &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(signatures));
    hash = JenkinsSmiHash.combine(hash, activeSignature.hashCode);
    hash = JenkinsSmiHash.combine(hash, activeParameter.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SignatureHelpClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SignatureHelpClientCapabilities.canParse,
      SignatureHelpClientCapabilities.fromJson);

  SignatureHelpClientCapabilities(
      {this.dynamicRegistration,
      this.signatureInformation,
      this.contextSupport});
  static SignatureHelpClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final signatureInformation = json['signatureInformation'] != null
        ? SignatureHelpClientCapabilitiesSignatureInformation.fromJson(
            json['signatureInformation'])
        : null;
    final contextSupport = json['contextSupport'];
    return SignatureHelpClientCapabilities(
        dynamicRegistration: dynamicRegistration,
        signatureInformation: signatureInformation,
        contextSupport: contextSupport);
  }

  /// The client supports to send additional context information for a
  /// `textDocument/signatureHelp` request. A client that opts into
  /// contextSupport will also support the `retriggerCharacters` on
  /// `SignatureHelpOptions`.
  ///  @since 3.15.0
  final bool contextSupport;

  /// Whether signature help supports dynamic registration.
  final bool dynamicRegistration;

  /// The client supports the following `SignatureInformation` specific
  /// properties.
  final SignatureHelpClientCapabilitiesSignatureInformation
      signatureInformation;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (signatureInformation != null) {
      __result['signatureInformation'] = signatureInformation;
    }
    if (contextSupport != null) {
      __result['contextSupport'] = contextSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('signatureInformation');
      try {
        if (obj['signatureInformation'] != null &&
            !(SignatureHelpClientCapabilitiesSignatureInformation.canParse(
                obj['signatureInformation'], reporter))) {
          reporter.reportError(
              'must be of type SignatureHelpClientCapabilitiesSignatureInformation');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('contextSupport');
      try {
        if (obj['contextSupport'] != null && !(obj['contextSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SignatureHelpClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SignatureHelpClientCapabilities &&
        other.runtimeType == SignatureHelpClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          signatureInformation == other.signatureInformation &&
          contextSupport == other.contextSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, signatureInformation.hashCode);
    hash = JenkinsSmiHash.combine(hash, contextSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SignatureHelpClientCapabilitiesParameterInformation
    implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SignatureHelpClientCapabilitiesParameterInformation.canParse,
      SignatureHelpClientCapabilitiesParameterInformation.fromJson);

  SignatureHelpClientCapabilitiesParameterInformation(
      {this.labelOffsetSupport});
  static SignatureHelpClientCapabilitiesParameterInformation fromJson(
      Map<String, dynamic> json) {
    final labelOffsetSupport = json['labelOffsetSupport'];
    return SignatureHelpClientCapabilitiesParameterInformation(
        labelOffsetSupport: labelOffsetSupport);
  }

  /// The client supports processing label offsets instead of a simple label
  /// string.
  ///  @since 3.14.0
  final bool labelOffsetSupport;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (labelOffsetSupport != null) {
      __result['labelOffsetSupport'] = labelOffsetSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('labelOffsetSupport');
      try {
        if (obj['labelOffsetSupport'] != null &&
            !(obj['labelOffsetSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type SignatureHelpClientCapabilitiesParameterInformation');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SignatureHelpClientCapabilitiesParameterInformation &&
        other.runtimeType ==
            SignatureHelpClientCapabilitiesParameterInformation) {
      return labelOffsetSupport == other.labelOffsetSupport && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, labelOffsetSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SignatureHelpClientCapabilitiesSignatureInformation
    implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SignatureHelpClientCapabilitiesSignatureInformation.canParse,
      SignatureHelpClientCapabilitiesSignatureInformation.fromJson);

  SignatureHelpClientCapabilitiesSignatureInformation(
      {this.documentationFormat, this.parameterInformation});
  static SignatureHelpClientCapabilitiesSignatureInformation fromJson(
      Map<String, dynamic> json) {
    final documentationFormat = json['documentationFormat']
        ?.map((item) => item != null ? MarkupKind.fromJson(item) : null)
        ?.cast<MarkupKind>()
        ?.toList();
    final parameterInformation = json['parameterInformation'] != null
        ? SignatureHelpClientCapabilitiesParameterInformation.fromJson(
            json['parameterInformation'])
        : null;
    return SignatureHelpClientCapabilitiesSignatureInformation(
        documentationFormat: documentationFormat,
        parameterInformation: parameterInformation);
  }

  /// Client supports the follow content formats for the documentation property.
  /// The order describes the preferred format of the client.
  final List<MarkupKind> documentationFormat;

  /// Client capabilities specific to parameter information.
  final SignatureHelpClientCapabilitiesParameterInformation
      parameterInformation;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (documentationFormat != null) {
      __result['documentationFormat'] = documentationFormat;
    }
    if (parameterInformation != null) {
      __result['parameterInformation'] = parameterInformation;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentationFormat');
      try {
        if (obj['documentationFormat'] != null &&
            !((obj['documentationFormat'] is List &&
                (obj['documentationFormat']
                    .every((item) => MarkupKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<MarkupKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('parameterInformation');
      try {
        if (obj['parameterInformation'] != null &&
            !(SignatureHelpClientCapabilitiesParameterInformation.canParse(
                obj['parameterInformation'], reporter))) {
          reporter.reportError(
              'must be of type SignatureHelpClientCapabilitiesParameterInformation');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type SignatureHelpClientCapabilitiesSignatureInformation');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SignatureHelpClientCapabilitiesSignatureInformation &&
        other.runtimeType ==
            SignatureHelpClientCapabilitiesSignatureInformation) {
      return listEqual(documentationFormat, other.documentationFormat,
              (MarkupKind a, MarkupKind b) => a == b) &&
          parameterInformation == other.parameterInformation &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentationFormat));
    hash = JenkinsSmiHash.combine(hash, parameterInformation.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Additional information about the context in which a signature help request
/// was triggered.
///  @since 3.15.0
class SignatureHelpContext implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SignatureHelpContext.canParse, SignatureHelpContext.fromJson);

  SignatureHelpContext(
      {@required this.triggerKind,
      this.triggerCharacter,
      @required this.isRetrigger,
      this.activeSignatureHelp}) {
    if (triggerKind == null) {
      throw 'triggerKind is required but was not provided';
    }
    if (isRetrigger == null) {
      throw 'isRetrigger is required but was not provided';
    }
  }
  static SignatureHelpContext fromJson(Map<String, dynamic> json) {
    final triggerKind = json['triggerKind'] != null
        ? SignatureHelpTriggerKind.fromJson(json['triggerKind'])
        : null;
    final triggerCharacter = json['triggerCharacter'];
    final isRetrigger = json['isRetrigger'];
    final activeSignatureHelp = json['activeSignatureHelp'] != null
        ? SignatureHelp.fromJson(json['activeSignatureHelp'])
        : null;
    return SignatureHelpContext(
        triggerKind: triggerKind,
        triggerCharacter: triggerCharacter,
        isRetrigger: isRetrigger,
        activeSignatureHelp: activeSignatureHelp);
  }

  /// The currently active `SignatureHelp`.
  ///
  /// The `activeSignatureHelp` has its `SignatureHelp.activeSignature` field
  /// updated based on the user navigating through available signatures.
  final SignatureHelp activeSignatureHelp;

  /// `true` if signature help was already showing when it was triggered.
  ///
  /// Retriggers occur when the signature help is already active and can be
  /// caused by actions such as typing a trigger character, a cursor move, or
  /// document content changes.
  final bool isRetrigger;

  /// Character that caused signature help to be triggered.
  ///
  /// This is undefined when `triggerKind !==
  /// SignatureHelpTriggerKind.TriggerCharacter`
  final String triggerCharacter;

  /// Action that caused signature help to be triggered.
  final SignatureHelpTriggerKind triggerKind;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['triggerKind'] =
        triggerKind ?? (throw 'triggerKind is required but was not set');
    if (triggerCharacter != null) {
      __result['triggerCharacter'] = triggerCharacter;
    }
    __result['isRetrigger'] =
        isRetrigger ?? (throw 'isRetrigger is required but was not set');
    if (activeSignatureHelp != null) {
      __result['activeSignatureHelp'] = activeSignatureHelp;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('triggerKind');
      try {
        if (!obj.containsKey('triggerKind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['triggerKind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(SignatureHelpTriggerKind.canParse(
            obj['triggerKind'], reporter))) {
          reporter.reportError('must be of type SignatureHelpTriggerKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('triggerCharacter');
      try {
        if (obj['triggerCharacter'] != null &&
            !(obj['triggerCharacter'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('isRetrigger');
      try {
        if (!obj.containsKey('isRetrigger')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['isRetrigger'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['isRetrigger'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('activeSignatureHelp');
      try {
        if (obj['activeSignatureHelp'] != null &&
            !(SignatureHelp.canParse(obj['activeSignatureHelp'], reporter))) {
          reporter.reportError('must be of type SignatureHelp');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SignatureHelpContext');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SignatureHelpContext &&
        other.runtimeType == SignatureHelpContext) {
      return triggerKind == other.triggerKind &&
          triggerCharacter == other.triggerCharacter &&
          isRetrigger == other.isRetrigger &&
          activeSignatureHelp == other.activeSignatureHelp &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, triggerKind.hashCode);
    hash = JenkinsSmiHash.combine(hash, triggerCharacter.hashCode);
    hash = JenkinsSmiHash.combine(hash, isRetrigger.hashCode);
    hash = JenkinsSmiHash.combine(hash, activeSignatureHelp.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SignatureHelpOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SignatureHelpOptions.canParse, SignatureHelpOptions.fromJson);

  SignatureHelpOptions(
      {this.triggerCharacters,
      this.retriggerCharacters,
      this.workDoneProgress});
  static SignatureHelpOptions fromJson(Map<String, dynamic> json) {
    if (SignatureHelpRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return SignatureHelpRegistrationOptions.fromJson(json);
    }
    final triggerCharacters = json['triggerCharacters']
        ?.map((item) => item)
        ?.cast<String>()
        ?.toList();
    final retriggerCharacters = json['retriggerCharacters']
        ?.map((item) => item)
        ?.cast<String>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return SignatureHelpOptions(
        triggerCharacters: triggerCharacters,
        retriggerCharacters: retriggerCharacters,
        workDoneProgress: workDoneProgress);
  }

  /// List of characters that re-trigger signature help.
  ///
  /// These trigger characters are only active when signature help is already
  /// showing. All trigger characters are also counted as re-trigger characters.
  ///  @since 3.15.0
  final List<String> retriggerCharacters;

  /// The characters that trigger signature help automatically.
  final List<String> triggerCharacters;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (triggerCharacters != null) {
      __result['triggerCharacters'] = triggerCharacters;
    }
    if (retriggerCharacters != null) {
      __result['retriggerCharacters'] = retriggerCharacters;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('triggerCharacters');
      try {
        if (obj['triggerCharacters'] != null &&
            !((obj['triggerCharacters'] is List &&
                (obj['triggerCharacters'].every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('retriggerCharacters');
      try {
        if (obj['retriggerCharacters'] != null &&
            !((obj['retriggerCharacters'] is List &&
                (obj['retriggerCharacters']
                    .every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SignatureHelpOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SignatureHelpOptions &&
        other.runtimeType == SignatureHelpOptions) {
      return listEqual(triggerCharacters, other.triggerCharacters,
              (String a, String b) => a == b) &&
          listEqual(retriggerCharacters, other.retriggerCharacters,
              (String a, String b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(triggerCharacters));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(retriggerCharacters));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SignatureHelpParams
    implements TextDocumentPositionParams, WorkDoneProgressParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SignatureHelpParams.canParse, SignatureHelpParams.fromJson);

  SignatureHelpParams(
      {this.context,
      @required this.textDocument,
      @required this.position,
      this.workDoneToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static SignatureHelpParams fromJson(Map<String, dynamic> json) {
    final context = json['context'] != null
        ? SignatureHelpContext.fromJson(json['context'])
        : null;
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    return SignatureHelpParams(
        context: context,
        textDocument: textDocument,
        position: position,
        workDoneToken: workDoneToken);
  }

  /// The signature help context. This is only available if the client specifies
  /// to send this using the client capability
  /// `textDocument.signatureHelp.contextSupport === true`
  ///  @since 3.15.0
  final SignatureHelpContext context;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (context != null) {
      __result['context'] = context;
    }
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('context');
      try {
        if (obj['context'] != null &&
            !(SignatureHelpContext.canParse(obj['context'], reporter))) {
          reporter.reportError('must be of type SignatureHelpContext');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SignatureHelpParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SignatureHelpParams &&
        other.runtimeType == SignatureHelpParams) {
      return context == other.context &&
          textDocument == other.textDocument &&
          position == other.position &&
          workDoneToken == other.workDoneToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, context.hashCode);
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class SignatureHelpRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        SignatureHelpOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SignatureHelpRegistrationOptions.canParse,
      SignatureHelpRegistrationOptions.fromJson);

  SignatureHelpRegistrationOptions(
      {this.documentSelector,
      this.triggerCharacters,
      this.retriggerCharacters,
      this.workDoneProgress});
  static SignatureHelpRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final triggerCharacters = json['triggerCharacters']
        ?.map((item) => item)
        ?.cast<String>()
        ?.toList();
    final retriggerCharacters = json['retriggerCharacters']
        ?.map((item) => item)
        ?.cast<String>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    return SignatureHelpRegistrationOptions(
        documentSelector: documentSelector,
        triggerCharacters: triggerCharacters,
        retriggerCharacters: retriggerCharacters,
        workDoneProgress: workDoneProgress);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// List of characters that re-trigger signature help.
  ///
  /// These trigger characters are only active when signature help is already
  /// showing. All trigger characters are also counted as re-trigger characters.
  ///  @since 3.15.0
  final List<String> retriggerCharacters;

  /// The characters that trigger signature help automatically.
  final List<String> triggerCharacters;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (triggerCharacters != null) {
      __result['triggerCharacters'] = triggerCharacters;
    }
    if (retriggerCharacters != null) {
      __result['retriggerCharacters'] = retriggerCharacters;
    }
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('triggerCharacters');
      try {
        if (obj['triggerCharacters'] != null &&
            !((obj['triggerCharacters'] is List &&
                (obj['triggerCharacters'].every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('retriggerCharacters');
      try {
        if (obj['retriggerCharacters'] != null &&
            !((obj['retriggerCharacters'] is List &&
                (obj['retriggerCharacters']
                    .every((item) => item is String))))) {
          reporter.reportError('must be of type List<String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SignatureHelpRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SignatureHelpRegistrationOptions &&
        other.runtimeType == SignatureHelpRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          listEqual(triggerCharacters, other.triggerCharacters,
              (String a, String b) => a == b) &&
          listEqual(retriggerCharacters, other.retriggerCharacters,
              (String a, String b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(triggerCharacters));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(retriggerCharacters));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// How a signature help was triggered.
///  @since 3.15.0
class SignatureHelpTriggerKind {
  const SignatureHelpTriggerKind(this._value);
  const SignatureHelpTriggerKind.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// Signature help was invoked manually by the user or by a command.
  static const Invoked = SignatureHelpTriggerKind(1);

  /// Signature help was triggered by a trigger character.
  static const TriggerCharacter = SignatureHelpTriggerKind(2);

  /// Signature help was triggered by the cursor moving or by the document
  /// content changing.
  static const ContentChange = SignatureHelpTriggerKind(3);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) =>
      o is SignatureHelpTriggerKind && o._value == _value;
}

/// Represents the signature of something callable. A signature can have a
/// label, like a function-name, a doc-comment, and a set of parameters.
class SignatureInformation implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      SignatureInformation.canParse, SignatureInformation.fromJson);

  SignatureInformation(
      {@required this.label, this.documentation, this.parameters}) {
    if (label == null) {
      throw 'label is required but was not provided';
    }
  }
  static SignatureInformation fromJson(Map<String, dynamic> json) {
    final label = json['label'];
    final documentation = json['documentation'] is String
        ? Either2<String, MarkupContent>.t1(json['documentation'])
        : (MarkupContent.canParse(json['documentation'], nullLspJsonReporter)
            ? Either2<String, MarkupContent>.t2(json['documentation'] != null
                ? MarkupContent.fromJson(json['documentation'])
                : null)
            : (json['documentation'] == null
                ? null
                : (throw '''${json['documentation']} was not one of (String, MarkupContent)''')));
    final parameters = json['parameters']
        ?.map(
            (item) => item != null ? ParameterInformation.fromJson(item) : null)
        ?.cast<ParameterInformation>()
        ?.toList();
    return SignatureInformation(
        label: label, documentation: documentation, parameters: parameters);
  }

  /// The human-readable doc-comment of this signature. Will be shown in the UI
  /// but can be omitted.
  final Either2<String, MarkupContent> documentation;

  /// The label of this signature. Will be shown in the UI.
  final String label;

  /// The parameters of this signature.
  final List<ParameterInformation> parameters;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['label'] = label ?? (throw 'label is required but was not set');
    if (documentation != null) {
      __result['documentation'] = documentation;
    }
    if (parameters != null) {
      __result['parameters'] = parameters;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('label');
      try {
        if (!obj.containsKey('label')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['label'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['label'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentation');
      try {
        if (obj['documentation'] != null &&
            !((obj['documentation'] is String ||
                MarkupContent.canParse(obj['documentation'], reporter)))) {
          reporter
              .reportError('must be of type Either2<String, MarkupContent>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('parameters');
      try {
        if (obj['parameters'] != null &&
            !((obj['parameters'] is List &&
                (obj['parameters'].every((item) =>
                    ParameterInformation.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<ParameterInformation>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SignatureInformation');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SignatureInformation &&
        other.runtimeType == SignatureInformation) {
      return label == other.label &&
          documentation == other.documentation &&
          listEqual(parameters, other.parameters,
              (ParameterInformation a, ParameterInformation b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, label.hashCode);
    hash = JenkinsSmiHash.combine(hash, documentation.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(parameters));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Static registration options to be returned in the initialize request.
class StaticRegistrationOptions implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      StaticRegistrationOptions.canParse, StaticRegistrationOptions.fromJson);

  StaticRegistrationOptions({this.id});
  static StaticRegistrationOptions fromJson(Map<String, dynamic> json) {
    if (DeclarationRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DeclarationRegistrationOptions.fromJson(json);
    }
    if (TypeDefinitionRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return TypeDefinitionRegistrationOptions.fromJson(json);
    }
    if (ImplementationRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return ImplementationRegistrationOptions.fromJson(json);
    }
    if (DocumentColorRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentColorRegistrationOptions.fromJson(json);
    }
    if (FoldingRangeRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return FoldingRangeRegistrationOptions.fromJson(json);
    }
    if (SelectionRangeRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return SelectionRangeRegistrationOptions.fromJson(json);
    }
    final id = json['id'];
    return StaticRegistrationOptions(id: id);
  }

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String id;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (id != null) {
      __result['id'] = id;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('id');
      try {
        if (obj['id'] != null && !(obj['id'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type StaticRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is StaticRegistrationOptions &&
        other.runtimeType == StaticRegistrationOptions) {
      return id == other.id && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Represents information about programming constructs like variables, classes,
/// interfaces etc.
class SymbolInformation implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(SymbolInformation.canParse, SymbolInformation.fromJson);

  SymbolInformation(
      {@required this.name,
      @required this.kind,
      this.deprecated,
      @required this.location,
      this.containerName}) {
    if (name == null) {
      throw 'name is required but was not provided';
    }
    if (kind == null) {
      throw 'kind is required but was not provided';
    }
    if (location == null) {
      throw 'location is required but was not provided';
    }
  }
  static SymbolInformation fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final kind =
        json['kind'] != null ? SymbolKind.fromJson(json['kind']) : null;
    final deprecated = json['deprecated'];
    final location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    final containerName = json['containerName'];
    return SymbolInformation(
        name: name,
        kind: kind,
        deprecated: deprecated,
        location: location,
        containerName: containerName);
  }

  /// The name of the symbol containing this symbol. This information is for
  /// user interface purposes (e.g. to render a qualifier in the user interface
  /// if necessary). It can't be used to re-infer a hierarchy for the document
  /// symbols.
  final String containerName;

  /// Indicates if this symbol is deprecated.
  final bool deprecated;

  /// The kind of this symbol.
  final SymbolKind kind;

  /// The location of this symbol. The location's range is used by a tool to
  /// reveal the location in the editor. If the symbol is selected in the tool
  /// the range's start information is used to position the cursor. So the range
  /// usually spans more then the actual symbol's name and does normally include
  /// things like visibility modifiers.
  ///
  /// The range doesn't have to denote a node range in the sense of a abstract
  /// syntax tree. It can therefore not be used to re-construct a hierarchy of
  /// the symbols.
  final Location location;

  /// The name of this symbol.
  final String name;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['name'] = name ?? (throw 'name is required but was not set');
    __result['kind'] = kind ?? (throw 'kind is required but was not set');
    if (deprecated != null) {
      __result['deprecated'] = deprecated;
    }
    __result['location'] =
        location ?? (throw 'location is required but was not set');
    if (containerName != null) {
      __result['containerName'] = containerName;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('name');
      try {
        if (!obj.containsKey('name')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['name'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['name'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('kind');
      try {
        if (!obj.containsKey('kind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['kind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(SymbolKind.canParse(obj['kind'], reporter))) {
          reporter.reportError('must be of type SymbolKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('deprecated');
      try {
        if (obj['deprecated'] != null && !(obj['deprecated'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('location');
      try {
        if (!obj.containsKey('location')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['location'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Location.canParse(obj['location'], reporter))) {
          reporter.reportError('must be of type Location');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('containerName');
      try {
        if (obj['containerName'] != null && !(obj['containerName'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type SymbolInformation');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is SymbolInformation && other.runtimeType == SymbolInformation) {
      return name == other.name &&
          kind == other.kind &&
          deprecated == other.deprecated &&
          location == other.location &&
          containerName == other.containerName &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, name.hashCode);
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, deprecated.hashCode);
    hash = JenkinsSmiHash.combine(hash, location.hashCode);
    hash = JenkinsSmiHash.combine(hash, containerName.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// A symbol kind.
class SymbolKind {
  const SymbolKind(this._value);
  const SymbolKind.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  static const File = SymbolKind(1);
  static const Module = SymbolKind(2);
  static const Namespace = SymbolKind(3);
  static const Package = SymbolKind(4);
  static const Class = SymbolKind(5);
  static const Method = SymbolKind(6);
  static const Property = SymbolKind(7);
  static const Field = SymbolKind(8);
  static const Constructor = SymbolKind(9);
  static const Enum = SymbolKind(10);
  static const Interface = SymbolKind(11);
  static const Function = SymbolKind(12);
  static const Variable = SymbolKind(13);
  static const Constant = SymbolKind(14);
  static const Str = SymbolKind(15);
  static const Number = SymbolKind(16);
  static const Boolean = SymbolKind(17);
  static const Array = SymbolKind(18);
  static const Obj = SymbolKind(19);
  static const Key = SymbolKind(20);
  static const Null = SymbolKind(21);
  static const EnumMember = SymbolKind(22);
  static const Struct = SymbolKind(23);
  static const Event = SymbolKind(24);
  static const Operator = SymbolKind(25);
  static const TypeParameter = SymbolKind(26);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is SymbolKind && o._value == _value;
}

/// Describe options to be used when registering for text document change
/// events.
class TextDocumentChangeRegistrationOptions
    implements TextDocumentRegistrationOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TextDocumentChangeRegistrationOptions.canParse,
      TextDocumentChangeRegistrationOptions.fromJson);

  TextDocumentChangeRegistrationOptions(
      {@required this.syncKind, this.documentSelector}) {
    if (syncKind == null) {
      throw 'syncKind is required but was not provided';
    }
  }
  static TextDocumentChangeRegistrationOptions fromJson(
      Map<String, dynamic> json) {
    final syncKind = json['syncKind'] != null
        ? TextDocumentSyncKind.fromJson(json['syncKind'])
        : null;
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    return TextDocumentChangeRegistrationOptions(
        syncKind: syncKind, documentSelector: documentSelector);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// How documents are synced to the server. See TextDocumentSyncKind.Full and
  /// TextDocumentSyncKind.Incremental.
  final TextDocumentSyncKind syncKind;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['syncKind'] =
        syncKind ?? (throw 'syncKind is required but was not set');
    __result['documentSelector'] = documentSelector;
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('syncKind');
      try {
        if (!obj.containsKey('syncKind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['syncKind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentSyncKind.canParse(obj['syncKind'], reporter))) {
          reporter.reportError('must be of type TextDocumentSyncKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter
          .reportError('must be of type TextDocumentChangeRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentChangeRegistrationOptions &&
        other.runtimeType == TextDocumentChangeRegistrationOptions) {
      return syncKind == other.syncKind &&
          listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, syncKind.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Text document specific client capabilities.
class TextDocumentClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TextDocumentClientCapabilities.canParse,
      TextDocumentClientCapabilities.fromJson);

  TextDocumentClientCapabilities(
      {this.synchronization,
      this.completion,
      this.hover,
      this.signatureHelp,
      this.declaration,
      this.definition,
      this.typeDefinition,
      this.implementation,
      this.references,
      this.documentHighlight,
      this.documentSymbol,
      this.codeAction,
      this.codeLens,
      this.documentLink,
      this.colorProvider,
      this.formatting,
      this.rangeFormatting,
      this.onTypeFormatting,
      this.rename,
      this.publishDiagnostics,
      this.foldingRange,
      this.selectionRange});
  static TextDocumentClientCapabilities fromJson(Map<String, dynamic> json) {
    final synchronization = json['synchronization'] != null
        ? TextDocumentSyncClientCapabilities.fromJson(json['synchronization'])
        : null;
    final completion = json['completion'] != null
        ? CompletionClientCapabilities.fromJson(json['completion'])
        : null;
    final hover = json['hover'] != null
        ? HoverClientCapabilities.fromJson(json['hover'])
        : null;
    final signatureHelp = json['signatureHelp'] != null
        ? SignatureHelpClientCapabilities.fromJson(json['signatureHelp'])
        : null;
    final declaration = json['declaration'] != null
        ? DeclarationClientCapabilities.fromJson(json['declaration'])
        : null;
    final definition = json['definition'] != null
        ? DefinitionClientCapabilities.fromJson(json['definition'])
        : null;
    final typeDefinition = json['typeDefinition'] != null
        ? TypeDefinitionClientCapabilities.fromJson(json['typeDefinition'])
        : null;
    final implementation = json['implementation'] != null
        ? ImplementationClientCapabilities.fromJson(json['implementation'])
        : null;
    final references = json['references'] != null
        ? ReferenceClientCapabilities.fromJson(json['references'])
        : null;
    final documentHighlight = json['documentHighlight'] != null
        ? DocumentHighlightClientCapabilities.fromJson(
            json['documentHighlight'])
        : null;
    final documentSymbol = json['documentSymbol'] != null
        ? DocumentSymbolClientCapabilities.fromJson(json['documentSymbol'])
        : null;
    final codeAction = json['codeAction'] != null
        ? CodeActionClientCapabilities.fromJson(json['codeAction'])
        : null;
    final codeLens = json['codeLens'] != null
        ? CodeLensClientCapabilities.fromJson(json['codeLens'])
        : null;
    final documentLink = json['documentLink'] != null
        ? DocumentLinkClientCapabilities.fromJson(json['documentLink'])
        : null;
    final colorProvider = json['colorProvider'] != null
        ? DocumentColorClientCapabilities.fromJson(json['colorProvider'])
        : null;
    final formatting = json['formatting'] != null
        ? DocumentFormattingClientCapabilities.fromJson(json['formatting'])
        : null;
    final rangeFormatting = json['rangeFormatting'] != null
        ? DocumentRangeFormattingClientCapabilities.fromJson(
            json['rangeFormatting'])
        : null;
    final onTypeFormatting = json['onTypeFormatting'] != null
        ? DocumentOnTypeFormattingClientCapabilities.fromJson(
            json['onTypeFormatting'])
        : null;
    final rename = json['rename'] != null
        ? RenameClientCapabilities.fromJson(json['rename'])
        : null;
    final publishDiagnostics = json['publishDiagnostics'] != null
        ? PublishDiagnosticsClientCapabilities.fromJson(
            json['publishDiagnostics'])
        : null;
    final foldingRange = json['foldingRange'] != null
        ? FoldingRangeClientCapabilities.fromJson(json['foldingRange'])
        : null;
    final selectionRange = json['selectionRange'] != null
        ? SelectionRangeClientCapabilities.fromJson(json['selectionRange'])
        : null;
    return TextDocumentClientCapabilities(
        synchronization: synchronization,
        completion: completion,
        hover: hover,
        signatureHelp: signatureHelp,
        declaration: declaration,
        definition: definition,
        typeDefinition: typeDefinition,
        implementation: implementation,
        references: references,
        documentHighlight: documentHighlight,
        documentSymbol: documentSymbol,
        codeAction: codeAction,
        codeLens: codeLens,
        documentLink: documentLink,
        colorProvider: colorProvider,
        formatting: formatting,
        rangeFormatting: rangeFormatting,
        onTypeFormatting: onTypeFormatting,
        rename: rename,
        publishDiagnostics: publishDiagnostics,
        foldingRange: foldingRange,
        selectionRange: selectionRange);
  }

  /// Capabilities specific to the `textDocument/codeAction` request.
  final CodeActionClientCapabilities codeAction;

  /// Capabilities specific to the `textDocument/codeLens` request.
  final CodeLensClientCapabilities codeLens;

  /// Capabilities specific to the `textDocument/documentColor` and the
  /// `textDocument/colorPresentation` request.
  ///  @since 3.6.0
  final DocumentColorClientCapabilities colorProvider;

  /// Capabilities specific to the `textDocument/completion` request.
  final CompletionClientCapabilities completion;

  /// Capabilities specific to the `textDocument/declaration` request.
  ///  @since 3.14.0
  final DeclarationClientCapabilities declaration;

  /// Capabilities specific to the `textDocument/definition` request.
  final DefinitionClientCapabilities definition;

  /// Capabilities specific to the `textDocument/documentHighlight` request.
  final DocumentHighlightClientCapabilities documentHighlight;

  /// Capabilities specific to the `textDocument/documentLink` request.
  final DocumentLinkClientCapabilities documentLink;

  /// Capabilities specific to the `textDocument/documentSymbol` request.
  final DocumentSymbolClientCapabilities documentSymbol;

  /// Capabilities specific to the `textDocument/foldingRange` request.
  ///  @since 3.10.0
  final FoldingRangeClientCapabilities foldingRange;

  /// Capabilities specific to the `textDocument/formatting` request.
  final DocumentFormattingClientCapabilities formatting;

  /// Capabilities specific to the `textDocument/hover` request.
  final HoverClientCapabilities hover;

  /// Capabilities specific to the `textDocument/implementation` request.
  ///  @since 3.6.0
  final ImplementationClientCapabilities implementation;

  /// request. Capabilities specific to the `textDocument/onTypeFormatting`
  /// request.
  final DocumentOnTypeFormattingClientCapabilities onTypeFormatting;

  /// Capabilities specific to the `textDocument/publishDiagnostics`
  /// notification.
  final PublishDiagnosticsClientCapabilities publishDiagnostics;

  /// Capabilities specific to the `textDocument/rangeFormatting` request.
  final DocumentRangeFormattingClientCapabilities rangeFormatting;

  /// Capabilities specific to the `textDocument/references` request.
  final ReferenceClientCapabilities references;

  /// Capabilities specific to the `textDocument/rename` request.
  final RenameClientCapabilities rename;

  /// Capabilities specific to the `textDocument/selectionRange` request.
  ///  @since 3.15.0
  final SelectionRangeClientCapabilities selectionRange;

  /// Capabilities specific to the `textDocument/signatureHelp` request.
  final SignatureHelpClientCapabilities signatureHelp;
  final TextDocumentSyncClientCapabilities synchronization;

  /// Capabilities specific to the `textDocument/typeDefinition` request.
  ///  @since 3.6.0
  final TypeDefinitionClientCapabilities typeDefinition;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (synchronization != null) {
      __result['synchronization'] = synchronization;
    }
    if (completion != null) {
      __result['completion'] = completion;
    }
    if (hover != null) {
      __result['hover'] = hover;
    }
    if (signatureHelp != null) {
      __result['signatureHelp'] = signatureHelp;
    }
    if (declaration != null) {
      __result['declaration'] = declaration;
    }
    if (definition != null) {
      __result['definition'] = definition;
    }
    if (typeDefinition != null) {
      __result['typeDefinition'] = typeDefinition;
    }
    if (implementation != null) {
      __result['implementation'] = implementation;
    }
    if (references != null) {
      __result['references'] = references;
    }
    if (documentHighlight != null) {
      __result['documentHighlight'] = documentHighlight;
    }
    if (documentSymbol != null) {
      __result['documentSymbol'] = documentSymbol;
    }
    if (codeAction != null) {
      __result['codeAction'] = codeAction;
    }
    if (codeLens != null) {
      __result['codeLens'] = codeLens;
    }
    if (documentLink != null) {
      __result['documentLink'] = documentLink;
    }
    if (colorProvider != null) {
      __result['colorProvider'] = colorProvider;
    }
    if (formatting != null) {
      __result['formatting'] = formatting;
    }
    if (rangeFormatting != null) {
      __result['rangeFormatting'] = rangeFormatting;
    }
    if (onTypeFormatting != null) {
      __result['onTypeFormatting'] = onTypeFormatting;
    }
    if (rename != null) {
      __result['rename'] = rename;
    }
    if (publishDiagnostics != null) {
      __result['publishDiagnostics'] = publishDiagnostics;
    }
    if (foldingRange != null) {
      __result['foldingRange'] = foldingRange;
    }
    if (selectionRange != null) {
      __result['selectionRange'] = selectionRange;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('synchronization');
      try {
        if (obj['synchronization'] != null &&
            !(TextDocumentSyncClientCapabilities.canParse(
                obj['synchronization'], reporter))) {
          reporter.reportError(
              'must be of type TextDocumentSyncClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('completion');
      try {
        if (obj['completion'] != null &&
            !(CompletionClientCapabilities.canParse(
                obj['completion'], reporter))) {
          reporter.reportError('must be of type CompletionClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('hover');
      try {
        if (obj['hover'] != null &&
            !(HoverClientCapabilities.canParse(obj['hover'], reporter))) {
          reporter.reportError('must be of type HoverClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('signatureHelp');
      try {
        if (obj['signatureHelp'] != null &&
            !(SignatureHelpClientCapabilities.canParse(
                obj['signatureHelp'], reporter))) {
          reporter
              .reportError('must be of type SignatureHelpClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('declaration');
      try {
        if (obj['declaration'] != null &&
            !(DeclarationClientCapabilities.canParse(
                obj['declaration'], reporter))) {
          reporter.reportError('must be of type DeclarationClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('definition');
      try {
        if (obj['definition'] != null &&
            !(DefinitionClientCapabilities.canParse(
                obj['definition'], reporter))) {
          reporter.reportError('must be of type DefinitionClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('typeDefinition');
      try {
        if (obj['typeDefinition'] != null &&
            !(TypeDefinitionClientCapabilities.canParse(
                obj['typeDefinition'], reporter))) {
          reporter
              .reportError('must be of type TypeDefinitionClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('implementation');
      try {
        if (obj['implementation'] != null &&
            !(ImplementationClientCapabilities.canParse(
                obj['implementation'], reporter))) {
          reporter
              .reportError('must be of type ImplementationClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('references');
      try {
        if (obj['references'] != null &&
            !(ReferenceClientCapabilities.canParse(
                obj['references'], reporter))) {
          reporter.reportError('must be of type ReferenceClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentHighlight');
      try {
        if (obj['documentHighlight'] != null &&
            !(DocumentHighlightClientCapabilities.canParse(
                obj['documentHighlight'], reporter))) {
          reporter.reportError(
              'must be of type DocumentHighlightClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentSymbol');
      try {
        if (obj['documentSymbol'] != null &&
            !(DocumentSymbolClientCapabilities.canParse(
                obj['documentSymbol'], reporter))) {
          reporter
              .reportError('must be of type DocumentSymbolClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('codeAction');
      try {
        if (obj['codeAction'] != null &&
            !(CodeActionClientCapabilities.canParse(
                obj['codeAction'], reporter))) {
          reporter.reportError('must be of type CodeActionClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('codeLens');
      try {
        if (obj['codeLens'] != null &&
            !(CodeLensClientCapabilities.canParse(obj['codeLens'], reporter))) {
          reporter.reportError('must be of type CodeLensClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentLink');
      try {
        if (obj['documentLink'] != null &&
            !(DocumentLinkClientCapabilities.canParse(
                obj['documentLink'], reporter))) {
          reporter
              .reportError('must be of type DocumentLinkClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('colorProvider');
      try {
        if (obj['colorProvider'] != null &&
            !(DocumentColorClientCapabilities.canParse(
                obj['colorProvider'], reporter))) {
          reporter
              .reportError('must be of type DocumentColorClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('formatting');
      try {
        if (obj['formatting'] != null &&
            !(DocumentFormattingClientCapabilities.canParse(
                obj['formatting'], reporter))) {
          reporter.reportError(
              'must be of type DocumentFormattingClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('rangeFormatting');
      try {
        if (obj['rangeFormatting'] != null &&
            !(DocumentRangeFormattingClientCapabilities.canParse(
                obj['rangeFormatting'], reporter))) {
          reporter.reportError(
              'must be of type DocumentRangeFormattingClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('onTypeFormatting');
      try {
        if (obj['onTypeFormatting'] != null &&
            !(DocumentOnTypeFormattingClientCapabilities.canParse(
                obj['onTypeFormatting'], reporter))) {
          reporter.reportError(
              'must be of type DocumentOnTypeFormattingClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('rename');
      try {
        if (obj['rename'] != null &&
            !(RenameClientCapabilities.canParse(obj['rename'], reporter))) {
          reporter.reportError('must be of type RenameClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('publishDiagnostics');
      try {
        if (obj['publishDiagnostics'] != null &&
            !(PublishDiagnosticsClientCapabilities.canParse(
                obj['publishDiagnostics'], reporter))) {
          reporter.reportError(
              'must be of type PublishDiagnosticsClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('foldingRange');
      try {
        if (obj['foldingRange'] != null &&
            !(FoldingRangeClientCapabilities.canParse(
                obj['foldingRange'], reporter))) {
          reporter
              .reportError('must be of type FoldingRangeClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('selectionRange');
      try {
        if (obj['selectionRange'] != null &&
            !(SelectionRangeClientCapabilities.canParse(
                obj['selectionRange'], reporter))) {
          reporter
              .reportError('must be of type SelectionRangeClientCapabilities');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TextDocumentClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentClientCapabilities &&
        other.runtimeType == TextDocumentClientCapabilities) {
      return synchronization == other.synchronization &&
          completion == other.completion &&
          hover == other.hover &&
          signatureHelp == other.signatureHelp &&
          declaration == other.declaration &&
          definition == other.definition &&
          typeDefinition == other.typeDefinition &&
          implementation == other.implementation &&
          references == other.references &&
          documentHighlight == other.documentHighlight &&
          documentSymbol == other.documentSymbol &&
          codeAction == other.codeAction &&
          codeLens == other.codeLens &&
          documentLink == other.documentLink &&
          colorProvider == other.colorProvider &&
          formatting == other.formatting &&
          rangeFormatting == other.rangeFormatting &&
          onTypeFormatting == other.onTypeFormatting &&
          rename == other.rename &&
          publishDiagnostics == other.publishDiagnostics &&
          foldingRange == other.foldingRange &&
          selectionRange == other.selectionRange &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, synchronization.hashCode);
    hash = JenkinsSmiHash.combine(hash, completion.hashCode);
    hash = JenkinsSmiHash.combine(hash, hover.hashCode);
    hash = JenkinsSmiHash.combine(hash, signatureHelp.hashCode);
    hash = JenkinsSmiHash.combine(hash, declaration.hashCode);
    hash = JenkinsSmiHash.combine(hash, definition.hashCode);
    hash = JenkinsSmiHash.combine(hash, typeDefinition.hashCode);
    hash = JenkinsSmiHash.combine(hash, implementation.hashCode);
    hash = JenkinsSmiHash.combine(hash, references.hashCode);
    hash = JenkinsSmiHash.combine(hash, documentHighlight.hashCode);
    hash = JenkinsSmiHash.combine(hash, documentSymbol.hashCode);
    hash = JenkinsSmiHash.combine(hash, codeAction.hashCode);
    hash = JenkinsSmiHash.combine(hash, codeLens.hashCode);
    hash = JenkinsSmiHash.combine(hash, documentLink.hashCode);
    hash = JenkinsSmiHash.combine(hash, colorProvider.hashCode);
    hash = JenkinsSmiHash.combine(hash, formatting.hashCode);
    hash = JenkinsSmiHash.combine(hash, rangeFormatting.hashCode);
    hash = JenkinsSmiHash.combine(hash, onTypeFormatting.hashCode);
    hash = JenkinsSmiHash.combine(hash, rename.hashCode);
    hash = JenkinsSmiHash.combine(hash, publishDiagnostics.hashCode);
    hash = JenkinsSmiHash.combine(hash, foldingRange.hashCode);
    hash = JenkinsSmiHash.combine(hash, selectionRange.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TextDocumentContentChangeEvent1 implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TextDocumentContentChangeEvent1.canParse,
      TextDocumentContentChangeEvent1.fromJson);

  TextDocumentContentChangeEvent1(
      {@required this.range, this.rangeLength, @required this.text}) {
    if (range == null) {
      throw 'range is required but was not provided';
    }
    if (text == null) {
      throw 'text is required but was not provided';
    }
  }
  static TextDocumentContentChangeEvent1 fromJson(Map<String, dynamic> json) {
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final rangeLength = json['rangeLength'];
    final text = json['text'];
    return TextDocumentContentChangeEvent1(
        range: range, rangeLength: rangeLength, text: text);
  }

  /// The range of the document that changed.
  final Range range;

  /// The optional length of the range that got replaced.
  ///  @deprecated use range instead.
  @core.deprecated
  final num rangeLength;

  /// The new text for the provided range.
  final String text;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['range'] = range ?? (throw 'range is required but was not set');
    if (rangeLength != null) {
      __result['rangeLength'] = rangeLength;
    }
    __result['text'] = text ?? (throw 'text is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('rangeLength');
      try {
        if (obj['rangeLength'] != null && !(obj['rangeLength'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('text');
      try {
        if (!obj.containsKey('text')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['text'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['text'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TextDocumentContentChangeEvent1');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentContentChangeEvent1 &&
        other.runtimeType == TextDocumentContentChangeEvent1) {
      return range == other.range &&
          rangeLength == other.rangeLength &&
          text == other.text &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, rangeLength.hashCode);
    hash = JenkinsSmiHash.combine(hash, text.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TextDocumentContentChangeEvent2 implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TextDocumentContentChangeEvent2.canParse,
      TextDocumentContentChangeEvent2.fromJson);

  TextDocumentContentChangeEvent2({@required this.text}) {
    if (text == null) {
      throw 'text is required but was not provided';
    }
  }
  static TextDocumentContentChangeEvent2 fromJson(Map<String, dynamic> json) {
    final text = json['text'];
    return TextDocumentContentChangeEvent2(text: text);
  }

  /// The new text of the whole document.
  final String text;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['text'] = text ?? (throw 'text is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('text');
      try {
        if (!obj.containsKey('text')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['text'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['text'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TextDocumentContentChangeEvent2');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentContentChangeEvent2 &&
        other.runtimeType == TextDocumentContentChangeEvent2) {
      return text == other.text && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, text.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TextDocumentEdit implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(TextDocumentEdit.canParse, TextDocumentEdit.fromJson);

  TextDocumentEdit({@required this.textDocument, @required this.edits}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (edits == null) {
      throw 'edits is required but was not provided';
    }
  }
  static TextDocumentEdit fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? VersionedTextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final edits = json['edits']
        ?.map((item) => item != null ? TextEdit.fromJson(item) : null)
        ?.cast<TextEdit>()
        ?.toList();
    return TextDocumentEdit(textDocument: textDocument, edits: edits);
  }

  /// The edits to be applied.
  final List<TextEdit> edits;

  /// The text document to change.
  final VersionedTextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['edits'] = edits ?? (throw 'edits is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(VersionedTextDocumentIdentifier.canParse(
            obj['textDocument'], reporter))) {
          reporter
              .reportError('must be of type VersionedTextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('edits');
      try {
        if (!obj.containsKey('edits')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['edits'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['edits'] is List &&
            (obj['edits']
                .every((item) => TextEdit.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<TextEdit>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TextDocumentEdit');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentEdit && other.runtimeType == TextDocumentEdit) {
      return textDocument == other.textDocument &&
          listEqual(edits, other.edits, (TextEdit a, TextEdit b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(edits));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TextDocumentIdentifier implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TextDocumentIdentifier.canParse, TextDocumentIdentifier.fromJson);

  TextDocumentIdentifier({@required this.uri}) {
    if (uri == null) {
      throw 'uri is required but was not provided';
    }
  }
  static TextDocumentIdentifier fromJson(Map<String, dynamic> json) {
    if (VersionedTextDocumentIdentifier.canParse(json, nullLspJsonReporter)) {
      return VersionedTextDocumentIdentifier.fromJson(json);
    }
    final uri = json['uri'];
    return TextDocumentIdentifier(uri: uri);
  }

  /// The text document's URI.
  final String uri;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['uri'] = uri ?? (throw 'uri is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('uri');
      try {
        if (!obj.containsKey('uri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['uri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['uri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TextDocumentIdentifier');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentIdentifier &&
        other.runtimeType == TextDocumentIdentifier) {
      return uri == other.uri && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, uri.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TextDocumentItem implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(TextDocumentItem.canParse, TextDocumentItem.fromJson);

  TextDocumentItem(
      {@required this.uri,
      @required this.languageId,
      @required this.version,
      @required this.text}) {
    if (uri == null) {
      throw 'uri is required but was not provided';
    }
    if (languageId == null) {
      throw 'languageId is required but was not provided';
    }
    if (version == null) {
      throw 'version is required but was not provided';
    }
    if (text == null) {
      throw 'text is required but was not provided';
    }
  }
  static TextDocumentItem fromJson(Map<String, dynamic> json) {
    final uri = json['uri'];
    final languageId = json['languageId'];
    final version = json['version'];
    final text = json['text'];
    return TextDocumentItem(
        uri: uri, languageId: languageId, version: version, text: text);
  }

  /// The text document's language identifier.
  final String languageId;

  /// The content of the opened text document.
  final String text;

  /// The text document's URI.
  final String uri;

  /// The version number of this document (it will increase after each change,
  /// including undo/redo).
  final num version;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['uri'] = uri ?? (throw 'uri is required but was not set');
    __result['languageId'] =
        languageId ?? (throw 'languageId is required but was not set');
    __result['version'] =
        version ?? (throw 'version is required but was not set');
    __result['text'] = text ?? (throw 'text is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('uri');
      try {
        if (!obj.containsKey('uri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['uri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['uri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('languageId');
      try {
        if (!obj.containsKey('languageId')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['languageId'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['languageId'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('version');
      try {
        if (!obj.containsKey('version')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['version'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['version'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('text');
      try {
        if (!obj.containsKey('text')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['text'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['text'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TextDocumentItem');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentItem && other.runtimeType == TextDocumentItem) {
      return uri == other.uri &&
          languageId == other.languageId &&
          version == other.version &&
          text == other.text &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, uri.hashCode);
    hash = JenkinsSmiHash.combine(hash, languageId.hashCode);
    hash = JenkinsSmiHash.combine(hash, version.hashCode);
    hash = JenkinsSmiHash.combine(hash, text.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TextDocumentPositionParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TextDocumentPositionParams.canParse, TextDocumentPositionParams.fromJson);

  TextDocumentPositionParams(
      {@required this.textDocument, @required this.position}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static TextDocumentPositionParams fromJson(Map<String, dynamic> json) {
    if (CompletionParams.canParse(json, nullLspJsonReporter)) {
      return CompletionParams.fromJson(json);
    }
    if (HoverParams.canParse(json, nullLspJsonReporter)) {
      return HoverParams.fromJson(json);
    }
    if (SignatureHelpParams.canParse(json, nullLspJsonReporter)) {
      return SignatureHelpParams.fromJson(json);
    }
    if (DeclarationParams.canParse(json, nullLspJsonReporter)) {
      return DeclarationParams.fromJson(json);
    }
    if (DefinitionParams.canParse(json, nullLspJsonReporter)) {
      return DefinitionParams.fromJson(json);
    }
    if (TypeDefinitionParams.canParse(json, nullLspJsonReporter)) {
      return TypeDefinitionParams.fromJson(json);
    }
    if (ImplementationParams.canParse(json, nullLspJsonReporter)) {
      return ImplementationParams.fromJson(json);
    }
    if (ReferenceParams.canParse(json, nullLspJsonReporter)) {
      return ReferenceParams.fromJson(json);
    }
    if (DocumentHighlightParams.canParse(json, nullLspJsonReporter)) {
      return DocumentHighlightParams.fromJson(json);
    }
    if (DocumentOnTypeFormattingParams.canParse(json, nullLspJsonReporter)) {
      return DocumentOnTypeFormattingParams.fromJson(json);
    }
    if (RenameParams.canParse(json, nullLspJsonReporter)) {
      return RenameParams.fromJson(json);
    }
    if (PrepareRenameParams.canParse(json, nullLspJsonReporter)) {
      return PrepareRenameParams.fromJson(json);
    }
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    return TextDocumentPositionParams(
        textDocument: textDocument, position: position);
  }

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TextDocumentPositionParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentPositionParams &&
        other.runtimeType == TextDocumentPositionParams) {
      return textDocument == other.textDocument &&
          position == other.position &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// General text document registration options.
class TextDocumentRegistrationOptions implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TextDocumentRegistrationOptions.canParse,
      TextDocumentRegistrationOptions.fromJson);

  TextDocumentRegistrationOptions({this.documentSelector});
  static TextDocumentRegistrationOptions fromJson(Map<String, dynamic> json) {
    if (TextDocumentChangeRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return TextDocumentChangeRegistrationOptions.fromJson(json);
    }
    if (TextDocumentSaveRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return TextDocumentSaveRegistrationOptions.fromJson(json);
    }
    if (CompletionRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return CompletionRegistrationOptions.fromJson(json);
    }
    if (HoverRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return HoverRegistrationOptions.fromJson(json);
    }
    if (SignatureHelpRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return SignatureHelpRegistrationOptions.fromJson(json);
    }
    if (DeclarationRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DeclarationRegistrationOptions.fromJson(json);
    }
    if (DefinitionRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DefinitionRegistrationOptions.fromJson(json);
    }
    if (TypeDefinitionRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return TypeDefinitionRegistrationOptions.fromJson(json);
    }
    if (ImplementationRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return ImplementationRegistrationOptions.fromJson(json);
    }
    if (ReferenceRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return ReferenceRegistrationOptions.fromJson(json);
    }
    if (DocumentHighlightRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return DocumentHighlightRegistrationOptions.fromJson(json);
    }
    if (DocumentSymbolRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentSymbolRegistrationOptions.fromJson(json);
    }
    if (CodeActionRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return CodeActionRegistrationOptions.fromJson(json);
    }
    if (CodeLensRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return CodeLensRegistrationOptions.fromJson(json);
    }
    if (DocumentLinkRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentLinkRegistrationOptions.fromJson(json);
    }
    if (DocumentColorRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentColorRegistrationOptions.fromJson(json);
    }
    if (DocumentFormattingRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return DocumentFormattingRegistrationOptions.fromJson(json);
    }
    if (DocumentRangeFormattingRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return DocumentRangeFormattingRegistrationOptions.fromJson(json);
    }
    if (DocumentOnTypeFormattingRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return DocumentOnTypeFormattingRegistrationOptions.fromJson(json);
    }
    if (RenameRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return RenameRegistrationOptions.fromJson(json);
    }
    if (FoldingRangeRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return FoldingRangeRegistrationOptions.fromJson(json);
    }
    if (SelectionRangeRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return SelectionRangeRegistrationOptions.fromJson(json);
    }
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    return TextDocumentRegistrationOptions(documentSelector: documentSelector);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TextDocumentRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentRegistrationOptions &&
        other.runtimeType == TextDocumentRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Represents reasons why a text document is saved.
class TextDocumentSaveReason {
  const TextDocumentSaveReason(this._value);
  const TextDocumentSaveReason.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// Manually triggered, e.g. by the user pressing save, by starting debugging,
  /// or by an API call.
  static const Manual = TextDocumentSaveReason(1);

  /// Automatic after a delay.
  static const AfterDelay = TextDocumentSaveReason(2);

  /// When the editor lost focus.
  static const FocusOut = TextDocumentSaveReason(3);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) =>
      o is TextDocumentSaveReason && o._value == _value;
}

class TextDocumentSaveRegistrationOptions
    implements TextDocumentRegistrationOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TextDocumentSaveRegistrationOptions.canParse,
      TextDocumentSaveRegistrationOptions.fromJson);

  TextDocumentSaveRegistrationOptions(
      {this.includeText, this.documentSelector});
  static TextDocumentSaveRegistrationOptions fromJson(
      Map<String, dynamic> json) {
    final includeText = json['includeText'];
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    return TextDocumentSaveRegistrationOptions(
        includeText: includeText, documentSelector: documentSelector);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// The client is supposed to include the content on save.
  final bool includeText;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (includeText != null) {
      __result['includeText'] = includeText;
    }
    __result['documentSelector'] = documentSelector;
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('includeText');
      try {
        if (obj['includeText'] != null && !(obj['includeText'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter
          .reportError('must be of type TextDocumentSaveRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentSaveRegistrationOptions &&
        other.runtimeType == TextDocumentSaveRegistrationOptions) {
      return includeText == other.includeText &&
          listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, includeText.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TextDocumentSyncClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TextDocumentSyncClientCapabilities.canParse,
      TextDocumentSyncClientCapabilities.fromJson);

  TextDocumentSyncClientCapabilities(
      {this.dynamicRegistration,
      this.willSave,
      this.willSaveWaitUntil,
      this.didSave});
  static TextDocumentSyncClientCapabilities fromJson(
      Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final willSave = json['willSave'];
    final willSaveWaitUntil = json['willSaveWaitUntil'];
    final didSave = json['didSave'];
    return TextDocumentSyncClientCapabilities(
        dynamicRegistration: dynamicRegistration,
        willSave: willSave,
        willSaveWaitUntil: willSaveWaitUntil,
        didSave: didSave);
  }

  /// The client supports did save notifications.
  final bool didSave;

  /// Whether text document synchronization supports dynamic registration.
  final bool dynamicRegistration;

  /// The client supports sending will save notifications.
  final bool willSave;

  /// The client supports sending a will save request and waits for a response
  /// providing text edits which will be applied to the document before it is
  /// saved.
  final bool willSaveWaitUntil;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (willSave != null) {
      __result['willSave'] = willSave;
    }
    if (willSaveWaitUntil != null) {
      __result['willSaveWaitUntil'] = willSaveWaitUntil;
    }
    if (didSave != null) {
      __result['didSave'] = didSave;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('willSave');
      try {
        if (obj['willSave'] != null && !(obj['willSave'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('willSaveWaitUntil');
      try {
        if (obj['willSaveWaitUntil'] != null &&
            !(obj['willSaveWaitUntil'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('didSave');
      try {
        if (obj['didSave'] != null && !(obj['didSave'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter
          .reportError('must be of type TextDocumentSyncClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentSyncClientCapabilities &&
        other.runtimeType == TextDocumentSyncClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          willSave == other.willSave &&
          willSaveWaitUntil == other.willSaveWaitUntil &&
          didSave == other.didSave &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, willSave.hashCode);
    hash = JenkinsSmiHash.combine(hash, willSaveWaitUntil.hashCode);
    hash = JenkinsSmiHash.combine(hash, didSave.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// Defines how the host (editor) should sync document changes to the language
/// server.
class TextDocumentSyncKind {
  const TextDocumentSyncKind(this._value);
  const TextDocumentSyncKind.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// Documents should not be synced at all.
  static const None = TextDocumentSyncKind(0);

  /// Documents are synced by always sending the full content of the document.
  static const Full = TextDocumentSyncKind(1);

  /// Documents are synced by sending the full content on open. After that only
  /// incremental updates to the document are send.
  static const Incremental = TextDocumentSyncKind(2);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is TextDocumentSyncKind && o._value == _value;
}

class TextDocumentSyncOptions implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TextDocumentSyncOptions.canParse, TextDocumentSyncOptions.fromJson);

  TextDocumentSyncOptions(
      {this.openClose,
      this.change,
      this.willSave,
      this.willSaveWaitUntil,
      this.save});
  static TextDocumentSyncOptions fromJson(Map<String, dynamic> json) {
    final openClose = json['openClose'];
    final change = json['change'] != null
        ? TextDocumentSyncKind.fromJson(json['change'])
        : null;
    final willSave = json['willSave'];
    final willSaveWaitUntil = json['willSaveWaitUntil'];
    final save = json['save'] is bool
        ? Either2<bool, SaveOptions>.t1(json['save'])
        : (SaveOptions.canParse(json['save'], nullLspJsonReporter)
            ? Either2<bool, SaveOptions>.t2(json['save'] != null
                ? SaveOptions.fromJson(json['save'])
                : null)
            : (json['save'] == null
                ? null
                : (throw '''${json['save']} was not one of (bool, SaveOptions)''')));
    return TextDocumentSyncOptions(
        openClose: openClose,
        change: change,
        willSave: willSave,
        willSaveWaitUntil: willSaveWaitUntil,
        save: save);
  }

  /// Change notifications are sent to the server. See
  /// TextDocumentSyncKind.None, TextDocumentSyncKind.Full and
  /// TextDocumentSyncKind.Incremental. If omitted it defaults to
  /// TextDocumentSyncKind.None.
  final TextDocumentSyncKind change;

  /// Open and close notifications are sent to the server. If omitted open close
  /// notification should not be sent.
  final bool openClose;

  /// If present save notifications are sent to the server. If omitted the
  /// notification should not be sent.
  final Either2<bool, SaveOptions> save;

  /// If present will save notifications are sent to the server. If omitted the
  /// notification should not be sent.
  final bool willSave;

  /// If present will save wait until requests are sent to the server. If
  /// omitted the request should not be sent.
  final bool willSaveWaitUntil;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (openClose != null) {
      __result['openClose'] = openClose;
    }
    if (change != null) {
      __result['change'] = change;
    }
    if (willSave != null) {
      __result['willSave'] = willSave;
    }
    if (willSaveWaitUntil != null) {
      __result['willSaveWaitUntil'] = willSaveWaitUntil;
    }
    if (save != null) {
      __result['save'] = save;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('openClose');
      try {
        if (obj['openClose'] != null && !(obj['openClose'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('change');
      try {
        if (obj['change'] != null &&
            !(TextDocumentSyncKind.canParse(obj['change'], reporter))) {
          reporter.reportError('must be of type TextDocumentSyncKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('willSave');
      try {
        if (obj['willSave'] != null && !(obj['willSave'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('willSaveWaitUntil');
      try {
        if (obj['willSaveWaitUntil'] != null &&
            !(obj['willSaveWaitUntil'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('save');
      try {
        if (obj['save'] != null &&
            !((obj['save'] is bool ||
                SaveOptions.canParse(obj['save'], reporter)))) {
          reporter.reportError('must be of type Either2<bool, SaveOptions>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TextDocumentSyncOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextDocumentSyncOptions &&
        other.runtimeType == TextDocumentSyncOptions) {
      return openClose == other.openClose &&
          change == other.change &&
          willSave == other.willSave &&
          willSaveWaitUntil == other.willSaveWaitUntil &&
          save == other.save &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, openClose.hashCode);
    hash = JenkinsSmiHash.combine(hash, change.hashCode);
    hash = JenkinsSmiHash.combine(hash, willSave.hashCode);
    hash = JenkinsSmiHash.combine(hash, willSaveWaitUntil.hashCode);
    hash = JenkinsSmiHash.combine(hash, save.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TextEdit implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(TextEdit.canParse, TextEdit.fromJson);

  TextEdit({@required this.range, @required this.newText}) {
    if (range == null) {
      throw 'range is required but was not provided';
    }
    if (newText == null) {
      throw 'newText is required but was not provided';
    }
  }
  static TextEdit fromJson(Map<String, dynamic> json) {
    final range = json['range'] != null ? Range.fromJson(json['range']) : null;
    final newText = json['newText'];
    return TextEdit(range: range, newText: newText);
  }

  /// The string to be inserted. For delete operations use an empty string.
  final String newText;

  /// The range of the text document to be manipulated. To insert text into a
  /// document create a range where start === end.
  final Range range;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['range'] = range ?? (throw 'range is required but was not set');
    __result['newText'] =
        newText ?? (throw 'newText is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('range');
      try {
        if (!obj.containsKey('range')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['range'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Range.canParse(obj['range'], reporter))) {
          reporter.reportError('must be of type Range');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('newText');
      try {
        if (!obj.containsKey('newText')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['newText'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['newText'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TextEdit');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TextEdit && other.runtimeType == TextEdit) {
      return range == other.range && newText == other.newText && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, range.hashCode);
    hash = JenkinsSmiHash.combine(hash, newText.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TypeDefinitionClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TypeDefinitionClientCapabilities.canParse,
      TypeDefinitionClientCapabilities.fromJson);

  TypeDefinitionClientCapabilities(
      {this.dynamicRegistration, this.linkSupport});
  static TypeDefinitionClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final linkSupport = json['linkSupport'];
    return TypeDefinitionClientCapabilities(
        dynamicRegistration: dynamicRegistration, linkSupport: linkSupport);
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `TypeDefinitionRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  ///  @since 3.14.0
  final bool linkSupport;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (linkSupport != null) {
      __result['linkSupport'] = linkSupport;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('linkSupport');
      try {
        if (obj['linkSupport'] != null && !(obj['linkSupport'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TypeDefinitionClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TypeDefinitionClientCapabilities &&
        other.runtimeType == TypeDefinitionClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          linkSupport == other.linkSupport &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, linkSupport.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TypeDefinitionOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TypeDefinitionOptions.canParse, TypeDefinitionOptions.fromJson);

  TypeDefinitionOptions({this.workDoneProgress});
  static TypeDefinitionOptions fromJson(Map<String, dynamic> json) {
    if (TypeDefinitionRegistrationOptions.canParse(json, nullLspJsonReporter)) {
      return TypeDefinitionRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return TypeDefinitionOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TypeDefinitionOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TypeDefinitionOptions &&
        other.runtimeType == TypeDefinitionOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TypeDefinitionParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TypeDefinitionParams.canParse, TypeDefinitionParams.fromJson);

  TypeDefinitionParams(
      {@required this.textDocument,
      @required this.position,
      this.workDoneToken,
      this.partialResultToken}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (position == null) {
      throw 'position is required but was not provided';
    }
  }
  static TypeDefinitionParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return TypeDefinitionParams(
        textDocument: textDocument,
        position: position,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['position'] =
        position ?? (throw 'position is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('position');
      try {
        if (!obj.containsKey('position')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['position'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(Position.canParse(obj['position'], reporter))) {
          reporter.reportError('must be of type Position');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TypeDefinitionParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TypeDefinitionParams &&
        other.runtimeType == TypeDefinitionParams) {
      return textDocument == other.textDocument &&
          position == other.position &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, position.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class TypeDefinitionRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        TypeDefinitionOptions,
        StaticRegistrationOptions,
        ToJsonable {
  static const jsonHandler = LspJsonHandler(
      TypeDefinitionRegistrationOptions.canParse,
      TypeDefinitionRegistrationOptions.fromJson);

  TypeDefinitionRegistrationOptions(
      {this.documentSelector, this.workDoneProgress, this.id});
  static TypeDefinitionRegistrationOptions fromJson(Map<String, dynamic> json) {
    final documentSelector = json['documentSelector']
        ?.map((item) => item != null ? DocumentFilter.fromJson(item) : null)
        ?.cast<DocumentFilter>()
        ?.toList();
    final workDoneProgress = json['workDoneProgress'];
    final id = json['id'];
    return TypeDefinitionRegistrationOptions(
        documentSelector: documentSelector,
        workDoneProgress: workDoneProgress,
        id: id);
  }

  /// A document selector to identify the scope of the registration. If set to
  /// null the document selector provided on the client side will be used.
  final List<DocumentFilter> documentSelector;

  /// The id used to register the request. The id can be used to deregister the
  /// request again. See also Registration#id.
  final String id;
  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['documentSelector'] = documentSelector;
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    if (id != null) {
      __result['id'] = id;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentSelector');
      try {
        if (!obj.containsKey('documentSelector')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['documentSelector'] != null &&
            !((obj['documentSelector'] is List &&
                (obj['documentSelector'].every(
                    (item) => DocumentFilter.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<DocumentFilter>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('id');
      try {
        if (obj['id'] != null && !(obj['id'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type TypeDefinitionRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is TypeDefinitionRegistrationOptions &&
        other.runtimeType == TypeDefinitionRegistrationOptions) {
      return listEqual(documentSelector, other.documentSelector,
              (DocumentFilter a, DocumentFilter b) => a == b) &&
          workDoneProgress == other.workDoneProgress &&
          id == other.id &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(documentSelector));
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// General parameters to unregister a capability.
class Unregistration implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(Unregistration.canParse, Unregistration.fromJson);

  Unregistration({@required this.id, @required this.method}) {
    if (id == null) {
      throw 'id is required but was not provided';
    }
    if (method == null) {
      throw 'method is required but was not provided';
    }
  }
  static Unregistration fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final method = json['method'];
    return Unregistration(id: id, method: method);
  }

  /// The id used to unregister the request or notification. Usually an id
  /// provided during the register request.
  final String id;

  /// The method / capability to unregister for.
  final String method;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['id'] = id ?? (throw 'id is required but was not set');
    __result['method'] = method ?? (throw 'method is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('id');
      try {
        if (!obj.containsKey('id')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['id'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['id'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('method');
      try {
        if (!obj.containsKey('method')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['method'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['method'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type Unregistration');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is Unregistration && other.runtimeType == Unregistration) {
      return id == other.id && method == other.method && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, id.hashCode);
    hash = JenkinsSmiHash.combine(hash, method.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class UnregistrationParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      UnregistrationParams.canParse, UnregistrationParams.fromJson);

  UnregistrationParams({@required this.unregisterations}) {
    if (unregisterations == null) {
      throw 'unregisterations is required but was not provided';
    }
  }
  static UnregistrationParams fromJson(Map<String, dynamic> json) {
    final unregisterations = json['unregisterations']
        ?.map((item) => item != null ? Unregistration.fromJson(item) : null)
        ?.cast<Unregistration>()
        ?.toList();
    return UnregistrationParams(unregisterations: unregisterations);
  }

  /// This should correctly be named `unregistrations`. However changing this //
  /// is a breaking change and needs to wait until we deliver a 4.x version //
  /// of the specification.
  final List<Unregistration> unregisterations;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['unregisterations'] = unregisterations ??
        (throw 'unregisterations is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('unregisterations');
      try {
        if (!obj.containsKey('unregisterations')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['unregisterations'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['unregisterations'] is List &&
            (obj['unregisterations']
                .every((item) => Unregistration.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<Unregistration>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type UnregistrationParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is UnregistrationParams &&
        other.runtimeType == UnregistrationParams) {
      return listEqual(unregisterations, other.unregisterations,
              (Unregistration a, Unregistration b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(unregisterations));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class VersionedTextDocumentIdentifier
    implements TextDocumentIdentifier, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      VersionedTextDocumentIdentifier.canParse,
      VersionedTextDocumentIdentifier.fromJson);

  VersionedTextDocumentIdentifier({this.version, @required this.uri}) {
    if (uri == null) {
      throw 'uri is required but was not provided';
    }
  }
  static VersionedTextDocumentIdentifier fromJson(Map<String, dynamic> json) {
    final version = json['version'];
    final uri = json['uri'];
    return VersionedTextDocumentIdentifier(version: version, uri: uri);
  }

  /// The text document's URI.
  final String uri;

  /// The version number of this document. If a versioned text document
  /// identifier is sent from the server to the client and the file is not open
  /// in the editor (the server has not received an open notification before)
  /// the server can send `null` to indicate that the version is known and the
  /// content on disk is the master (as speced with document content ownership).
  ///
  /// The version number of a document will increase after each change,
  /// including undo/redo. The number doesn't need to be consecutive.
  final num version;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['version'] = version;
    __result['uri'] = uri ?? (throw 'uri is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('version');
      try {
        if (!obj.containsKey('version')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['version'] != null && !(obj['version'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('uri');
      try {
        if (!obj.containsKey('uri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['uri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['uri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type VersionedTextDocumentIdentifier');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is VersionedTextDocumentIdentifier &&
        other.runtimeType == VersionedTextDocumentIdentifier) {
      return version == other.version && uri == other.uri && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, version.hashCode);
    hash = JenkinsSmiHash.combine(hash, uri.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WatchKind {
  const WatchKind(this._value);
  const WatchKind.fromJson(this._value);

  final num _value;

  static bool canParse(Object obj, LspJsonReporter reporter) {
    return obj is num;
  }

  /// Interested in create events.
  static const Create = WatchKind(1);

  /// Interested in change events
  static const Change = WatchKind(2);

  /// Interested in delete events
  static const Delete = WatchKind(4);

  Object toJson() => _value;

  @override
  String toString() => _value.toString();

  @override
  int get hashCode => _value.hashCode;

  bool operator ==(Object o) => o is WatchKind && o._value == _value;
}

/// The parameters send in a will save text document notification.
class WillSaveTextDocumentParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WillSaveTextDocumentParams.canParse, WillSaveTextDocumentParams.fromJson);

  WillSaveTextDocumentParams(
      {@required this.textDocument, @required this.reason}) {
    if (textDocument == null) {
      throw 'textDocument is required but was not provided';
    }
    if (reason == null) {
      throw 'reason is required but was not provided';
    }
  }
  static WillSaveTextDocumentParams fromJson(Map<String, dynamic> json) {
    final textDocument = json['textDocument'] != null
        ? TextDocumentIdentifier.fromJson(json['textDocument'])
        : null;
    final reason = json['reason'];
    return WillSaveTextDocumentParams(
        textDocument: textDocument, reason: reason);
  }

  /// The 'TextDocumentSaveReason'.
  final num reason;

  /// The document that will be saved.
  final TextDocumentIdentifier textDocument;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['textDocument'] =
        textDocument ?? (throw 'textDocument is required but was not set');
    __result['reason'] = reason ?? (throw 'reason is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('textDocument');
      try {
        if (!obj.containsKey('textDocument')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['textDocument'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(TextDocumentIdentifier.canParse(obj['textDocument'], reporter))) {
          reporter.reportError('must be of type TextDocumentIdentifier');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('reason');
      try {
        if (!obj.containsKey('reason')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['reason'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['reason'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WillSaveTextDocumentParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WillSaveTextDocumentParams &&
        other.runtimeType == WillSaveTextDocumentParams) {
      return textDocument == other.textDocument &&
          reason == other.reason &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, textDocument.hashCode);
    hash = JenkinsSmiHash.combine(hash, reason.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkDoneProgressBegin implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkDoneProgressBegin.canParse, WorkDoneProgressBegin.fromJson);

  WorkDoneProgressBegin(
      {@required this.kind,
      @required this.title,
      this.cancellable,
      this.message,
      this.percentage}) {
    if (kind == null) {
      throw 'kind is required but was not provided';
    }
    if (title == null) {
      throw 'title is required but was not provided';
    }
  }
  static WorkDoneProgressBegin fromJson(Map<String, dynamic> json) {
    final kind = json['kind'];
    final title = json['title'];
    final cancellable = json['cancellable'];
    final message = json['message'];
    final percentage = json['percentage'];
    return WorkDoneProgressBegin(
        kind: kind,
        title: title,
        cancellable: cancellable,
        message: message,
        percentage: percentage);
  }

  /// Controls if a cancel button should show to allow the user to cancel the
  /// long running operation. Clients that don't support cancellation are
  /// allowed to ignore the setting.
  final bool cancellable;
  final String kind;

  /// Optional, more detailed associated progress message. Contains
  /// complementary information to the `title`.
  ///
  /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep". If
  /// unset, the previous progress message (if any) is still valid.
  final String message;

  /// Optional progress percentage to display (value 100 is considered 100%). If
  /// not provided infinite progress is assumed and clients are allowed to
  /// ignore the `percentage` value in subsequent in report notifications.
  ///
  /// The value should be steadily rising. Clients are free to ignore values
  /// that are not following this rule.
  final num percentage;

  /// Mandatory title of the progress operation. Used to briefly inform about
  /// the kind of operation being performed.
  ///
  /// Examples: "Indexing" or "Linking dependencies".
  final String title;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['kind'] = kind ?? (throw 'kind is required but was not set');
    __result['title'] = title ?? (throw 'title is required but was not set');
    if (cancellable != null) {
      __result['cancellable'] = cancellable;
    }
    if (message != null) {
      __result['message'] = message;
    }
    if (percentage != null) {
      __result['percentage'] = percentage;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('kind');
      try {
        if (!obj.containsKey('kind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['kind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['kind'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('title');
      try {
        if (!obj.containsKey('title')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['title'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['title'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('cancellable');
      try {
        if (obj['cancellable'] != null && !(obj['cancellable'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('message');
      try {
        if (obj['message'] != null && !(obj['message'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('percentage');
      try {
        if (obj['percentage'] != null && !(obj['percentage'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkDoneProgressBegin');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkDoneProgressBegin &&
        other.runtimeType == WorkDoneProgressBegin) {
      return kind == other.kind &&
          title == other.title &&
          cancellable == other.cancellable &&
          message == other.message &&
          percentage == other.percentage &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, title.hashCode);
    hash = JenkinsSmiHash.combine(hash, cancellable.hashCode);
    hash = JenkinsSmiHash.combine(hash, message.hashCode);
    hash = JenkinsSmiHash.combine(hash, percentage.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkDoneProgressCancelParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkDoneProgressCancelParams.canParse,
      WorkDoneProgressCancelParams.fromJson);

  WorkDoneProgressCancelParams({@required this.token}) {
    if (token == null) {
      throw 'token is required but was not provided';
    }
  }
  static WorkDoneProgressCancelParams fromJson(Map<String, dynamic> json) {
    final token = json['token'] is num
        ? Either2<num, String>.t1(json['token'])
        : (json['token'] is String
            ? Either2<num, String>.t2(json['token'])
            : (throw '''${json['token']} was not one of (num, String)'''));
    return WorkDoneProgressCancelParams(token: token);
  }

  /// The token to be used to report progress.
  final Either2<num, String> token;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['token'] = token ?? (throw 'token is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('token');
      try {
        if (!obj.containsKey('token')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['token'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['token'] is num || obj['token'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkDoneProgressCancelParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkDoneProgressCancelParams &&
        other.runtimeType == WorkDoneProgressCancelParams) {
      return token == other.token && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, token.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkDoneProgressCreateParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkDoneProgressCreateParams.canParse,
      WorkDoneProgressCreateParams.fromJson);

  WorkDoneProgressCreateParams({@required this.token}) {
    if (token == null) {
      throw 'token is required but was not provided';
    }
  }
  static WorkDoneProgressCreateParams fromJson(Map<String, dynamic> json) {
    final token = json['token'] is num
        ? Either2<num, String>.t1(json['token'])
        : (json['token'] is String
            ? Either2<num, String>.t2(json['token'])
            : (throw '''${json['token']} was not one of (num, String)'''));
    return WorkDoneProgressCreateParams(token: token);
  }

  /// The token to be used to report progress.
  final Either2<num, String> token;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['token'] = token ?? (throw 'token is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('token');
      try {
        if (!obj.containsKey('token')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['token'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['token'] is num || obj['token'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkDoneProgressCreateParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkDoneProgressCreateParams &&
        other.runtimeType == WorkDoneProgressCreateParams) {
      return token == other.token && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, token.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkDoneProgressEnd implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkDoneProgressEnd.canParse, WorkDoneProgressEnd.fromJson);

  WorkDoneProgressEnd({@required this.kind, this.message}) {
    if (kind == null) {
      throw 'kind is required but was not provided';
    }
  }
  static WorkDoneProgressEnd fromJson(Map<String, dynamic> json) {
    final kind = json['kind'];
    final message = json['message'];
    return WorkDoneProgressEnd(kind: kind, message: message);
  }

  final String kind;

  /// Optional, a final message indicating to for example indicate the outcome
  /// of the operation.
  final String message;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['kind'] = kind ?? (throw 'kind is required but was not set');
    if (message != null) {
      __result['message'] = message;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('kind');
      try {
        if (!obj.containsKey('kind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['kind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['kind'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('message');
      try {
        if (obj['message'] != null && !(obj['message'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkDoneProgressEnd');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkDoneProgressEnd &&
        other.runtimeType == WorkDoneProgressEnd) {
      return kind == other.kind && message == other.message && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, message.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkDoneProgressOptions implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkDoneProgressOptions.canParse, WorkDoneProgressOptions.fromJson);

  WorkDoneProgressOptions({this.workDoneProgress});
  static WorkDoneProgressOptions fromJson(Map<String, dynamic> json) {
    if (WorkspaceSymbolOptions.canParse(json, nullLspJsonReporter)) {
      return WorkspaceSymbolOptions.fromJson(json);
    }
    if (ExecuteCommandOptions.canParse(json, nullLspJsonReporter)) {
      return ExecuteCommandOptions.fromJson(json);
    }
    if (CompletionOptions.canParse(json, nullLspJsonReporter)) {
      return CompletionOptions.fromJson(json);
    }
    if (HoverOptions.canParse(json, nullLspJsonReporter)) {
      return HoverOptions.fromJson(json);
    }
    if (SignatureHelpOptions.canParse(json, nullLspJsonReporter)) {
      return SignatureHelpOptions.fromJson(json);
    }
    if (DeclarationOptions.canParse(json, nullLspJsonReporter)) {
      return DeclarationOptions.fromJson(json);
    }
    if (DefinitionOptions.canParse(json, nullLspJsonReporter)) {
      return DefinitionOptions.fromJson(json);
    }
    if (TypeDefinitionOptions.canParse(json, nullLspJsonReporter)) {
      return TypeDefinitionOptions.fromJson(json);
    }
    if (ImplementationOptions.canParse(json, nullLspJsonReporter)) {
      return ImplementationOptions.fromJson(json);
    }
    if (ReferenceOptions.canParse(json, nullLspJsonReporter)) {
      return ReferenceOptions.fromJson(json);
    }
    if (DocumentHighlightOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentHighlightOptions.fromJson(json);
    }
    if (DocumentSymbolOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentSymbolOptions.fromJson(json);
    }
    if (CodeActionOptions.canParse(json, nullLspJsonReporter)) {
      return CodeActionOptions.fromJson(json);
    }
    if (CodeLensOptions.canParse(json, nullLspJsonReporter)) {
      return CodeLensOptions.fromJson(json);
    }
    if (DocumentLinkOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentLinkOptions.fromJson(json);
    }
    if (DocumentColorOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentColorOptions.fromJson(json);
    }
    if (DocumentFormattingOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentFormattingOptions.fromJson(json);
    }
    if (DocumentRangeFormattingOptions.canParse(json, nullLspJsonReporter)) {
      return DocumentRangeFormattingOptions.fromJson(json);
    }
    if (RenameOptions.canParse(json, nullLspJsonReporter)) {
      return RenameOptions.fromJson(json);
    }
    if (FoldingRangeOptions.canParse(json, nullLspJsonReporter)) {
      return FoldingRangeOptions.fromJson(json);
    }
    if (SelectionRangeOptions.canParse(json, nullLspJsonReporter)) {
      return SelectionRangeOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return WorkDoneProgressOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkDoneProgressOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkDoneProgressOptions &&
        other.runtimeType == WorkDoneProgressOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkDoneProgressParams implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkDoneProgressParams.canParse, WorkDoneProgressParams.fromJson);

  WorkDoneProgressParams({this.workDoneToken});
  static WorkDoneProgressParams fromJson(Map<String, dynamic> json) {
    if (InitializeParams.canParse(json, nullLspJsonReporter)) {
      return InitializeParams.fromJson(json);
    }
    if (WorkspaceSymbolParams.canParse(json, nullLspJsonReporter)) {
      return WorkspaceSymbolParams.fromJson(json);
    }
    if (ExecuteCommandParams.canParse(json, nullLspJsonReporter)) {
      return ExecuteCommandParams.fromJson(json);
    }
    if (CompletionParams.canParse(json, nullLspJsonReporter)) {
      return CompletionParams.fromJson(json);
    }
    if (HoverParams.canParse(json, nullLspJsonReporter)) {
      return HoverParams.fromJson(json);
    }
    if (SignatureHelpParams.canParse(json, nullLspJsonReporter)) {
      return SignatureHelpParams.fromJson(json);
    }
    if (DeclarationParams.canParse(json, nullLspJsonReporter)) {
      return DeclarationParams.fromJson(json);
    }
    if (DefinitionParams.canParse(json, nullLspJsonReporter)) {
      return DefinitionParams.fromJson(json);
    }
    if (TypeDefinitionParams.canParse(json, nullLspJsonReporter)) {
      return TypeDefinitionParams.fromJson(json);
    }
    if (ImplementationParams.canParse(json, nullLspJsonReporter)) {
      return ImplementationParams.fromJson(json);
    }
    if (ReferenceParams.canParse(json, nullLspJsonReporter)) {
      return ReferenceParams.fromJson(json);
    }
    if (DocumentHighlightParams.canParse(json, nullLspJsonReporter)) {
      return DocumentHighlightParams.fromJson(json);
    }
    if (DocumentSymbolParams.canParse(json, nullLspJsonReporter)) {
      return DocumentSymbolParams.fromJson(json);
    }
    if (CodeActionParams.canParse(json, nullLspJsonReporter)) {
      return CodeActionParams.fromJson(json);
    }
    if (CodeLensParams.canParse(json, nullLspJsonReporter)) {
      return CodeLensParams.fromJson(json);
    }
    if (DocumentLinkParams.canParse(json, nullLspJsonReporter)) {
      return DocumentLinkParams.fromJson(json);
    }
    if (DocumentColorParams.canParse(json, nullLspJsonReporter)) {
      return DocumentColorParams.fromJson(json);
    }
    if (ColorPresentationParams.canParse(json, nullLspJsonReporter)) {
      return ColorPresentationParams.fromJson(json);
    }
    if (DocumentFormattingParams.canParse(json, nullLspJsonReporter)) {
      return DocumentFormattingParams.fromJson(json);
    }
    if (DocumentRangeFormattingParams.canParse(json, nullLspJsonReporter)) {
      return DocumentRangeFormattingParams.fromJson(json);
    }
    if (RenameParams.canParse(json, nullLspJsonReporter)) {
      return RenameParams.fromJson(json);
    }
    if (FoldingRangeParams.canParse(json, nullLspJsonReporter)) {
      return FoldingRangeParams.fromJson(json);
    }
    if (SelectionRangeParams.canParse(json, nullLspJsonReporter)) {
      return SelectionRangeParams.fromJson(json);
    }
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    return WorkDoneProgressParams(workDoneToken: workDoneToken);
  }

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkDoneProgressParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkDoneProgressParams &&
        other.runtimeType == WorkDoneProgressParams) {
      return workDoneToken == other.workDoneToken && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkDoneProgressReport implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkDoneProgressReport.canParse, WorkDoneProgressReport.fromJson);

  WorkDoneProgressReport(
      {@required this.kind, this.cancellable, this.message, this.percentage}) {
    if (kind == null) {
      throw 'kind is required but was not provided';
    }
  }
  static WorkDoneProgressReport fromJson(Map<String, dynamic> json) {
    final kind = json['kind'];
    final cancellable = json['cancellable'];
    final message = json['message'];
    final percentage = json['percentage'];
    return WorkDoneProgressReport(
        kind: kind,
        cancellable: cancellable,
        message: message,
        percentage: percentage);
  }

  /// Controls enablement state of a cancel button. This property is only valid
  /// if a cancel button got requested in the `WorkDoneProgressStart` payload.
  ///
  /// Clients that don't support cancellation or don't support control the
  /// button's enablement state are allowed to ignore the setting.
  final bool cancellable;
  final String kind;

  /// Optional, more detailed associated progress message. Contains
  /// complementary information to the `title`.
  ///
  /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep". If
  /// unset, the previous progress message (if any) is still valid.
  final String message;

  /// Optional progress percentage to display (value 100 is considered 100%). If
  /// not provided infinite progress is assumed and clients are allowed to
  /// ignore the `percentage` value in subsequent in report notifications.
  ///
  /// The value should be steadily rising. Clients are free to ignore values
  /// that are not following this rule.
  final num percentage;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['kind'] = kind ?? (throw 'kind is required but was not set');
    if (cancellable != null) {
      __result['cancellable'] = cancellable;
    }
    if (message != null) {
      __result['message'] = message;
    }
    if (percentage != null) {
      __result['percentage'] = percentage;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('kind');
      try {
        if (!obj.containsKey('kind')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['kind'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['kind'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('cancellable');
      try {
        if (obj['cancellable'] != null && !(obj['cancellable'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('message');
      try {
        if (obj['message'] != null && !(obj['message'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('percentage');
      try {
        if (obj['percentage'] != null && !(obj['percentage'] is num)) {
          reporter.reportError('must be of type num');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkDoneProgressReport');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkDoneProgressReport &&
        other.runtimeType == WorkDoneProgressReport) {
      return kind == other.kind &&
          cancellable == other.cancellable &&
          message == other.message &&
          percentage == other.percentage &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, kind.hashCode);
    hash = JenkinsSmiHash.combine(hash, cancellable.hashCode);
    hash = JenkinsSmiHash.combine(hash, message.hashCode);
    hash = JenkinsSmiHash.combine(hash, percentage.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkspaceEdit implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(WorkspaceEdit.canParse, WorkspaceEdit.fromJson);

  WorkspaceEdit({this.changes, this.documentChanges});
  static WorkspaceEdit fromJson(Map<String, dynamic> json) {
    final changes = json['changes']
        ?.map((key, value) => MapEntry(
            key,
            value
                ?.map((item) => item != null ? TextEdit.fromJson(item) : null)
                ?.cast<TextEdit>()
                ?.toList()))
        ?.cast<String, List<TextEdit>>();
    final documentChanges = (json['documentChanges'] is List && (json['documentChanges'].every((item) => TextDocumentEdit.canParse(item, nullLspJsonReporter))))
        ? Either2<List<TextDocumentEdit>, List<Either4<TextDocumentEdit, CreateFile, RenameFile, DeleteFile>>>.t1(
            json['documentChanges']
                ?.map((item) =>
                    item != null ? TextDocumentEdit.fromJson(item) : null)
                ?.cast<TextDocumentEdit>()
                ?.toList())
        : ((json['documentChanges'] is List && (json['documentChanges'].every((item) => (TextDocumentEdit.canParse(item, nullLspJsonReporter) || CreateFile.canParse(item, nullLspJsonReporter) || RenameFile.canParse(item, nullLspJsonReporter) || DeleteFile.canParse(item, nullLspJsonReporter)))))
            ? Either2<List<TextDocumentEdit>, List<Either4<TextDocumentEdit, CreateFile, RenameFile, DeleteFile>>>.t2(json['documentChanges']
                ?.map((item) => TextDocumentEdit.canParse(item, nullLspJsonReporter)
                    ? Either4<TextDocumentEdit, CreateFile, RenameFile, DeleteFile>.t1(
                        item != null ? TextDocumentEdit.fromJson(item) : null)
                    : (CreateFile.canParse(item, nullLspJsonReporter)
                        ? Either4<TextDocumentEdit, CreateFile, RenameFile, DeleteFile>.t2(item != null ? CreateFile.fromJson(item) : null)
                        : (RenameFile.canParse(item, nullLspJsonReporter) ? Either4<TextDocumentEdit, CreateFile, RenameFile, DeleteFile>.t3(item != null ? RenameFile.fromJson(item) : null) : (DeleteFile.canParse(item, nullLspJsonReporter) ? Either4<TextDocumentEdit, CreateFile, RenameFile, DeleteFile>.t4(item != null ? DeleteFile.fromJson(item) : null) : (item == null ? null : (throw '''${item} was not one of (TextDocumentEdit, CreateFile, RenameFile, DeleteFile)'''))))))
                ?.cast<Either4<TextDocumentEdit, CreateFile, RenameFile, DeleteFile>>()
                ?.toList())
            : (json['documentChanges'] == null ? null : (throw '''${json['documentChanges']} was not one of (List<TextDocumentEdit>, List<Either4<TextDocumentEdit, CreateFile, RenameFile, DeleteFile>>)''')));
    return WorkspaceEdit(changes: changes, documentChanges: documentChanges);
  }

  /// Holds changes to existing resources.
  final Map<String, List<TextEdit>> changes;

  /// Depending on the client capability
  /// `workspace.workspaceEdit.resourceOperations` document changes are either
  /// an array of `TextDocumentEdit`s to express changes to n different text
  /// documents where each text document edit addresses a specific version of a
  /// text document. Or it can contain above `TextDocumentEdit`s mixed with
  /// create, rename and delete file / folder operations.
  ///
  /// Whether a client supports versioned document edits is expressed via
  /// `workspace.workspaceEdit.documentChanges` client capability.
  ///
  /// If a client neither supports `documentChanges` nor
  /// `workspace.workspaceEdit.resourceOperations` then only plain `TextEdit`s
  /// using the `changes` property are supported.
  final Either2<List<TextDocumentEdit>,
          List<Either4<TextDocumentEdit, CreateFile, RenameFile, DeleteFile>>>
      documentChanges;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (changes != null) {
      __result['changes'] = changes;
    }
    if (documentChanges != null) {
      __result['documentChanges'] = documentChanges;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('changes');
      try {
        if (obj['changes'] != null &&
            !((obj['changes'] is Map &&
                (obj['changes'].keys.every((item) =>
                    item is String &&
                    obj['changes'].values.every((item) => (item is List &&
                        (item.every((item) =>
                            TextEdit.canParse(item, reporter)))))))))) {
          reporter.reportError('must be of type Map<String, List<TextEdit>>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('documentChanges');
      try {
        if (obj['documentChanges'] != null &&
            !(((obj['documentChanges'] is List &&
                    (obj['documentChanges'].every((item) =>
                        TextDocumentEdit.canParse(item, reporter)))) ||
                (obj['documentChanges'] is List &&
                    (obj['documentChanges'].every((item) =>
                        (TextDocumentEdit.canParse(item, reporter) ||
                            CreateFile.canParse(item, reporter) ||
                            RenameFile.canParse(item, reporter) ||
                            DeleteFile.canParse(item, reporter)))))))) {
          reporter.reportError(
              'must be of type Either2<List<TextDocumentEdit>, List<Either4<TextDocumentEdit, CreateFile, RenameFile, DeleteFile>>>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkspaceEdit');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkspaceEdit && other.runtimeType == WorkspaceEdit) {
      return mapEqual(
              changes,
              other.changes,
              (List<TextEdit> a, List<TextEdit> b) =>
                  listEqual(a, b, (TextEdit a, TextEdit b) => a == b)) &&
          documentChanges == other.documentChanges &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(changes));
    hash = JenkinsSmiHash.combine(hash, documentChanges.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkspaceEditClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkspaceEditClientCapabilities.canParse,
      WorkspaceEditClientCapabilities.fromJson);

  WorkspaceEditClientCapabilities(
      {this.documentChanges, this.resourceOperations, this.failureHandling});
  static WorkspaceEditClientCapabilities fromJson(Map<String, dynamic> json) {
    final documentChanges = json['documentChanges'];
    final resourceOperations = json['resourceOperations']
        ?.map((item) =>
            item != null ? ResourceOperationKind.fromJson(item) : null)
        ?.cast<ResourceOperationKind>()
        ?.toList();
    final failureHandling = json['failureHandling'] != null
        ? FailureHandlingKind.fromJson(json['failureHandling'])
        : null;
    return WorkspaceEditClientCapabilities(
        documentChanges: documentChanges,
        resourceOperations: resourceOperations,
        failureHandling: failureHandling);
  }

  /// The client supports versioned document changes in `WorkspaceEdit`s
  final bool documentChanges;

  /// The failure handling strategy of a client if applying the workspace edit
  /// fails.
  ///  @since 3.13.0
  final FailureHandlingKind failureHandling;

  /// The resource operations the client supports. Clients should at least
  /// support 'create', 'rename' and 'delete' files and folders.
  ///  @since 3.13.0
  final List<ResourceOperationKind> resourceOperations;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (documentChanges != null) {
      __result['documentChanges'] = documentChanges;
    }
    if (resourceOperations != null) {
      __result['resourceOperations'] = resourceOperations;
    }
    if (failureHandling != null) {
      __result['failureHandling'] = failureHandling;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('documentChanges');
      try {
        if (obj['documentChanges'] != null &&
            !(obj['documentChanges'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('resourceOperations');
      try {
        if (obj['resourceOperations'] != null &&
            !((obj['resourceOperations'] is List &&
                (obj['resourceOperations'].every((item) =>
                    ResourceOperationKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<ResourceOperationKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('failureHandling');
      try {
        if (obj['failureHandling'] != null &&
            !(FailureHandlingKind.canParse(obj['failureHandling'], reporter))) {
          reporter.reportError('must be of type FailureHandlingKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkspaceEditClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkspaceEditClientCapabilities &&
        other.runtimeType == WorkspaceEditClientCapabilities) {
      return documentChanges == other.documentChanges &&
          listEqual(resourceOperations, other.resourceOperations,
              (ResourceOperationKind a, ResourceOperationKind b) => a == b) &&
          failureHandling == other.failureHandling &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, documentChanges.hashCode);
    hash = JenkinsSmiHash.combine(hash, lspHashCode(resourceOperations));
    hash = JenkinsSmiHash.combine(hash, failureHandling.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkspaceFolder implements ToJsonable {
  static const jsonHandler =
      LspJsonHandler(WorkspaceFolder.canParse, WorkspaceFolder.fromJson);

  WorkspaceFolder({@required this.uri, @required this.name}) {
    if (uri == null) {
      throw 'uri is required but was not provided';
    }
    if (name == null) {
      throw 'name is required but was not provided';
    }
  }
  static WorkspaceFolder fromJson(Map<String, dynamic> json) {
    final uri = json['uri'];
    final name = json['name'];
    return WorkspaceFolder(uri: uri, name: name);
  }

  /// The name of the workspace folder. Used to refer to this workspace folder
  /// in the user interface.
  final String name;

  /// The associated URI for this workspace folder.
  final String uri;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['uri'] = uri ?? (throw 'uri is required but was not set');
    __result['name'] = name ?? (throw 'name is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('uri');
      try {
        if (!obj.containsKey('uri')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['uri'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['uri'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('name');
      try {
        if (!obj.containsKey('name')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['name'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['name'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkspaceFolder');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkspaceFolder && other.runtimeType == WorkspaceFolder) {
      return uri == other.uri && name == other.name && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, uri.hashCode);
    hash = JenkinsSmiHash.combine(hash, name.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// The workspace folder change event.
class WorkspaceFoldersChangeEvent implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkspaceFoldersChangeEvent.canParse,
      WorkspaceFoldersChangeEvent.fromJson);

  WorkspaceFoldersChangeEvent({@required this.added, @required this.removed}) {
    if (added == null) {
      throw 'added is required but was not provided';
    }
    if (removed == null) {
      throw 'removed is required but was not provided';
    }
  }
  static WorkspaceFoldersChangeEvent fromJson(Map<String, dynamic> json) {
    final added = json['added']
        ?.map((item) => item != null ? WorkspaceFolder.fromJson(item) : null)
        ?.cast<WorkspaceFolder>()
        ?.toList();
    final removed = json['removed']
        ?.map((item) => item != null ? WorkspaceFolder.fromJson(item) : null)
        ?.cast<WorkspaceFolder>()
        ?.toList();
    return WorkspaceFoldersChangeEvent(added: added, removed: removed);
  }

  /// The array of added workspace folders
  final List<WorkspaceFolder> added;

  /// The array of the removed workspace folders
  final List<WorkspaceFolder> removed;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['added'] = added ?? (throw 'added is required but was not set');
    __result['removed'] =
        removed ?? (throw 'removed is required but was not set');
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('added');
      try {
        if (!obj.containsKey('added')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['added'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['added'] is List &&
            (obj['added']
                .every((item) => WorkspaceFolder.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<WorkspaceFolder>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('removed');
      try {
        if (!obj.containsKey('removed')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['removed'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!((obj['removed'] is List &&
            (obj['removed']
                .every((item) => WorkspaceFolder.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<WorkspaceFolder>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkspaceFoldersChangeEvent');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkspaceFoldersChangeEvent &&
        other.runtimeType == WorkspaceFoldersChangeEvent) {
      return listEqual(added, other.added,
              (WorkspaceFolder a, WorkspaceFolder b) => a == b) &&
          listEqual(removed, other.removed,
              (WorkspaceFolder a, WorkspaceFolder b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(added));
    hash = JenkinsSmiHash.combine(hash, lspHashCode(removed));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkspaceFoldersServerCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkspaceFoldersServerCapabilities.canParse,
      WorkspaceFoldersServerCapabilities.fromJson);

  WorkspaceFoldersServerCapabilities(
      {this.supported, this.changeNotifications});
  static WorkspaceFoldersServerCapabilities fromJson(
      Map<String, dynamic> json) {
    final supported = json['supported'];
    final changeNotifications = json['changeNotifications'] is String
        ? Either2<String, bool>.t1(json['changeNotifications'])
        : (json['changeNotifications'] is bool
            ? Either2<String, bool>.t2(json['changeNotifications'])
            : (json['changeNotifications'] == null
                ? null
                : (throw '''${json['changeNotifications']} was not one of (String, bool)''')));
    return WorkspaceFoldersServerCapabilities(
        supported: supported, changeNotifications: changeNotifications);
  }

  /// Whether the server wants to receive workspace folder change notifications.
  ///
  /// If a string is provided, the string is treated as an ID under which the
  /// notification is registered on the client side. The ID can be used to
  /// unregister for these events using the `client/unregisterCapability`
  /// request.
  final Either2<String, bool> changeNotifications;

  /// The server has support for workspace folders
  final bool supported;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (supported != null) {
      __result['supported'] = supported;
    }
    if (changeNotifications != null) {
      __result['changeNotifications'] = changeNotifications;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('supported');
      try {
        if (obj['supported'] != null && !(obj['supported'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('changeNotifications');
      try {
        if (obj['changeNotifications'] != null &&
            !((obj['changeNotifications'] is String ||
                obj['changeNotifications'] is bool))) {
          reporter.reportError('must be of type Either2<String, bool>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter
          .reportError('must be of type WorkspaceFoldersServerCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkspaceFoldersServerCapabilities &&
        other.runtimeType == WorkspaceFoldersServerCapabilities) {
      return supported == other.supported &&
          changeNotifications == other.changeNotifications &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, supported.hashCode);
    hash = JenkinsSmiHash.combine(hash, changeNotifications.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkspaceSymbolClientCapabilities implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkspaceSymbolClientCapabilities.canParse,
      WorkspaceSymbolClientCapabilities.fromJson);

  WorkspaceSymbolClientCapabilities(
      {this.dynamicRegistration, this.symbolKind});
  static WorkspaceSymbolClientCapabilities fromJson(Map<String, dynamic> json) {
    final dynamicRegistration = json['dynamicRegistration'];
    final symbolKind = json['symbolKind'] != null
        ? WorkspaceSymbolClientCapabilitiesSymbolKind.fromJson(
            json['symbolKind'])
        : null;
    return WorkspaceSymbolClientCapabilities(
        dynamicRegistration: dynamicRegistration, symbolKind: symbolKind);
  }

  /// Symbol request supports dynamic registration.
  final bool dynamicRegistration;

  /// Specific capabilities for the `SymbolKind` in the `workspace/symbol`
  /// request.
  final WorkspaceSymbolClientCapabilitiesSymbolKind symbolKind;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (dynamicRegistration != null) {
      __result['dynamicRegistration'] = dynamicRegistration;
    }
    if (symbolKind != null) {
      __result['symbolKind'] = symbolKind;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('dynamicRegistration');
      try {
        if (obj['dynamicRegistration'] != null &&
            !(obj['dynamicRegistration'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('symbolKind');
      try {
        if (obj['symbolKind'] != null &&
            !(WorkspaceSymbolClientCapabilitiesSymbolKind.canParse(
                obj['symbolKind'], reporter))) {
          reporter.reportError(
              'must be of type WorkspaceSymbolClientCapabilitiesSymbolKind');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkspaceSymbolClientCapabilities');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkspaceSymbolClientCapabilities &&
        other.runtimeType == WorkspaceSymbolClientCapabilities) {
      return dynamicRegistration == other.dynamicRegistration &&
          symbolKind == other.symbolKind &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, dynamicRegistration.hashCode);
    hash = JenkinsSmiHash.combine(hash, symbolKind.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkspaceSymbolClientCapabilitiesSymbolKind implements ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkspaceSymbolClientCapabilitiesSymbolKind.canParse,
      WorkspaceSymbolClientCapabilitiesSymbolKind.fromJson);

  WorkspaceSymbolClientCapabilitiesSymbolKind({this.valueSet});
  static WorkspaceSymbolClientCapabilitiesSymbolKind fromJson(
      Map<String, dynamic> json) {
    final valueSet = json['valueSet']
        ?.map((item) => item != null ? SymbolKind.fromJson(item) : null)
        ?.cast<SymbolKind>()
        ?.toList();
    return WorkspaceSymbolClientCapabilitiesSymbolKind(valueSet: valueSet);
  }

  /// The symbol kind values the client supports. When this property exists the
  /// client also guarantees that it will handle values outside its set
  /// gracefully and falls back to a default value when unknown.
  ///
  /// If this property is not present the client only supports the symbol kinds
  /// from `File` to `Array` as defined in the initial version of the protocol.
  final List<SymbolKind> valueSet;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (valueSet != null) {
      __result['valueSet'] = valueSet;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('valueSet');
      try {
        if (obj['valueSet'] != null &&
            !((obj['valueSet'] is List &&
                (obj['valueSet']
                    .every((item) => SymbolKind.canParse(item, reporter)))))) {
          reporter.reportError('must be of type List<SymbolKind>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError(
          'must be of type WorkspaceSymbolClientCapabilitiesSymbolKind');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkspaceSymbolClientCapabilitiesSymbolKind &&
        other.runtimeType == WorkspaceSymbolClientCapabilitiesSymbolKind) {
      return listEqual(valueSet, other.valueSet,
              (SymbolKind a, SymbolKind b) => a == b) &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, lspHashCode(valueSet));
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkspaceSymbolOptions implements WorkDoneProgressOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkspaceSymbolOptions.canParse, WorkspaceSymbolOptions.fromJson);

  WorkspaceSymbolOptions({this.workDoneProgress});
  static WorkspaceSymbolOptions fromJson(Map<String, dynamic> json) {
    if (WorkspaceSymbolRegistrationOptions.canParse(
        json, nullLspJsonReporter)) {
      return WorkspaceSymbolRegistrationOptions.fromJson(json);
    }
    final workDoneProgress = json['workDoneProgress'];
    return WorkspaceSymbolOptions(workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkspaceSymbolOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkspaceSymbolOptions &&
        other.runtimeType == WorkspaceSymbolOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

/// The parameters of a Workspace Symbol Request.
class WorkspaceSymbolParams
    implements WorkDoneProgressParams, PartialResultParams, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkspaceSymbolParams.canParse, WorkspaceSymbolParams.fromJson);

  WorkspaceSymbolParams(
      {@required this.query, this.workDoneToken, this.partialResultToken}) {
    if (query == null) {
      throw 'query is required but was not provided';
    }
  }
  static WorkspaceSymbolParams fromJson(Map<String, dynamic> json) {
    final query = json['query'];
    final workDoneToken = json['workDoneToken'] is num
        ? Either2<num, String>.t1(json['workDoneToken'])
        : (json['workDoneToken'] is String
            ? Either2<num, String>.t2(json['workDoneToken'])
            : (json['workDoneToken'] == null
                ? null
                : (throw '''${json['workDoneToken']} was not one of (num, String)''')));
    final partialResultToken = json['partialResultToken'] is num
        ? Either2<num, String>.t1(json['partialResultToken'])
        : (json['partialResultToken'] is String
            ? Either2<num, String>.t2(json['partialResultToken'])
            : (json['partialResultToken'] == null
                ? null
                : (throw '''${json['partialResultToken']} was not one of (num, String)''')));
    return WorkspaceSymbolParams(
        query: query,
        workDoneToken: workDoneToken,
        partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final Either2<num, String> partialResultToken;

  /// A query string to filter symbols by. Clients may send an empty string here
  /// to request all symbols.
  final String query;

  /// An optional token that a server can use to report work done progress.
  final Either2<num, String> workDoneToken;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    __result['query'] = query ?? (throw 'query is required but was not set');
    if (workDoneToken != null) {
      __result['workDoneToken'] = workDoneToken;
    }
    if (partialResultToken != null) {
      __result['partialResultToken'] = partialResultToken;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('query');
      try {
        if (!obj.containsKey('query')) {
          reporter.reportError('must not be undefined');
          return false;
        }
        if (obj['query'] == null) {
          reporter.reportError('must not be null');
          return false;
        }
        if (!(obj['query'] is String)) {
          reporter.reportError('must be of type String');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('workDoneToken');
      try {
        if (obj['workDoneToken'] != null &&
            !((obj['workDoneToken'] is num ||
                obj['workDoneToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      reporter.push('partialResultToken');
      try {
        if (obj['partialResultToken'] != null &&
            !((obj['partialResultToken'] is num ||
                obj['partialResultToken'] is String))) {
          reporter.reportError('must be of type Either2<num, String>');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter.reportError('must be of type WorkspaceSymbolParams');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkspaceSymbolParams &&
        other.runtimeType == WorkspaceSymbolParams) {
      return query == other.query &&
          workDoneToken == other.workDoneToken &&
          partialResultToken == other.partialResultToken &&
          true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, query.hashCode);
    hash = JenkinsSmiHash.combine(hash, workDoneToken.hashCode);
    hash = JenkinsSmiHash.combine(hash, partialResultToken.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}

class WorkspaceSymbolRegistrationOptions
    implements WorkspaceSymbolOptions, ToJsonable {
  static const jsonHandler = LspJsonHandler(
      WorkspaceSymbolRegistrationOptions.canParse,
      WorkspaceSymbolRegistrationOptions.fromJson);

  WorkspaceSymbolRegistrationOptions({this.workDoneProgress});
  static WorkspaceSymbolRegistrationOptions fromJson(
      Map<String, dynamic> json) {
    final workDoneProgress = json['workDoneProgress'];
    return WorkspaceSymbolRegistrationOptions(
        workDoneProgress: workDoneProgress);
  }

  final bool workDoneProgress;

  Map<String, dynamic> toJson() {
    var __result = <String, dynamic>{};
    if (workDoneProgress != null) {
      __result['workDoneProgress'] = workDoneProgress;
    }
    return __result;
  }

  static bool canParse(Object obj, LspJsonReporter reporter) {
    if (obj is Map<String, dynamic>) {
      reporter.push('workDoneProgress');
      try {
        if (obj['workDoneProgress'] != null &&
            !(obj['workDoneProgress'] is bool)) {
          reporter.reportError('must be of type bool');
          return false;
        }
      } finally {
        reporter.pop();
      }
      return true;
    } else {
      reporter
          .reportError('must be of type WorkspaceSymbolRegistrationOptions');
      return false;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is WorkspaceSymbolRegistrationOptions &&
        other.runtimeType == WorkspaceSymbolRegistrationOptions) {
      return workDoneProgress == other.workDoneProgress && true;
    }
    return false;
  }

  @override
  int get hashCode {
    var hash = 0;
    hash = JenkinsSmiHash.combine(hash, workDoneProgress.hashCode);
    return JenkinsSmiHash.finish(hash);
  }

  @override
  String toString() => jsonEncoder.convert(toJson());
}
