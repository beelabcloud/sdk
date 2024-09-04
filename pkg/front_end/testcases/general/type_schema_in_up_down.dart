// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class A<X extends A<X>> {
  A(X x);
}

test<Y extends A<Y>>(Y y) {
  A<Object?> a = new A(y);
}
