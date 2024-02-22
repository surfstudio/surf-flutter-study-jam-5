import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator/common/widgets/di_scope/di_scope.dart';
import 'package:meme_generator/features/info/di/info_scope.dart';
import 'package:meme_generator/features/info/presentation/screens/info/info_screen.dart';
import 'package:meme_generator/features/navigation/domain/entity/app_route_names.dart';

/// {@template info_flow.class}
/// Entry of info feature.
/// {@endtemplate}
@RoutePage(name: AppRouteNames.infoScreen)
class InfoFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro info_flow.class}
  const InfoFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IInfoScope>(
      factory: InfoScope.create,
      dispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const InfoScreen();
  }
}