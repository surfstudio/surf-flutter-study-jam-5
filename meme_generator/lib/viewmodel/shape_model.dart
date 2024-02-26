import 'dart:ui';

import 'package:meme_generator/dto/shape_metriks_from_dto.dart';
import 'package:meme_generator/widgetmodels/widget_model.dart';

class ShapeMetrics {
  final double opacity;
  final double borderRadius;
  final Size size;
  final double finalAngle;

  const ShapeMetrics({
    required this.size,
    required this.opacity,
    required this.borderRadius,
    required this.finalAngle
  });

  factory ShapeMetrics.fromDto(ShapeMetricFactorsDto dto) {
    final width = (maxWidth - minWidth) * dto.width;
    final height = (maxHeight - minHeight) * dto.height;
    final size = Size(width, height);
    return ShapeMetrics(
      size: size,
      borderRadius: dto.borderRadius * size.shortestSide / 2,
      opacity: dto.opacity,
      finalAngle: dto.finalAngle,
    );
  }

  ShapeMetrics copyWith({
    Size? size,
    double? opacity,
    double? borderRadius,
    double? finalAngle,
  }) {
    return ShapeMetrics(
      size: size ?? this.size,
      opacity: opacity ?? this.opacity,
      borderRadius: borderRadius ?? this.borderRadius,
      finalAngle: finalAngle ?? this.finalAngle,
    );
  }
}

