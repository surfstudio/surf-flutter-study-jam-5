import 'package:mobx/mobx.dart';

class TextAndImageHandler {
  final Observable<String> inputText = 'meme'.obs();
  final Observable<String> imageLink = ''.obs();
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
