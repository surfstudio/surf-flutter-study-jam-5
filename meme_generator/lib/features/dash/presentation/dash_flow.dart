import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator/common/widgets/di_scope/di_scope.dart';
import 'package:meme_generator/features/dash/di/dash_scope.dart';
import 'package:meme_generator/features/dash/presentation/dash_screen.dart';
import 'package:meme_generator/features/navigation/domain/entity/app_route_names.dart';

/// {@template dash_flow.class}
/// Entry of dash feature.
/// {@endtemplate}
@RoutePage(name: AppRouteNames.dashScreen)
class DashFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro dash_flow.class}
  const DashFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IDashScope>(
      factory: DashScope.create,
      dispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DashScreen();
  }
}
