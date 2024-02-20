import 'package:flutter/material.dart';
import 'package:meme_generator/screen/meme_generator_screen.dart';
import 'package:meme_generator/data/image_url.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageUrl>(
      create: (context) => ImageUrl(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MemeGeneratorScreen(),
      ),
    );
  }
}