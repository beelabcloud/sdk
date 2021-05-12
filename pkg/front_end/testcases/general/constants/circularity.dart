// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// @dart=2.9
const int a = b;
const int b = a;
const int c = d;
const int d = e + 1;
const int e = d - 1;

class Class1 {
  const Class1({Class1 c = const Class1(c: null)});
}

const Class1 c1_0 = const Class1();
const Class1 c1_1 = const Class1(c: null);
const Class1 c1_2 = const Class1();

class Class2 {
  final Class2 field;
  const Class2(int value) : field = value == 0 ? null : const Class2(0);
}

const Class2 c2_0 = const Class2(1);
const Class2 c2_1 = const Class2(0);
const Class2 c2_2 = const Class2(1);

class Class3 {
  const Class3([Class3 c = c3_1]);
}

const Class3 c3_0 = const Class3();
const Class3 c3_1 = const Class3(c3_2);
const Class3 c3_2 = const Class3(null);

class Class4 {
  const Class4({Class4 c = const Class4()});
}

const Class4 c4_0 = const Class4();
const Class4 c4_1 = const Class4(c: null);

main() {}
