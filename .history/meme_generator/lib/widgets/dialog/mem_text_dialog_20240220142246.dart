import 'package:flutter/material.dart';

class MemTextDialog extends StatelessWidget {
  const MemTextDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
