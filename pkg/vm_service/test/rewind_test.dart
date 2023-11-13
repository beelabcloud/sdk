// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:test/test.dart';
import 'package:vm_service/vm_service.dart';

import 'common/service_test_common.dart';
import 'common/test_helper.dart';

// AUTOGENERATED START
//
// Update these constants by running:
//
// dart pkg/vm_service/test/update_line_numbers.dart <test.dart>
//
const LINE_0 = 39;
const LINE_A = 41;
const LINE_B = 46;
const LINE_C = 49;
const LINE_D = 53;
// AUTOGENERATED END

int global = 0;

@pragma('vm:never-inline')
int b3(int x) {
  int sum = 0;
  try {
    for (int i = 0; i < x; i++) {
      sum += x;
    }
  } catch (e) {
    print('caught $e');
  }
  if (global >= 100) {
    debugger(); // LINE_0.
  }
  global = global + 1; // LINE_A.
  return sum;
}

@pragma('vm:prefer-inline')
int b2(x) => b3(x); // LINE_B.

@pragma('vm:prefer-inline')
int b1(x) => b2(x); // LINE_C.

void test() {
  while (true) {
    b1(10000); // LINE_D.
  }
}

final tests = <IsolateTest>[
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_0),
  stepOver,
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_A),
  (VmService service, IsolateRef isolateRef) async {
    final isolateId = isolateRef.id!;
    // We are not able to rewind frame 0.
    bool caughtException = false;
    try {
      await service.resume(
        isolateId,
        step: StepOption.kRewind,
        frameIndex: 0,
      );
      fail('Unreachable');
    } on RPCError catch (e) {
      caughtException = true;
      expect(e.code, RPCErrorKind.kIsolateCannotBeResumed.code);
      expect(e.details, 'Frame must be in bounds [1..8]: saw 0');
    }
    expect(caughtException, true);
  },
  (VmService service, IsolateRef isolateRef) async {
    final isolateId = isolateRef.id!;
    // We are not able to rewind frame 13.
    bool caughtException = false;
    try {
      await service.resume(
        isolateId,
        step: StepOption.kRewind,
        frameIndex: 13,
      );
      fail('Unreachable');
    } on RPCError catch (e) {
      caughtException = true;
      expect(e.code, RPCErrorKind.kIsolateCannotBeResumed.code);
      expect(e.details, 'Frame must be in bounds [1..8]: saw 13');
    }
    expect(caughtException, true);
  },
  (VmService service, IsolateRef isolateRef) async {
    final isolateId = isolateRef.id!;
    final isolate = await service.getIsolate(isolateId);
    final rootLibId = isolate.rootLib!.id!;

    // We are at our breakpoint with global=100.
    final result = await service.evaluate(
      isolateId,
      rootLibId,
      'global',
    ) as InstanceRef;
    print('global is $result');
    expect(result.valueAsString, '100');

    // Rewind the top stack frame.
    await service.resume(isolateId, step: StepOption.kRewind, frameIndex: 1);
  },
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_B),
  resumeIsolate,
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_0),
  stepOver,
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_A),
  (VmService service, IsolateRef isolateRef) async {
    final isolateId = isolateRef.id!;
    final isolate = await service.getIsolate(isolateId);
    final rootLibId = isolate.rootLib!.id!;

    // global still is equal to 100.  We did not execute 'global++'.
    final result = await service.evaluate(
      isolateId,
      rootLibId,
      'global',
    ) as InstanceRef;
    print('global is $result');
    expect(result.valueAsString, '100');

    // Rewind up to 'test'/
    await service.resume(isolateId, step: StepOption.kRewind, frameIndex: 3);
  },
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_D),
  (VmService service, IsolateRef isolateRef) async {
    final isolateId = isolateRef.id!;
    final isolate = await service.getIsolate(isolateId);
    final rootLibId = isolate.rootLib!.id!;

    // Reset global to 0 and start again.
    final result = await service.evaluate(
      isolateId,
      rootLibId,
      'global = 0',
    ) as InstanceRef;
    expect(result.valueAsString, '0');
  },
  resumeIsolate,
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_0),
  stepOver,
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_A),
  (VmService service, IsolateRef isolateRef) async {
    final isolateId = isolateRef.id!;
    final isolate = await service.getIsolate(isolateId);
    final rootLibId = isolate.rootLib!.id!;

    // We are at our breakpoint with global=100.
    final result = await service.evaluate(
      isolateId,
      rootLibId,
      'global',
    ) as InstanceRef;
    print('global is $result');
    expect(result.valueAsString, '100');

    // Rewind the top 2 stack frames.
    await service.resume(isolateId, step: StepOption.kRewind, frameIndex: 2);
  },
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_C),
];

void main([args = const <String>[]]) => runIsolateTests(
      args,
      tests,
      'rewind_test.dart',
      testeeConcurrent: test,
      extraArgs: [
        '--trace-rewind',
        '--no-prune-dead-locals',
        '--no-background-compilation',
        '--optimization-counter-threshold=10',
      ],
    );
