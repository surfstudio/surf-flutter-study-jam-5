import 'package:mobx/mobx.dart';

enum InputWay { upload, byLink }

class ImageHolder {
  final Observable<String> imageLink = ''.obs();
  final Observable<InputWay> inputWay = Observable(InputWay.byLink);
}
