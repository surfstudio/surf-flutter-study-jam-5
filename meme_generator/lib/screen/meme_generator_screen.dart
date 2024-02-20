import 'package:flutter/material.dart';

import 'enums.dart';

class MemeGeneratorScreen extends StatefulWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreen> createState() => _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  late TextEditingController _controller;

  late String memeText;
  late String memeImageUrl;
  late final List<String> savedUrls;
  late final List<String> savedText;

  @override
  void initState() {
    _controller = TextEditingController();
    memeText = 'Здесь мог бы быть ваш мем';
    savedText = [memeText];
    memeImageUrl =
        'https://i.cbc.ca/1.6713656.1679693029!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/this-is-fine.jpg';
    savedUrls = [memeImageUrl];

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
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
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColoredBox(
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
                            memeImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      memeText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => dialogBulder(
                      context,
                      'Введите URL картинки',
                      ContentType.image,
                      savedUrls,
                    ),
                    child: const Text(
                      'Изменить картинку',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => dialogBulder(
                      context,
                      'Введите текст',
                      ContentType.text,
                      savedText,
                    ),
                    child: const Text(
                      'Изменить текст',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> dialogBulder(
    BuildContext context,
    String title,
    ContentType type,
    List<String> savedItemsString,
  ) async {
    final List<TextButton> savedItems = savedItemsString
        .map(
          (e) => TextButton(
            onPressed: () {
              setState(() {
                if (type == ContentType.image) {
                  memeImageUrl = e;
                } else {
                  memeText = e;
                }
              });
              Navigator.of(context).pop();
            },
            child: Text(
              e,
              maxLines: 1,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        )
        .toList();

    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...savedItems,
            TextField(controller: _controller),
          ],
        ),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              _controller.clear();
              Navigator.of(context).pop();
            },
            child: const Text(
              'Назад',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (type == ContentType.image) {
                  memeImageUrl = _controller.text.isNotEmpty
                      ? _controller.text
                      : memeImageUrl;
                  addInSaved(savedUrls, memeImageUrl);
                } else {
                  memeText =
                      _controller.text.isNotEmpty ? _controller.text : memeText;
                  addInSaved(savedText, memeText);
                }
              });
              _controller.clear();
              Navigator.of(context).pop();
            },
            child: const Text(
              'Подвердить',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  void addInSaved(List<String> savedList, String item) {
    if (item.isNotEmpty) {
      savedList.insert(0, item);
      if (savedList.length > 5) {
        savedList.removeLast();
      }
      savedList.toSet().toList();
    }
  }
}
