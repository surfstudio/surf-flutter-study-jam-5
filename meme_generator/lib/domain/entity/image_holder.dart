import 'package:mobx/mobx.dart';

enum InputWay { upload, byLink }

class ImageHolder {
  ImageHolder._sharedInstance();
  static final ImageHolder _shared = ImageHolder._sharedInstance();
  factory ImageHolder() => _shared;

  final Observable<String> imageLink = ''.obs();
  final Observable<InputWay> inputWay = Observable(InputWay.byLink);
}
