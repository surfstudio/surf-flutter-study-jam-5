import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meme_generator/ui/pages/generate_image_page.dart';
import 'package:meme_generator/model/model.dart';
import 'package:meme_generator/viewcontroller/slider_controller.dart';
import 'package:meme_generator/viewmodel/shape_model.dart';
import 'package:meme_generator/viewmodel/sliders_colors.dart';
import 'package:rxdart/rxdart.dart';

double maxWidth = (1.sw < 400) ? 1.sw : 1.sw / 2;
const minWidth = 50.0;
double maxHeight = (1.sw < 400) ? 1.sw : 1.sh - 30.w;
const minHeight = 50.0;
const minBorderRadius = 0;
double maxBorderRadius = maxHeight / 2;


const animateDuration = Duration(milliseconds: 200);

class GenerateImageWidgetModel extends WidgetModel<GenerateImage, GenerateImageModel> {
  GenerateImageWidgetModel(super.model);
   bool isEditing=false;
  @override
  ValueListenable<EntityState<bool>> get valueState => _valueController;

  late EntityStateNotifier<bool> _valueController;

  final widthController =
      SliderController(initialData: 0, animateDuration: animateDuration);
  final heightController =
      SliderController(initialData: 0, animateDuration: animateDuration);
  final opacityController =
      SliderController(initialData: 0, animateDuration: animateDuration);
  final borderRadiusController =
      SliderController(initialData: 0, animateDuration: animateDuration);


  final _shapeController = BehaviorSubject<ShapeMetrics>.seeded(
    const ShapeMetrics(
      size: Size(50, 50),
      borderRadius: 5,
      opacity: 1,
      finalAngle: 90,
    ),
  );

  final _slidersColorsController = BehaviorSubject<SlidersColors>.seeded(
    const SlidersColors(
      opacity: Colors.white,
      borderRadius: Colors.white,
      height: Colors.white,
      width: Colors.white,
    ),
  );


  final _isLoadingShapeController = BehaviorSubject<bool>.seeded(true);


  Stream<ShapeMetrics> get shapeStream => _shapeController.stream;

  ShapeMetrics get shapeValue => _shapeController.value;

  Stream<SlidersColors> get slidersColorsStream =>
      _slidersColorsController.stream;

  SlidersColors get slidersColorsValue => _slidersColorsController.value;

  Stream<bool> get isLoadingShapeStream =>
      _isLoadingShapeController.stream.distinct();

  bool get isLoadingShapeValue => _isLoadingShapeController.value;


  @override
  void increment() {
    _valueController.loading();

    final newVal = model.setEditing();

    _valueController.content(newVal);
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    unawaited(generateNewShape());
    widthController.stream.listen(setWidth);
    heightController.stream.listen(setHeight);
    opacityController.stream.listen(setOpacity);
    borderRadiusController.stream.listen(setBorderRadius);
    _valueController = EntityStateNotifier<bool>.value(model.value);
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
    unawaited(_shapeController.close());
    unawaited(_slidersColorsController.close());
  }

  void setEdit(double factor) {
    if (isLoadingShapeValue) return;
    isEditing=!isEditing;
    print(isEditing);
  }


  void setAngle(double factor) {
    if (isLoadingShapeValue) return;
    _shapeController.add(shapeValue.copyWith(
        finalAngle: factor));
  }

  void setWidth(double factor) {
    if (isLoadingShapeValue) return;
    final maxDiff = maxWidth - minWidth;
    _shapeController.add(shapeValue.copyWith(
        size: Size(minWidth + maxDiff * factor, shapeValue.size.height)));
  }

  void setHeight(double factor) {
    if (isLoadingShapeValue) return;
    final maxDiff = maxHeight - minHeight;
    _shapeController.add(shapeValue.copyWith(
        size: Size(shapeValue.size.width, minHeight + maxDiff * factor)));
  }

  void setBorderRadius(double factor) {
    if (isLoadingShapeValue) return;
    final maxDiff = shapeValue.size.shortestSide - minBorderRadius;
    _shapeController.add(shapeValue.copyWith(
        borderRadius: minBorderRadius + maxDiff * factor / 2));
  }

 /* void setColor(double factor) {
    if (isLoadingShapeValue) return;
    _shapeController
        .add(shapeValue.copyWith(color: MultiColorTween().lerp(factor)));
  }*/

  void setOpacity(double factor) {
    if (isLoadingShapeValue) {
      return;
    }
    _shapeController.add(shapeValue.copyWith(opacity: factor));
  }

  Future<void> generateNewShape() async {
    _isLoadingShapeController.add(true);
    final newShapeDto = await model.getNewShape();
    _shapeController.add(ShapeMetrics.fromDto(newShapeDto));
    widthController.add(newShapeDto.width);
    heightController.add(newShapeDto.height);
    opacityController.add(newShapeDto.opacity);
    borderRadiusController.add(newShapeDto.borderRadius);
    _isLoadingShapeController.add(false);
  }

  void generateNewSlidersColors()  {
    final newSlidersColors = model.getSlidersColors();
    _slidersColorsController.add(SlidersColors.fromDto(newSlidersColors));
  }
}
