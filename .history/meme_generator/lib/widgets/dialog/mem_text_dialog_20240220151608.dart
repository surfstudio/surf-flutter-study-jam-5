import 'package:flutter/material.dart';

class MemTextDialog extends StatefulWidget {
  MemTextDialog({super.key, required memTextController});

  @override
  State<MemTextDialog> createState() => _MemTextDialogState();
}

class _MemTextDialogState extends State<MemTextDialog> {
  late final TextEditingController memTextController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: TextField(
        controller: memTextController,
        keyboardType: TextInputType.multiline,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Impact',
        ),
        decoration: const InputDecoration(
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
            child: const Text("Отмена")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Добавить"))
      ],
    );
  }
}
