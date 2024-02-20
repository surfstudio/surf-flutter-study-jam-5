import 'package:flutter/material.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
  });

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  bool isButtonPressed = false;
  void buttonPressed() {
    setState(() {
      if (isButtonPressed == false) {
        isButtonPressed = true;
      } else if (isButtonPressed == true) {
        isButtonPressed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [],
      ),
    );
  }
}
