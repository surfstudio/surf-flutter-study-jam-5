import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meme_generator/ui/widgets/image_intstruments.dart';
import 'package:meme_generator/ui/widgets/image_shape.dart';
import 'package:meme_generator/viewmodel/shape_model.dart';
import 'package:meme_generator/widgetmodels/widget_model.dart';
import 'package:meme_generator/widgetmodels/widget_model_factory.dart';

class GenerateImage extends ElementaryWidget<GenerateImageWidgetModel> {
  const GenerateImage({
    Key? key,
    WidgetModelFactory wmFactory = generateImagePageWidgetModelFactory,
  }) : super(wmFactory, key: key);


  @override
  Widget build(GenerateImageWidgetModel wm) {
    bool isHandset = 1.sw < 400;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Flex(
            direction: isHandset ? Axis.vertical : Axis.horizontal,
            children: [
              Column(children: [
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                    height: isHandset ? 1.sw : 1.sh - 30.h,
                    width: isHandset ? 1.sw : 1.sw / 2,
                    child: Center(
                      child: StreamBuilder<bool>(
                          stream: wm.isLoadingShapeStream,
                          initialData: wm.isLoadingShapeValue,
                          builder: (context, isLoading) {
                            return StreamBuilder<ShapeMetrics>(
                                stream: wm.shapeStream,
                                initialData: wm.shapeValue,
                                builder: (context, ShapeMetrics) {
                                  final metriks = ShapeMetrics.requireData;
                                  if (isLoading.requireData) {
                                    return const CircularProgressIndicator(
                                      color: Colors.blueAccent,
                                    );
                                  }
                                  return ImageShape(wm:wm,
                                    size: metriks.size,
                                    opacity: metriks.opacity,
                                    borderRadius: metriks.borderRadius,
                                    finalAngle: metriks.finalAngle,
                                  );
                                });
                          }),
                    )),
                //if(isHandset) const Expanded(child: SizedBox.shrink()),
              ]),
              Column(
                children: [
                  EntityStateNotifierBuilder<bool>(
                  listenableEntityState: wm.valueState,

                  builder: (_, data) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextButton(onPressed:wm.increment ,
                             child: !data! ? const Text('Редактировать картинку') : const Text('Закрыть редактор'),
                          ),
                        ),
                        if(data!) ImageInstruments(wm2: wm)
                      ],
                    );
                  },
                ),


                ],
              )
              ,
            ],
          ),
        ),
      ),
    );
  }
}
class showEditImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text('data');
  }

}