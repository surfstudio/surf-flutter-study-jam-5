import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:meme_generator/assets/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.test).existsSync(), isTrue);
  });
}