// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

typedef Typedef1<T1 extends B1> = void Function<T2 extends B2>(T1, T2);

C1 topLevelField;

class Class<T3 extends B3> extends S<T3> with M<T3> implements I<T3> {
  C2 instanceField;
  Class(T3 t3);
  factory Class.fact(T3 t3) = Class;
  void instanceMethod<T4 extends B4>(T3 t3, T4 t4) {}
  static C3 staticField;
  static void staticMethod<T5 extends B5>(T5 t5) {}
}

mixin Mixin<T6 extends B6> on S<T6> implements I<T6> {
  C4 instanceField;
  void instanceMethod<T7 extends B7>(T6 t6, T7 t7) {}
  static C5 staticField;
  static void staticMethod<T8 extends B8>(T8 t8) {}
}

class NamedMixinApplication<T9 extends B9> = Class<T9> with Mixin<T9>;

enum Enum<T10 extends B10> with M<T10> implements I<T10> {
  a<int>(0);

  const Enum(T10 T10);
  factory Enum.fact(T10 T10) => throw '';
  void instanceMethod<T11 extends B11>(T10 T10, T11 t11) {}
  static C6 staticField;
  static void staticMethod<T12 extends B12>(T12 t12) {}
}

extension Extension<T13 extends B13> on Class<T13> {
  void instanceMethod<T14 extends B14>(T13 t13, T14 t14) {}
  static C7 staticField;
  static void staticMethod<T15 extends B15>(T15 t15) {}
}

extension type ExtensionType<T16 extends B16>(T16 t16) implements ET<T16> {
  ExtensionType.cons(T16 t16) : this(t16);
  factory ExtensionType.fact(T16 t16) = ExtensionType;
  void instanceMethod<T17 extends B17>(T16 t16, T17 t17) {}
  static C8 staticField;
  static void staticMethod<T18 extends B18>(T18 t18) {}
}

void topLevelMethod<T19 extends B19>(T19 t19) {}

typedef void Typedef2<T20 extends B20>(T20 t20);

// Helper typedefs:

typedef B1 = dynamic;
typedef B2 = dynamic;
typedef B3 = dynamic;
typedef B4 = dynamic;
typedef B5 = dynamic;
typedef B6 = dynamic;
typedef B7 = dynamic;
typedef B8 = dynamic;
typedef B9 = dynamic;
typedef B10 = dynamic;
typedef B11 = dynamic;
typedef B12 = dynamic;
typedef B13 = dynamic;
typedef B14 = dynamic;
typedef B15 = dynamic;
typedef B16 = dynamic;
typedef B17 = dynamic;
typedef B18 = dynamic;
typedef B19 = dynamic;
typedef B20 = dynamic;

typedef C1 = dynamic;
typedef C2 = dynamic;
typedef C3 = dynamic;
typedef C4 = dynamic;
typedef C5 = dynamic;
typedef C6 = dynamic;
typedef C7 = dynamic;
typedef C8 = dynamic;

class S<X1> {}

mixin M<X2> {}

class I<X3> {}

extension type ET<X4 extends dynamic>(X4 x4) {}
