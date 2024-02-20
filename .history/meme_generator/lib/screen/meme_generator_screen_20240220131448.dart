import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/navbar_widget.dart';

class MemeGeneratorScreen extends StatefulWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreen> createState() => _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  bool isButtonPressed = false;

  final TextEditingController controller = TextEditingController();
  _paste() async {
    final value = await Clipboard.getData(
        'https://i.cbc.ca/1.6713656.1679693029!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/this-is-fine.jpg');
    if (value != null) {
      setState(() {
        controller.text = value.text ??
            'https://i.cbc.ca/1.6713656.1679693029!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/this-is-fine.jpg';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _paste,
              child: const Icon(Icons.add_a_photo_sharp),
            ),
            // ElevatedButton(
            //   // onPressed: buttonPressed,
            //   child: const Icon(Icons.text_fields),
            // )
          ],
        ),
      ),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Здесь мог бы быть ваш мем'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: ColoredBox(
          color: Colors.black,
          child: DecoratedBox(
            decoration: decoration,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: DecoratedBox(
                      decoration: decoration,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                          controller.text,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Здесь мог бы быть ваш мем',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Impact',
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
