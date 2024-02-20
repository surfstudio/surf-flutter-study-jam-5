import 'package:flutter/material.dart';
import 'package:text_editor/text_editor.dart';

class PositionedText extends StatefulWidget {
  PositionedText();

  @override
  State<PositionedText> createState() => _PositionedTextState();
}

class _PositionedTextState extends State<PositionedText> {
  final fonts = [
    '',
  ];

  TextStyle _textStyle = TextStyle(
    fontSize: 50,
    color: Colors.red,
    fontFamily: 'OpenSans',
  );

  String _text = 'Демотиватор';

  void _tapHandler(text, textStyle) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(
        milliseconds: 400,
      ), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Container(
          color: Colors.black.withOpacity(0.4),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              // top: false,
              child: Container(
                child: TextEditor(
                  fonts: fonts,
                  text: text,
                  textStyle: textStyle,
                  minFontSize: 10,
                  onEditCompleted: (style, align, text) {
                    setState(() {
                      _text = text;
                      _textStyle = style;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  var appBarHeight = AppBar().preferredSize.height;
  double x = 100;

  double y = 100;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Draggable(
        child: GestureDetector(
          onTap: () => _tapHandler(_text, _textStyle),
          child: Container(
            child: Text(
              _text,
              style: _textStyle,
            ),
          ),
        ),
        feedback: Container(
          child: Text(_text, style: _textStyle),
        ),
        childWhenDragging: Container(),
        onDragEnd: (dragDetails) {
          setState(() {
            x = dragDetails.offset.dx;
            // if applicable, don't forget offsets like app/status bar
            y = dragDetails
                .offset.dy; // - appBarHeight-100;// - statusBarHeight;
          });
        },
      ),
    );
  }
}
