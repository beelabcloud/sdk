// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

import 'package:analysis_server/src/services/correction/fix.dart';
import 'package:analyzer/src/error/codes.dart';
import 'package:analyzer_plugin/utilities/fixes/fixes.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import 'fix_processor.dart';

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(UseNotEqNullMultiTest);
    defineReflectiveTests(UseNotEqNullTest);
  });
}

@reflectiveTest
class UseNotEqNullMultiTest extends FixProcessorTest {
  @override
  FixKind get kind => DartFixKind.USE_NOT_EQ_NULL_MULTI;

  Future<void> test_isNotNull_all() async {
    await resolveTestCode('''
main(p, q) {
  p is! Null;
  q is! Null;
}
''');
    await assertHasFixAllFix(HintCode.TYPE_CHECK_IS_NOT_NULL, '''
main(p, q) {
  p != null;
  q != null;
}
''');
  }
}

@reflectiveTest
class UseNotEqNullTest extends FixProcessorTest {
  @override
  FixKind get kind => DartFixKind.USE_NOT_EQ_NULL;

  Future<void> test_isNotNull() async {
    await resolveTestCode('''
main(p) {
  p is! Null;
}
''');
    await assertHasFix('''
main(p) {
  p != null;
}
''');
  }
}
