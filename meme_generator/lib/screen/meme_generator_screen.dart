import 'package:meme_generator/widgets/imageRotateWidget.dart';
import 'package:meme_generator/widgets/textEditorWidget.dart';
import 'package:meme_generator/widgets/url_text_field.dart';
import 'package:flutter/material.dart';

class MemeGeneratorScreen extends StatelessWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(width: double.infinity, child: ImageRotateWidget()),
          //child: Image.asset('assets/story.png')),
          PositionedText(),
        ],
      ),
      floatingActionButton: FloatingActionButtonImpl(),
    );
  }
}
