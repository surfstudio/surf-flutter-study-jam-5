import 'package:flutter/material.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future camera(BuildContext context, Function() onTap) async {
    if (await Permission.camera.request().isGranted) {
      await onTap();
    } else {
      Snack("permission error").error();
    }
  }
}
