import 'package:flutter/material.dart';
import 'package:meme_generator/di_container/di_container.dart';

abstract class AppFactory {
  Widget makeApp();
}

final appFactory = makeAppFactory();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = appFactory.makeApp();
  initStores();

  runApp(app);
}
