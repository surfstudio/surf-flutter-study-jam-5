import 'package:elementary/elementary.dart';

class AppErrorHandler implements ErrorHandler {
  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
print(error);
  }

}