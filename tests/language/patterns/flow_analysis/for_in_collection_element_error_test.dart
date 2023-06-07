// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "../../static_type_helper.dart";

test() {
  {
    // In a for-in collection element, if the element type of the iterable is
    // `dynamic`, then it's permissible for the pattern match to do a dynamic
    // downcast. But this does not promote the type of the iterable.
    var x = expr<List<dynamic>>();
    <Object>[for (var (int _) in x) expr<Object>()];
    x.expectStaticType<Exactly<List<dynamic>>>();
  }
}

T expr<T>() => throw UnimplementedError();

main() {}
