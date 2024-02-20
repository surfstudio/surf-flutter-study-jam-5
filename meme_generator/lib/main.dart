import 'package:flutter/material.dart';
import 'package:meme_generator/routers/routes.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/stores/init_store.dart';
import 'package:meme_generator/theme/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initStores();

  runApp(const MyApp());
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: snackbarKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        iconTheme: const IconThemeData(
          color: AppColors.mainWhite, //change your color here
        ),
      ),
      routerConfig: router,
    );
  }
}
