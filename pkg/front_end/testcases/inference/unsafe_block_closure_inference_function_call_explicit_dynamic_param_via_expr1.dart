// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// @dart=2.9
/*@testedFeatures=inference*/
library test;

List<T> f<T>(T g()) => <T>[g()];
var v = (f<dynamic>)(/*@returnType=int**/() {
  return 1;
});

main() {}
