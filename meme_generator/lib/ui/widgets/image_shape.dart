import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meme_generator/shape.dart';
import 'package:meme_generator/widgetmodels/widget_model.dart';

class ImageShape extends StatelessWidget {
  final Size size;
  final double opacity;
  final double borderRadius;
  final double finalAngle;
  final GenerateImageWidgetModel wm;

  const ImageShape({required this.size,
    required this.opacity,
    required this.borderRadius,
    required this.finalAngle,
    required this.wm,
    super.key,});


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanUpdate: (details) {
          Offset centerOfGestureDetector =
          Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);
          final touchPositionFromCenter =
              details.localPosition - centerOfGestureDetector;
          print(touchPositionFromCenter.direction * 180 / pi);
wm.setAngle(touchPositionFromCenter.direction);
          //finalAngle = touchPositionFromCenter.direction;
        },
        child: Transform.rotate(
            angle: finalAngle,
            child: SomeShape(
              width: size.width,
              height: size.height,
              opacity: opacity,
              borderRadius: borderRadius,
              finalAngle: finalAngle,
            ),
        ),
      );
    });
  }
}
