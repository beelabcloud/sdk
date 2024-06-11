// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

abstract class A {
  const A();
  const factory A.redir() = B;
}

class B extends A {
  const B();
}

class C {
  C({A a = const A.redir()});

  factory C.f({A a = const A.redir()}) => C(a: a);

  const C.c({A a = const A.redir()});

  foo({A a = const A.redir()}) {}

  static bar ({A a = const A.redir()}) {}
}

extension E on C {
  foo({A a = const A.redir()}) {}
}

extension type ET(C c) {
  ET.named(C c, {A a = const A.redir()}) : this(c);

  foo({A a = const A.redir()}) {}
}

foo({A a = const A.redir()}) {}
