import 'package:flutter/material.dart';

import 'button_widget.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
  });

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
