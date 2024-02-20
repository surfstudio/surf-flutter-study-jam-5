import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/navbar_widget.dart';

class MemeGeneratorScreen extends StatefulWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreen> createState() => _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  final TextEditingController controller = TextEditingController();
  _pastePhotoFromInternet() async {
    final value = await Clipboard.getData('text/plain');
    if (value != null) {
      setState(() {
        controller.text = value.text ??
            'https://s2.best-wallpaper.net/wallpaper/2560x1600/2104/Rhino-head-horn-eye-black-background_2560x1600.jpg';
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
            ElevatedButton.icon(
              label: Text(
                'Add_photo by link',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: _pastePhotoFromInternet,
              icon: const Icon(Icons.add_a_photo_sharp),
            ),
            ElevatedButton(
              onPressed: AlertDialog(),
              child: const Icon(Icons.text_fields),
            )
          ],
        ),
      ),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Здесь мог бы быть ваш мем'),
        backgroundColor: const Color.fromARGB(0, 212, 192, 192),
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
