import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:meme_generator/data/model/meme_type/meme_type_model.dart';
import 'package:meme_generator/screen/meme_generator_screen.dart';

// Начальный экран с выбором шаблона
class MemeGeneratorStartScreen extends StatelessWidget {
  final List<MemeTypeDemotivator> patterns;
  const MemeGeneratorStartScreen({super.key, required this.patterns});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          ' Привет! \n Выбери шаблон мема:',
          style: TextStyle(
            fontFamily: 'Mefika',
            fontSize: 25,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: patterns.length,
          itemBuilder: (context, index) {
            final mem = patterns[index];
            return Card(
              child: ColoredBox(
                color: Colors.black,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => ImagePickerBloc(),
                                  child: MemeGeneratorScreen(
                                    pattern: mem,
                                    images: patterns
                                        .map((e) => e.backgroundImage)
                                        .toList(),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: Image.asset(
                                mem.backgroundImage,
                              )),
                        ),
                        Text(
                          mem.initialText,
                          style: TextStyle(
                            fontFamily: 'Impact',
                            fontSize: 25,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ]),
    );
  }
}
