import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/screen/widgets/shared_content.dart';
import 'package:meme_generator/stores/text_and_image_handler.dart';
import 'package:meme_generator/theme/colors.dart';

class MemeGeneratorScreen extends StatelessWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.mainWhite,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Meme From Scratch',
          style: TextStyle(
            color: AppColors.mainWhite,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: gradientDecoration(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: mainPadding,
              child: Column(
                children: [
                  _MemePlaceHolder(decoration: decoration),
                  const InputFieldWithAutoDisplay(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MemePlaceHolder extends StatelessWidget {
  const _MemePlaceHolder({
    required this.decoration,
  });

  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    final textAndImageHolder = getIt<TextAndImageHandler>();
    return ColoredBox(
      color: Colors.black,
      child: DecoratedBox(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: DecoratedBox(
                  decoration: decoration,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RepaintBoundary(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://i.cbc.ca/1.6713656.1679693029!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/this-is-fine.jpg',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) => Text(
                  textAndImageHolder.inputText.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Impact',
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputFieldWithAutoDisplay extends StatefulWidget {
  const InputFieldWithAutoDisplay({super.key});

  @override
  InputFieldWithAutoDisplayState createState() =>
      InputFieldWithAutoDisplayState();
}

class InputFieldWithAutoDisplayState extends State<InputFieldWithAutoDisplay> {
  String _userInput = '';

  @override
  Widget build(BuildContext context) {
    final textHolder = getIt<TextAndImageHandler>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onChanged: (value) {
            textHolder.tappingText(value);
            // setState(() {
            //   _userInput = value;
            // });
          },
          decoration: const InputDecoration(
            hintText: 'Type something...',
          ),
        ),
        // const SizedBox(height: 20),
        // Text(
        //   'You typed: $_userInput',
        //   style: const TextStyle(fontSize: 20),
        // ),
      ],
    );
  }
}
