import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:meme_generator/features/app/app.dart';
import 'package:meme_generator/features/app/di/app_scope_register.dart';
import 'package:surf_logger/surf_logger.dart';

/// App launch.
Future<void> run() async {
  /// It must be called so that the orientation does not fall.
  WidgetsFlutterBinding.ensureInitialized();

  _initLogger();
  await _runApp();
}

Future<void> _runApp() async {
  final scopeRegister = AppScopeRegister();
  final scope = await scopeRegister.createScope();
  await scope.initTheme();
  runApp(App(scope));
}

void _initLogger() {
  Logger.addStrategy(DebugLogStrategy());
  Logger.addStrategy(RemoteLogStrategy());
}
