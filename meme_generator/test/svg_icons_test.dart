import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:meme_generator/assets/resources.dart';

void main() {
  test('svg_icons assets test', () {
    expect(File(SvgIcons.photoPlaceholder).existsSync(), isTrue);
    expect(File(SvgIcons.testSvg).existsSync(), isTrue);
  });
}
