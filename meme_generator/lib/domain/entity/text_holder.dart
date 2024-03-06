import 'package:mobx/mobx.dart';

class TextHolder {
  static final TextHolder _shared = TextHolder._sharedInstance();
  TextHolder._sharedInstance();
  factory TextHolder() => _shared;

  final Observable<String> inputText = 'meme'.obs();
  final Observable<int> fontFlag = 1.obs();
  final Observable<double> fontSize = 25.0.obs();
}
