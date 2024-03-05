import 'dart:developer' as devtool;

import 'package:http/http.dart' as http;
import 'package:meme_generator/screen/meme_from_scratch/meme_generator_screen.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:mobx/mobx.dart';

class TextHandler {
  final Observable<String> inputText = 'meme'.obs();
  final Observable<int> fontFlag = 1.obs();
  final Observable<double> fontSize = 25.0.obs();

  void tappingText(String text) => runInAction(() => inputText.value = text);

  void textScaleUp() {
    runInAction(() {
      if (fontSize.value >= 60) fontFlag.value = 2;
      if (fontFlag.value != 2) {
        fontFlag.value = 0;
        fontSize.value += 2;
      }
    });
  }

  void textScaleDown() {
    runInAction(() {
      if (fontSize.value <= 25) fontFlag.value = 1;
      if (fontFlag.value != 1) {
        fontFlag.value = 0;
        fontSize.value -= 2;
      }
    });
  }
}

enum InputWay { upload, byLink }

class ImageHandler implements ImageMemePlaceHolderModel {
  @override
  final Observable<String> imageLink = ''.obs();
  @override
  final Observable<InputWay> inputWay = Observable(InputWay.byLink);

  void prepareToLink() {
    runInAction(() {
      imageLink.value = '';
      inputWay.value = InputWay.byLink;
    });
  }

  void prepareToUpload() {
    runInAction(() {
      imageLink.value = '';
      inputWay.value = InputWay.upload;
    });
  }

  Future<void> inputNetworkImage(String text) async {
    try {
      final response = await http.head(Uri.parse(text));
      if (response.statusCode == 200) {
        runInAction(() => imageLink.value = text);
      }
    } catch (e, stacktrace) {
      runInAction(() => imageLink.value =
          'https://www.meme-arsenal.com/memes/32e50c2b42388a3f12d36ce32b8e91d3.jpg');
      Snack('Your link is broken, body').error();
      devtool.log('$e', stackTrace: stacktrace);
    }
  }
}
