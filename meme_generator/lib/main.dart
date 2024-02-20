import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:meme_generator/data/meme_patterns_repository/meme_pattern_repository_current.dart';
import 'package:meme_generator/data/meme_patterns_repository/meme_patterns_repository.dart';
import 'package:meme_generator/interactors/meme_patterns_interactor.dart';
import 'package:meme_generator/screen/meme_generator_start_scrren.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<IMemePatternsRepository>(
      create: (_) => MemePatternsRepository(),
      child: Provider(
        create: (context) => MemesPatternInteractor(
            repository: context.read<IMemePatternsRepository>()),
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Provider(
            create: (_) => ImagePickerBloc(),
            child: Builder(builder: (context) {
              return MemeGeneratorStartScreen(
                patterns: context.read<MemesPatternInteractor>().demotivators,
              );
            }),
          ),
          onGenerateRoute: (settings) {
            print(settings);
          },
        ),
      ),
    );
  }
}
