import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MemeGeneratorScreen extends StatefulWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreen> createState() => _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  late TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose;
    super.dispose();
  }

  final TextEditingController imageUrlController = TextEditingController();
  Future<String> _pastePhotoFromInternet() async {
    final linkPaste = await Clipboard.getData(Clipboard.kTextPlain);
    if (linkPaste != null) {
      setState(() {
        imageUrlController.text = linkPaste.text!;
      });
    }
    return imageUrlController.text;
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
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [],
        ),
      ),
      extendBodyBehindAppBar: false,
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
                    child: InkWell(
                      onTap: _pastePhotoFromInternet,
                      child: DecoratedBox(
                        decoration: decoration,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(
                            imageUrlController.text,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: TextField(
                              controller: textEditingController,
                              keyboardAppearance: Brightness.dark,
                              keyboardType: TextInputType.multiline,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Impact',
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Добавить текст',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Impact',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            titleTextStyle:
                                const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                            actionsOverflowButtonSpacing: 20,
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(textEditingController);
                                  setState(() {});
                                },
                                child: const Text("Подтвердить"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: textEditingController.text == ''
                        ? const Text('Добавить текст',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Impact',
                              fontSize: 40,
                            ))
                        : Text(
                            textEditingController.text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Impact',
                              fontSize: 40,
                            ),
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
