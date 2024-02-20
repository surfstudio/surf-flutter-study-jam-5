import 'dart:io';

import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:meme_generator/data/model/meme_type/meme_type_model.dart';
import 'package:meme_generator/widgets/animated_pictures_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

// Экран формирования мема
class MemeGeneratorScreen extends StatefulWidget {
  const MemeGeneratorScreen({
    Key? key,
    required this.pattern,
    required this.images,
  }) : super(key: key);
  // Сначала передавался паттерн мема, затем добавилась возвможность свайпа фона,
  final MemeTypeModel pattern;
  final List<String> images;
  @override
  State<MemeGeneratorScreen> createState() => _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  late final GlobalKey previewContainer;

  @override
  void initState() {
    super.initState();
    previewContainer = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(
            key: previewContainer,
            child: ColoredBox(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedPictureWidget(
                        images: widget.images,
                        backgroundImage: widget.pattern.backgroundImage,
                      ),
                      TextField(
                        cursorColor: Colors.white,
                        showCursor: true,
                        autofocus: true,
                        textAlign: TextAlign.left,
                        minLines: 3,
                        maxLines: 3,
                        style: const TextStyle(
                          fontFamily: 'Impact',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          hintText: widget.pattern.initialText,
                          hintStyle: TextStyle(
                            fontFamily: 'Impact',
                            fontSize: 25,
                            color: Colors.white.withOpacity(0.6),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Text(
            'Tap to the text to change it',
            style: TextStyle(
              fontFamily: 'Impact',
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              screenShotAndShare(context);
            },
            icon: const Icon(Icons.share),
            label: const Text('Share'),
          ),
        ],
      ),
    );
  }

  Future<void> screenShotAndShare(BuildContext context) async {
    bool debugNeedsPaint = false;
    try {
      RenderRepaintBoundary? boundary = previewContainer.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      if (kDebugMode) {
        debugNeedsPaint = boundary!.debugNeedsPaint;
      }
      if (debugNeedsPaint) {
        await Future.delayed(const Duration(milliseconds: 200));
        // ignore: use_build_context_synchronously
        return screenShotAndShare(context);
      }
      ui.Image image = await boundary!.toImage(pixelRatio: 4.0);
      final directory = Platform.isAndroid
          ? (await getExternalStorageDirectory())!.path //FOR ANDROID
          : (await getApplicationSupportDirectory()).path; //FOR iOS
      ByteData? byteData =
          await (image.toByteData(format: ui.ImageByteFormat.png));
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      File imgFile = File('$directory/screenshot.png');
      await imgFile.writeAsBytes(pngBytes);
      AppinioSocialShare().shareToTelegram('Cucu', filePaths: [imgFile.path]);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Exception while taking screenshot:$e");
      }
    }
  }
}
