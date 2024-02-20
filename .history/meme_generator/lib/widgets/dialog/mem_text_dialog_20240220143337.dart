import 'package:flutter/material.dart';

class MemTextDialog extends StatelessWidget {
  const MemTextDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: const TextField(
        keyboardType: TextInputType.multiline,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Impact',
        ),
        decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Здесь будет ваш комментарий',
          hintStyle: TextStyle(color: Colors.white, fontFamily: 'Impact', fontSize: 16),
          // 'Здесь мог бы быть ваш мем',
        ),
      ),
      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      actionsOverflowButtonSpacing: 20,
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Отмена")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Добавить"))
      ],
      content: const Text("Saved successfully"),
    );
  }
}
