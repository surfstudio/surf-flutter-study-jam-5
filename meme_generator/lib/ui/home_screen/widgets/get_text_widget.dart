import 'package:flutter/material.dart';

class GetTextWidget extends StatefulWidget {
  // final int fontSize;
  // final Color color;
  const GetTextWidget({
    super.key,
    // required this.fontSize,
    // required this.color,
  });

  @override
  State<GetTextWidget> createState() => _GetTextWidgetState();
}

class _GetTextWidgetState extends State<GetTextWidget> {
  final _myControllerString = TextEditingController();
  final _myControllerInt = TextEditingController();

  late String text = '';
  late double fontSize = 20;
  late Color color = Colors.red;

  @override
  void initState() {
    super.initState();
    // _color = widget.color;
    // _fontSize = widget.fontSize;
  }

  void _getText() {
    setState(() {
      text = _myControllerString.text;
    });
  }

  // void _getSize() {
  //   setState(() {
  //     fontSize = _myControllerInt.text as double;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 180,
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _myControllerString,
                onChanged: (text) {},
                style: const TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 120,
                  child: TextField(
                    controller: _myControllerInt,
                    onChanged: (fontSize) {},
                  ),
                )
              ],
            ),
            IconButton(
              onPressed: () {
                _getText();
                // Navigator.pop<MyTextData>(context,
                //     MyTextData(text: text, size: fontSize, color: color));

                Navigator.pop(
                  context,
                  text,
                );
              },
              icon: const Icon(Icons.done),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextData {
  final String text;
  final double size;
  final Color color;

  MyTextData({required this.text, required this.size, required this.color});
}
