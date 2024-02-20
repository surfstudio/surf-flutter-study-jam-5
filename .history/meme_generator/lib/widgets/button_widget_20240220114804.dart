import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final bool isButtonPressed;
  const ButtonWidget({super.key, this.onTap, required this.isButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              border: Border.all(color: isButtonPressed ? Colors.grey.shade200 : Colors.grey.shade300),
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              boxShadow: isButtonPressed
                  ? [
                      //no shadows if button is pressed
                    ]
                  : [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 15,
                        offset: const Offset(6, 6),
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        blurRadius: 15,
                        offset: Offset(-6, -6),
                        spreadRadius: 1,
                      ),
                    ],
            ),
            duration: const Duration(milliseconds: 500),
            child: Icon(
              Icons.favorite,
              size: 60,
              color: isButtonPressed ? Colors.red[200] : Colors.red[400],
            ),
          ),
        ),
      ),
    );
  }
}
