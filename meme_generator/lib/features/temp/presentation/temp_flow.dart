import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator/common/widgets/di_scope/di_scope.dart';
import 'package:meme_generator/features/navigation/domain/entity/app_route_names.dart';
import 'package:meme_generator/features/temp/di/temp_scope.dart';
import 'package:meme_generator/features/temp/presentation/screens/temp/temp_screen.dart';

/// {@template temp_flow.class}
/// Entry of temp feature.
/// {@endtemplate}
@RoutePage(name: AppRouteNames.tempScreen)
class TempFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro temp_flow.class}
  const TempFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<ITempScope>(
      factory: TempScope.create,
      dispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const TempScreen();
  }
}
