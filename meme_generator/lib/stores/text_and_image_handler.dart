import 'package:mobx/mobx.dart';

class TextAndImageHandler {
  final Observable<String> inputText = ''.obs();
  final Observable<String> imageLink = ''.obs();

  void tappingText(String text) => runInAction(() => inputText.value = text);
}
