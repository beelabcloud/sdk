// Copyright (c) 2019, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/src/dart/analysis/experiments.dart';
import 'package:analyzer/src/error/codes.dart';
import 'package:analyzer/src/generated/engine.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../dart/resolution/driver_resolution.dart';

main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(UnnecessaryNullAwareCallTest);
  });
}

@reflectiveTest
class UnnecessaryNullAwareCallTest extends DriverResolutionTest {
  @override
  AnalysisOptionsImpl get analysisOptions =>
      AnalysisOptionsImpl()..enabledExperiments = [EnableString.non_nullable];

  test_getter_legacy() async {
    newFile('/test/lib/a.dart', content: r'''
// @dart = 2.5
var x = 0;
''');

    await assertNoErrorsInCode('''
import 'a.dart';

f() {
  x?.isEven;
}
''');
  }

  test_getter_nonNullable() async {
    await assertErrorsInCode('''
f(int x) {
  x?.isEven;
}
''', [
      error(StaticWarningCode.UNNECESSARY_NULL_AWARE_CALL, 14, 2),
    ]);
  }

  test_getter_nullable() async {
    await assertNoErrorsInCode('''
f(int? x) {
  x?.isEven;
}
''');
  }

  test_method_legacy() async {
    newFile('/test/lib/a.dart', content: r'''
// @dart = 2.5
var x = 0;
''');

    await assertNoErrorsInCode('''
import 'a.dart';

f() {
  x?.round();
}
''');
  }

  test_method_nonNullable() async {
    await assertErrorsInCode('''
f(int x) {
  x?.round();
}
''', [
      error(StaticWarningCode.UNNECESSARY_NULL_AWARE_CALL, 14, 2),
    ]);
  }

  test_method_nullable() async {
    await assertNoErrorsInCode('''
f(int? x) {
  x?.round();
}
''');
  }
}
