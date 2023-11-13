// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'common/service_test_common.dart';
import 'common/test_helper.dart';

// AUTOGENERATED START
//
// Update these constants by running:
//
// dart pkg/vm_service/test/update_line_numbers.dart <test.dart>
//
const LINE_A = 23;
// AUTOGENERATED END

const file = 'next_through_operator_bracket_on_this_test.dart';

class Class2 {
  int operator [](int index) => index;

  int code() {
    this[42]; // LINE_A
    return this[42];
  }
}

void code() {
  final c = Class2();
  c[42];
  c.code();
}

final stops = <String>[];
const expected = <String>[
  '$file:${LINE_A + 0}:9', // on '['
  '$file:${LINE_A + 1}:16', // on '['
  '$file:${LINE_A + 1}:5', // on 'return'
];

final tests = <IsolateTest>[
  hasPausedAtStart,
  setBreakpointAtLine(LINE_A),
  runStepThroughProgramRecordingStops(stops),
  checkRecordedStops(stops, expected),
];

void main([args = const <String>[]]) => runIsolateTests(
      args,
      tests,
      'next_through_operator_bracket_on_this_test.dart',
      testeeConcurrent: code,
      pauseOnStart: true,
      pauseOnExit: true,
    );
