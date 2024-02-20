import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(destinations: [
      NavigationDestination(icon: Icon(Icons.add_a_photo_rounded), label: 'Add photo'),
      NavigationDestination(icon: Icon(Icons.text_fields_outlined), label: 'Add photo')
    ]);
  }
}
