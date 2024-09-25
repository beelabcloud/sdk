// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=inference-using-bounds

class A<X extends A<X>> {}

class B extends A<B> {}

class C extends B {}

X f<X extends A<X>>(X x) => x;

void main() {
  f(B());
  f(C())..expectStaticType<Exactly<B>>();
  f<B>(C());
}

typedef Exactly<X> = X Function(X);

extension E<X> on X {
  void expectStaticType<Y extends Exactly<X>>() {}
}
