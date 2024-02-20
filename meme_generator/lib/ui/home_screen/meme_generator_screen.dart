import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meme_generator/core/app_strings.dart';
import 'package:meme_generator/ui/home_screen/widgets/get_text_widget.dart';

class MemeGeneratorScreen extends StatefulWidget {
  const MemeGeneratorScreen({super.key});

  @override
  _MemeGeneratorScreenState createState() => _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  // MyTextData? myTextData;

  final _myController = TextEditingController();

  String text = "";
  late Color color = Colors.red;
  late double size = 25;

  var top = 180.0;

  var left = 10.0;

  late String _imagesUrl = '';

  late final double textSize;

  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      top = top + details.delta.dy;
      left = left + details.delta.dx;
    });
  }

  Future getImageUrl() async {
    setState(() {
      _imagesUrl = _myController.text;
    });
  }

  Future getColor() async {
    setState(() {
      _imagesUrl = _myController.text;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('Please choose media to select'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.image),
                      Text('From Gallery'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await uriTextField();
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.camera),
                      Text('From network'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future uriTextField() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  TextField(
                    controller: _myController,
                    onChanged: (imgUrl) {},
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImageUrl();
                    },
                    icon: const Icon(Icons.done),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: FittedBox(
                child: Text(
              AppStrings.appTitle,
              style: TextStyle(fontSize: 25),
            )),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              if (_imagesUrl.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      _imagesUrl,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  ),
                )
              else if (image != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(image!.path),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  ),
                )
              else
                const Text(
                  "Upload Image",
                  style: TextStyle(fontSize: 20),
                ),
              Positioned(
                top: top,
                left: left,
                child: GestureDetector(
                  onPanUpdate: _onPanUpdate,
                  child: Text(
                    text,
                    // myTextData.text,
                    style: TextStyle(
                      fontSize: size,
                      // myTextData.size,
                      color: color,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      myAlert();
                    },
                    child: const Text('Сhoose Photo'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      // final results = await Navigator.push<MyTextData>(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const GetTextWidget(),
                      //     ));

                      // if (results != null) {
                      //   results.color;
                      //   results.size;
                      //   results.text;
                      // }

                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GetTextWidget(),
                          ));
                      setState(() {
                        text = result;
                      });
                    },
                    child: const Text("Add text"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
