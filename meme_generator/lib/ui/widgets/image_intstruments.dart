import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meme_generator/ui/pages/generate_image_page.dart';
import 'package:meme_generator/ui/widgets/screen_horizontal_slider_widget.dart';
import 'package:meme_generator/widgetmodels/widget_model.dart';

class ImageInstruments extends GenerateImage {
  final GenerateImageWidgetModel wm2;

  const ImageInstruments({Key? key, required this.wm2}) : super(key: key);

  @override
  Widget build(GenerateImageWidgetModel wm) {

    bool isHandset = 1.sw < 400;
    return //super.build(wm);
        SizedBox(
      width: isHandset ? 1.sw : 1.sw / 2,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              Row(
                children: [
                  TextButton(
                      onPressed: wm2.generateNewShape,
                      child: const Text('Сгенерировать шаблон')),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Ширина'),
              ScreenHorizontalSliderWidget(
                indicatorSize: const Size(20, 20),
                controller: wm2.widthController,
                duration: const Duration(milliseconds: 500),
                screenWidth: constraints.maxWidth,
              ),
              const Text('Высота'),
              ScreenHorizontalSliderWidget(
                indicatorSize: const Size(20, 20),
                controller: wm2.heightController,
                duration: const Duration(milliseconds: 500),
                screenWidth: constraints.maxWidth,
              ),
              const Text('Радиус углов'),
              ScreenHorizontalSliderWidget(
                indicatorSize: const Size(20, 20),
                controller: wm2.borderRadiusController,
                duration: const Duration(milliseconds: 500),
                screenWidth: constraints.maxWidth,
              ),
              const Text('Прозрачность'),
              ScreenHorizontalSliderWidget(
                indicatorSize: const Size(20, 20),
                controller: wm2.opacityController,
                duration: const Duration(milliseconds: 500),
                screenWidth: constraints.maxWidth,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          );
        }),
      ),
    );
  }
}
