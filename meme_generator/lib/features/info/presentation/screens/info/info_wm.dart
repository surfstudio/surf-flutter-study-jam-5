import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator/features/common/utils/mixin/theme_mixin.dart';
import 'package:meme_generator/features/info/presentation/screens/info/info_model.dart';
import 'package:meme_generator/features/info/presentation/screens/info/info_screen.dart';

/// Factory for [InfoWidgetModel].
InfoWidgetModel infoScreenWmFactory(
  BuildContext context,
) {
  final model = InfoModel();
  return InfoWidgetModel(model);
}

/// Widget model for [InfoScreen].
class InfoWidgetModel extends WidgetModel<InfoScreen, InfoModel>
    with ThemeWMMixin
    implements IInfoWidgetModel {
  /// Create an instance [InfoWidgetModel].
  InfoWidgetModel(super._model);
}

/// Interface for [InfoWidgetModel].
abstract interface class IInfoWidgetModel with ThemeIModelMixin implements IWidgetModel {}
