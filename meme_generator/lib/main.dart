import 'package:flutter/material.dart';
import 'package:meme_generator/di_container/di_container.dart';
import 'package:meme_generator/routers/routes.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/stores/init_store.dart';
import 'package:meme_generator/theme/colors.dart';

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
