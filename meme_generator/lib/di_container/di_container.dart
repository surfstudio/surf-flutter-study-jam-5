import 'package:flutter/material.dart';
import 'package:meme_generator/main.dart';
import 'package:meme_generator/routers/routes.dart';
import 'package:meme_generator/screen/widgets/app/my_app.dart';

AppFactory makeAppFactory() => _AppFactoryDefault();

class _AppFactoryDefault implements AppFactory {
  final _diContainer = _DiContainer();
  @override
  Widget makeApp() => MyApp(
        navigation: _diContainer._mainNavigation,
      );
}

class _DiContainer {
  final MainNavigation _mainNavigation = MainNavigation();

  _DiContainer();
}
