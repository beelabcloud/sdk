// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// @dart=2.9
/*@testedFeatures=inference*/
library test;

test() async {
  String s;
  for (int x in s) {}
  await for (int x in s) {}
  int y;
  for (y in s) {}
  await for (y in s) {}
}

main() {}
