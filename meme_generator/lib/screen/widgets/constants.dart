import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;
final GlobalKey myApp = GlobalKey();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

class Space {
  Space._();

  static const v0 = SizedBox(height: 0.0);
  static const v5 = SizedBox(height: 5.0);
  static const v10 = SizedBox(height: 10.0);
  static const v15 = SizedBox(height: 15.0);
  static const v20 = SizedBox(height: 20.0);

  static const h5 = SizedBox(width: 5.0);
  static const h10 = SizedBox(width: 10.0);
  static const h15 = SizedBox(width: 15.0);
  static const h20 = SizedBox(width: 20.0);
}

class Snack {
  final String text;

  Snack(this.text);

  void success() {
    snackbarKey.currentState?.showSnackBar(
      snackBar(
        text,
        Colors.green,
        Icons.check_circle_outlined,
      ),
    );
  }

  void error() {
    snackbarKey.currentState?.showSnackBar(
      snackBar(
        text,
        Colors.red,
        Icons.error_outline_outlined,
      ),
    );
  }

  void warning() {
    snackbarKey.currentState?.showSnackBar(
      snackBar(
        text,
        Colors.blueGrey,
        Icons.warning_outlined,
      ),
    );
  }

  SnackBar snackBar(String text, Color color, IconData icon) {
    return SnackBar(
      backgroundColor: color,
      padding: const EdgeInsets.all(20),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          Space.h10,
          Flexible(child: Text(text)),
        ],
      ),
      duration: const Duration(seconds: 3),
    );
  }
}

Widget spinner(Color? color) => Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 2,
        ),
      ),
    );

Future<void> pause2sec() async =>
    await Future.delayed(const Duration(seconds: 2), () {});
