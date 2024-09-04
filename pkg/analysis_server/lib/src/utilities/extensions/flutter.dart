// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analysis_server/src/utilities/strings.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';

const String widgetsUri = 'package:flutter/widgets.dart';
const _nameAlign = 'Align';
const _nameBuilder = 'Builder';
const _nameCenter = 'Center';
const _nameContainer = 'Container';
const _namePadding = 'Padding';
const _nameSizedBox = 'SizedBox';
const _nameState = 'State';
const _nameStatefulWidget = 'StatefulWidget';
const _nameStatelessWidget = 'StatelessWidget';
const _nameStreamBuilder = 'StreamBuilder';

const _nameWidget = 'Widget';
final Uri _uriAlignment = Uri.parse(
  'package:flutter/src/painting/alignment.dart',
);
final Uri _uriAsync = Uri.parse(
  'package:flutter/src/widgets/async.dart',
);
final Uri _uriBasic = Uri.parse(
  'package:flutter/src/widgets/basic.dart',
);
final Uri _uriContainer = Uri.parse(
  'package:flutter/src/widgets/container.dart',
);
final Uri _uriDiagnostics = Uri.parse(
  'package:flutter/src/foundation/diagnostics.dart',
);
final Uri _uriEdgeInsets = Uri.parse(
  'package:flutter/src/painting/edge_insets.dart',
);
final Uri _uriFramework = Uri.parse(
  'package:flutter/src/widgets/framework.dart',
);
final Uri _uriWidgetsIcon = Uri.parse(
  'package:flutter/src/widgets/icon.dart',
);

final Uri _uriWidgetsText = Uri.parse(
  'package:flutter/src/widgets/text.dart',
);

extension AstNodeExtension on AstNode? {
  /// Returns the instance creation expression that surrounds this node, if any,
  /// and otherwise `null`.
  ///
  /// This node may be the instance creation expression itself or an (optionally
  /// prefixed) identifier that names the constructor.
  InstanceCreationExpression? get findInstanceCreationExpression {
    var node = this;
    if (node is ImportPrefixReference) {
      node = node.parent;
    }
    if (node is SimpleIdentifier) {
      node = node.parent;
    }
    if (node is PrefixedIdentifier) {
      node = node.parent;
    }
    if (node is NamedType) {
      node = node.parent;
    }
    if (node is ConstructorName) {
      node = node.parent;
    }
    if (node is InstanceCreationExpression) {
      return node;
    }
    return null;
  }

  /// Attempts to find and return the closest expression that encloses this
  /// and is an independent Flutter `Widget`.
  ///
  /// Returns `null` if nothing is found.
  Expression? get findWidgetExpression {
    for (var node = this; node != null; node = node.parent) {
      if (!node.isWidgetExpression) {
        if (node is ArgumentList || node is Statement || node is FunctionBody) {
          return null;
        }
        continue;
      }

      if (node is AssignmentExpression) {
        return null;
      }

      var parent = node.parent;

      if (parent is AssignmentExpression) {
        if (parent.rightHandSide == node) {
          return node as Expression;
        }
        return null;
      }

      if (parent is ArgumentList ||
          parent is ConditionalExpression && parent.thenExpression == node ||
          parent is ConditionalExpression && parent.elseExpression == node ||
          parent is ExpressionFunctionBody && parent.expression == node ||
          parent is ForElement && parent.body == node ||
          parent is IfElement && parent.thenElement == node ||
          parent is IfElement && parent.elseElement == node ||
          parent is ListLiteral ||
          parent is NamedExpression && parent.expression == node ||
          parent is Statement ||
          parent is SwitchExpressionCase && parent.expression == node ||
          parent is VariableDeclaration) {
        return node as Expression;
      }
    }
    return null;
  }

  /// Whether the given [node] is the Flutter class `Widget`, or its subtype.
  bool get isWidgetExpression {
    return switch (this) {
      null => false,
      AstNode(parent: NamedType()) ||
      AstNode(parent: AstNode(parent: NamedType())) =>
        false,
      AstNode(parent: ConstructorName()) => false,
      NamedExpression() => false,
      Expression(:var staticType) => staticType.isWidgetType,
      _ => false,
    };
  }

  /// Finds the named expression whose name is the given [name] that is an
  /// argument to a Flutter instance creation expression.
  ///
  /// Returns `null` if this is not a [SimpleIdentifier], or if any other
  /// condition cannot be satisfied.
  NamedExpression? findArgumentNamed(String name) {
    var self = this;
    if (self is! SimpleIdentifier) {
      return null;
    }
    var parent = self.parent;
    var grandParent = parent?.parent;
    if (parent is Label && grandParent is NamedExpression) {
      if (self.name != name) {
        return null;
      }
    } else {
      return null;
    }
    var invocation = grandParent.parent?.parent;
    if (invocation is! InstanceCreationExpression ||
        !invocation.isWidgetCreation) {
      return null;
    }
    return grandParent;
  }
}

extension ClassElementExtension on ClassElement {
  /// Whether this is the Flutter class `State`.
  bool get isExactState => _isExactly(_nameState, _uriFramework);

  /// Whether this has the Flutter class `State` as a superclass.
  bool get isState => _hasSupertype(_uriFramework, _nameState);

  /// Whether this is a [ClassElement] that extends the Flutter class
  /// `StatefulWidget`.
  bool get isStatefulWidgetDeclaration => supertype.isExactlyStatefulWidgetType;
}

extension DartTypeExtension on DartType? {
  /// Whether this is the 'dart.ui' class `Color`, or a subtype.
  bool get isColor {
    var self = this;
    if (self is! InterfaceType) {
      return false;
    }

    return [self, ...self.element.allSupertypes].any((t) =>
        t.element.name == 'Color' && t.element.library.name == 'dart.ui');
  }

  /// Whether this is the Flutter mixin `Diagnosticable` or a subtype.
  bool get isDiagnosticable {
    var self = this;
    if (self is! InterfaceType) {
      return false;
    }

    return [self, ...self.element.allSupertypes].any((t) =>
        t.element.name == 'Diagnosticable' &&
        t.element.source.uri == _uriDiagnostics);
  }

  /// Whether this is the Flutter type `EdgeInsetsGeometry`.
  bool get isExactEdgeInsetsGeometryType {
    var self = this;
    return self is InterfaceType &&
        self.element._isExactly('EdgeInsetsGeometry', _uriEdgeInsets);
  }

  /// Whether this is the Flutter class `StatefulWidget`.
  bool get isExactlyStatefulWidgetType {
    var self = this;
    return self is InterfaceType &&
        self.element._isExactly(_nameStatefulWidget, _uriFramework);
  }

  /// Whether this is the Flutter class `StatelessWidget`.
  bool get isExactlyStatelessWidgetType {
    var self = this;
    return self is InterfaceType &&
        self.element._isExactly(_nameStatelessWidget, _uriFramework);
  }

  /// Whether this is the Flutter class `Align`.
  bool get isExactWidgetTypeAlign {
    var self = this;
    return self is InterfaceType &&
        self.element._isExactly(_nameAlign, _uriBasic);
  }

  /// Whether this is the Flutter class `StreamBuilder`.
  bool get isExactWidgetTypeBuilder {
    var self = this;
    return self is InterfaceType &&
        self.element._isExactly(_nameBuilder, _uriBasic);
  }

  /// Whether this is the Flutter class `Center`.
  bool get isExactWidgetTypeCenter {
    var self = this;
    return self is InterfaceType &&
        self.element._isExactly(_nameCenter, _uriBasic);
  }

  /// Whether this is the Flutter class `Container`.
  bool get isExactWidgetTypeContainer {
    var self = this;
    return self is InterfaceType &&
        self.element._isExactly(_nameContainer, _uriContainer);
  }

  /// Whether this is the Flutter class `Padding`.
  bool get isExactWidgetTypePadding {
    var self = this;
    return self is InterfaceType &&
        self.element._isExactly(_namePadding, _uriBasic);
  }

  /// Whether this is the Flutter class `SizedBox`.
  bool get isExactWidgetTypeSizedBox {
    var self = this;
    return self is InterfaceType &&
        self.element._isExactly(_nameSizedBox, _uriBasic);
  }

  /// Whether this is the Flutter class `StreamBuilder`.
  bool get isExactWidgetTypeStreamBuilder {
    var self = this;
    return self is InterfaceType &&
        self.element._isExactly(_nameStreamBuilder, _uriAsync);
  }

  /// Whether this is the Flutter class `Widget`, or its subtype.
  bool get isListOfWidgetsType {
    var self = this;
    return self is InterfaceType &&
        self.isDartCoreList &&
        self.typeArguments[0].isWidgetType;
  }

  /// Whether this is the vector_math_64 class `Matrix4`, or its
  /// subtype.
  bool get isMatrix4 {
    var self = this;
    if (self is! InterfaceType) {
      return false;
    }

    return [self, ...self.element.allSupertypes].any((t) =>
        t.element.name == 'Matrix4' &&
        t.element.library.name == 'vector_math_64');
  }

  /// Whether this is the Flutter class `Widget`, or its subtype.
  bool get isWidgetType {
    var self = this;
    return self is InterfaceType && self.element.isWidget;
  }
}

extension ExpressionExtension on Expression {
  /// Whether this is the `builder` argument.
  bool get isBuilderArgument {
    var self = this;
    return self is NamedExpression && self.name.label.name == 'builder';
  }

  /// Whether this is the `child` argument.
  bool get isChildArgument {
    var self = this;
    return self is NamedExpression && self.name.label.name == 'child';
  }

  /// Whether this is the `children` argument.
  bool get isChildrenArgument {
    var self = this;
    return self is NamedExpression && self.name.label.name == 'children';
  }
}

extension InstanceCreationExpressionExtension on InstanceCreationExpression {
  /// The named expression representing the `builder` argument, or `null` if
  /// there is none.
  NamedExpression? get builderArgument => argumentList.arguments
      .whereType<NamedExpression>()
      .firstWhereOrNull((argument) => argument.isBuilderArgument);

  /// The named expression representing the `child` argument, or `null` if there
  /// is none.
  NamedExpression? get childArgument => argumentList.arguments
      .whereType<NamedExpression>()
      .firstWhereOrNull((argument) => argument.isChildArgument);

  /// The named expression representing the `children` argument, or `null` if
  /// there is none.
  NamedExpression? get childrenArgument => argumentList.arguments
      .whereType<NamedExpression>()
      .firstWhereOrNull((argument) => argument.isChildrenArgument);

  bool get isExactlyAlignCreation => staticType.isExactWidgetTypeAlign;

  bool get isExactlyContainerCreation => staticType.isExactWidgetTypeContainer;

  bool get isExactlyPaddingCreation => staticType.isExactWidgetTypePadding;

  /// Whether this is a constructor invocation for a class that has the Flutter
  /// class `Widget` as a superclass.
  bool get isWidgetCreation {
    var element =
        constructorName.staticElement?.enclosingElement3.augmented.declaration;
    return element.isWidget;
  }

  /// The presentation for this node.
  String? get widgetPresentationText {
    var element =
        constructorName.staticElement?.enclosingElement3.augmented.declaration;
    if (!element.isWidget) {
      return null;
    }
    var arguments = argumentList.arguments;
    if (element._isExactly('Icon', _uriWidgetsIcon)) {
      if (arguments.isNotEmpty) {
        var text = arguments[0].toString();
        var arg = shorten(text, 32);
        return 'Icon($arg)';
      } else {
        return 'Icon';
      }
    }
    if (element._isExactly('Text', _uriWidgetsText)) {
      if (arguments.isNotEmpty) {
        var text = arguments[0].toString();
        var arg = shorten(text, 32);
        return 'Text($arg)';
      } else {
        return 'Text';
      }
    }
    return element?.name;
  }
}

extension InterfaceElementExtension on InterfaceElement? {
  /// Whether this is the Flutter class `Alignment`.
  bool get isExactAlignment {
    return _isExactly('Alignment', _uriAlignment);
  }

  /// Whether this is the Flutter class `AlignmentDirectional`.
  bool get isExactAlignmentDirectional {
    return _isExactly('AlignmentDirectional', _uriAlignment);
  }

  /// Whether this is the Flutter class `AlignmentGeometry`.
  bool get isExactAlignmentGeometry {
    return _isExactly('AlignmentGeometry', _uriAlignment);
  }

  /// Whether this is the Flutter class `Widget`, or a subtype.
  bool get isWidget {
    var self = this;
    if (self is! ClassElement) {
      return false;
    }
    if (_isExactly(_nameWidget, _uriFramework)) {
      return true;
    }
    return self.allSupertypes
        .any((type) => type.element._isExactly(_nameWidget, _uriFramework));
  }

  /// Whether this has a supertype with the [requiredName] defined in the file
  /// with the [requiredUri].
  bool _hasSupertype(Uri requiredUri, String requiredName) {
    var self = this;
    if (self == null) {
      return false;
    }
    for (var type in self.allSupertypes) {
      if (type.element.name == requiredName) {
        var uri = type.element.source.uri;
        if (uri == requiredUri) {
          return true;
        }
      }
    }
    return false;
  }

  /// Whether this is the exact [type] defined in the file with the given [uri].
  bool _isExactly(String type, Uri uri) {
    var self = this;
    return self is ClassElement && self.name == type && self.source.uri == uri;
  }
}
