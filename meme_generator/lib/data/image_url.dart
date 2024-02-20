import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ImageUrl with ChangeNotifier{
  String _imageUrl='https://babylabpro.ru/img/story.png';

  String get getUrl=>_imageUrl;

  void changeUrl(String newUrl){
    _imageUrl=newUrl;

    notifyListeners();
  }
}
