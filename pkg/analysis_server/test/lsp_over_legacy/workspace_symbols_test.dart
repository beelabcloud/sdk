// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/src/test_utilities/test_code_format.dart';
import 'package:test/test.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import 'abstract_lsp_over_legacy.dart';

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(WorkspaceSymbolsTest);
  });
}

@reflectiveTest
class WorkspaceSymbolsTest extends LspOverLegacyTest {
  Future<void> test_symbols() async {
    var content = '''
class Aaa {}
''';
    var code = TestCode.parse(content);
    newFile(testFilePath, code.code);
    var results = await getWorkspaceSymbols('Aa');
    var names = results.map((result) => result.name);

    expect(names, contains('Aaa'));
  }
}
