import 'package:mobx/mobx.dart';

class TextHolder {
  final Observable<String> inputText = 'meme'.obs();
  final Observable<int> fontFlag = 1.obs();
  final Observable<double> fontSize = 25.0.obs();
}
