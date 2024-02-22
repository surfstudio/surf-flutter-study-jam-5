import 'package:analytics/core/analytyc_service.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator/common/utils/analytics/event/common/track_analytics_example.dart';
import 'package:meme_generator/features/app/di/app_scope.dart';
import 'package:meme_generator/features/common/utils/mixin/localization_mixin.dart';
import 'package:meme_generator/features/common/utils/mixin/theme_mixin.dart';
import 'package:meme_generator/features/dash/presentation/dash_model.dart';
import 'package:meme_generator/features/dash/presentation/dash_screen.dart';
import 'package:provider/provider.dart';

/// Factory for [DashWidgetModel].
DashWidgetModel dashScreenWmFactory(
  BuildContext context,
) {
  final scope = context.read<IAppScope>();
  final model = DashModel();

  return DashWidgetModel(
    model: model,
    analyticsService: scope.analyticsService,
  );
}

/// Widget model for [DashScreen].
class DashWidgetModel extends WidgetModel<DashScreen, DashModel>
    with LocalizationMixin, ThemeWMMixin
    implements IDashWidgetModel {
  final AnalyticService _analyticsService;

  /// Create an instance [DashWidgetModel].
  DashWidgetModel({
    required DashModel model,
    required AnalyticService analyticsService,
  })  : _analyticsService = analyticsService,
        super(model);

  @override
  void trackAnalyticsExample() {
    _analyticsService.performAction(const TrackAnalyticsExampleEvent());
  }
}

/// Interface for [DashWidgetModel].
abstract class IDashWidgetModel with ILocalizationMixin, ThemeIModelMixin implements IWidgetModel {
  /// Sending an analytics event
  void trackAnalyticsExample();
}
