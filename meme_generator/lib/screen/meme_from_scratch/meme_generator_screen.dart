import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/screen/widgets/shared_content.dart';
import 'package:meme_generator/stores/text_and_image_handler.dart';
import 'package:meme_generator/theme/colors.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

part 'parts/auto_display_input_field.dart';
part 'parts/meme_place_holder.dart';
part 'parts/scale_buttons.dart';

class MemeGeneratorScreen extends StatelessWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.mainWhite,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Meme From Scratch',
          style: TextStyle(
            color: AppColors.mainWhite,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: gradientDecoration(),
        child: const SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: mainPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MemePlaceHolder(),
                  Space.v10,
                  InputFields(),
                  Space.v10,
                  _UploadButton(),
                  Space.v10,
                  _ScaleButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UploadButton extends StatelessWidget {
  const _UploadButton();

  @override
  Widget build(BuildContext context) {
    final imageHolder = getIt<ImageHandler>();

    return ElevatedButton.icon(
        label: const Text('upload image'),
        icon: const Icon(Icons.photo_library_outlined),
        onPressed: () async {
          imageHolder.prepareToUpload();
          PermissionService().camera(
            context,
            () async {
              String photo = await PhotoService().getImageGallery();
              if (photo.isNotEmpty) {
                runInAction(() => imageHolder.imageLink.value = photo);
              }
            },
          );
        });
  }
}

class PermissionService {
  Future contacts(BuildContext context, Function() onTap) async {
    if (await Permission.contacts.request().isGranted) {
      await onTap();
    } else {
      Snack('t.customer.permit').error();
    }
  }

  Future camera(BuildContext context, Function() onTap) async {
    if (await Permission.camera.request().isGranted) {
      await onTap();
    } else {
      Snack("t.permission.camera").error();
    }
  }

  Future notification(Function() onGranted) async {
    if (await Permission.notification.request().isGranted) {
      await onGranted();
    }
  }
}

class PhotoService {
  Future<String> getImageGallery() async {
    if (await Permission.camera.request().isGranted) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image?.path == null) return '';

      return image!.path;
    }

    return '';
  }
}
