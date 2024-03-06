import 'dart:developer' as devtool;

import 'package:http/http.dart' as http;
import 'package:meme_generator/domain/entity/image_holder.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:mobx/mobx.dart';

abstract class ImageHolderProvider {
  void prepareToLink();
  void prepareToUpload();
  Future<void> inputNetworkImage(String text);
}

class ImageHolderProviderDefault implements ImageHolderProvider {
  ImageHolderProviderDefault({required this.imageHolder});
  ImageHolder imageHolder;

  @override
  void prepareToLink() {
    runInAction(() {
      imageHolder.imageLink.value = '';
      imageHolder.inputWay.value = InputWay.byLink;
    });
  }

  @override
  void prepareToUpload() {
    runInAction(() {
      imageHolder.imageLink.value = '';
      imageHolder.inputWay.value = InputWay.upload;
    });
  }

  @override
  Future<void> inputNetworkImage(String text) async {
    try {
      final response = await http.head(Uri.parse(text));
      if (response.statusCode == 200) {
        runInAction(() => imageHolder.imageLink.value = text);
      }
    } catch (e, stacktrace) {
      runInAction(() => imageHolder.imageLink.value =
          'https://www.meme-arsenal.com/memes/32e50c2b42388a3f12d36ce32b8e91d3.jpg');
      Snack('Your link is broken, body').error();
      devtool.log('$e', stackTrace: stacktrace);
    }
  }
}
