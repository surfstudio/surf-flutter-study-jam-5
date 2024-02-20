import 'package:meme_generator/data/image_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UrlTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newUrl) => context.read<ImageUrl>().changeUrl(newUrl),
    );
  }
}

class FloatingActionButtonImpl extends StatefulWidget{
  @override
  State<FloatingActionButtonImpl> createState() => _FloatingActionButtonImplState();
}

class _FloatingActionButtonImplState extends State<FloatingActionButtonImpl> {
  final myController = TextEditingController();
  String urlText='';

   @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {

        await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Введите новый адрес картинки'),
            content: TextField(
              onChanged: (text) {
                urlText=text;
              },
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if(urlText!="") context.read<ImageUrl>().changeUrl(urlText);
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // dismisses only the dialog and returns nothing
                },
                child: new Text('OK'),
              ),
            ],
          ),
        );
      },
      child: const Icon(Icons.add),);
  }
}


