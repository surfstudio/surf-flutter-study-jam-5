import 'dart:math';

import 'package:elementary/elementary.dart';
import 'package:meme_generator/dto/shape_metriks_from_dto.dart';
import 'package:meme_generator/dto/sliders_colors_dto.dart';


class GenerateImageModel extends ElementaryModel {
  final _rnd = Random();
  bool get value => _value;
  var _value = false;


  GenerateImageModel(ErrorHandler errorHandler) : super(errorHandler: errorHandler);

  bool setEditing() {
    return _value = !_value;
  }

  Future<ShapeMetricFactorsDto> getNewShape() async {
    return Future.delayed(const Duration(seconds: 1)).then(
          (_) {
        return ShapeMetricFactorsDto(
          height: _rnd.nextDouble(),
          width: _rnd.nextDouble(),
          opacity: _rnd.nextDouble(),
          borderRadius: _rnd.nextDouble(),
          finalAngle: 0,
        );
      },
    );
  }

  SlidersColorFactorsDto getSlidersColors() {
    return SlidersColorFactorsDto(
      height: _rnd.nextDouble(),
      width: _rnd.nextDouble(),
      opacity: _rnd.nextDouble(),
      borderRadius: _rnd.nextDouble(),
    );
  }
}

