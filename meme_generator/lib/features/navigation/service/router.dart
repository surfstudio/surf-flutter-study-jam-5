import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator/features/navigation/domain/entity/app_route_paths.dart';

part 'router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

/// Main point of the application navigation.
@AutoRouterConfig(
  replaceInRouteName: 'Flow,Route',
)
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        // TODO: add routes
        ///   AutoRoute(
        ///    page: TempRouter.page,
        ///    initial: true,
        ///    path: AppRoutePaths.tempPath,
      ];

  AppRouter._();

  /// Singleton instance of [AppRouter].
  factory AppRouter.instance() => _router;
}
