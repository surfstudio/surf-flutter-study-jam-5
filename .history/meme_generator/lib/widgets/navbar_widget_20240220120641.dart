import 'package:flutter/material.dart';

import 'button_widget.dart';

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
    return NavigationBar(destinations: const [
      ButtonWidget(
        isButtonPressed: () {},
        icon: Icons.add_a_photo_rounded,
      ),
      NavigationDestination(icon: Icon(Icons.text_fields_outlined), label: 'Add text')
    ]);
  }
}
