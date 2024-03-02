
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator/model/app_error_handler.dart';
import 'package:meme_generator/model/model.dart';
import 'package:meme_generator/widgetmodels/widget_model.dart';

GenerateImageWidgetModel generateImagePageWidgetModelFactory(BuildContext context){
return GenerateImageWidgetModel(GenerateImageModel(AppErrorHandler()));
}
