// ignore: unused_import
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePicker _picker = ImagePicker();
  ImagePickerBloc() : super(ImagePickerStateInitial()) {
    on<ImagePickerEvent>((event, emitter) async {
      await switch (event) {
        ImagePickerEventChangePicture() => _pickPicture(event, emitter),
        ImagePickerEventRetrieveLostData() =>
          _retrieveLostPicture(event, emitter),
        ImagePickerEventChangePictureWithLink() =>
          _useUrlSourse(event, emitter),
      };
    });
  }

  // For android: https://pub.dev/packages/image_picker/example
  Future<void> _retrieveLostPicture(ImagePickerEventRetrieveLostData event,
      Emitter<ImagePickerState> emitter) async {
    try {
      final LostDataResponse response = await _picker.retrieveLostData();
      if (response.isEmpty || response.file == null) {
        emitter(
          ImagePickerStateChangingBad('Image did not picked'),
        );
      } else {
        emitter(
          ImagePickerStateChangingSuccess(response.file!.path, false),
        );
      }
    } on Exception catch (_) {
      emitter(
        ImagePickerStateChangingBad('Please, check your Internet Connection'),
      );
    }
  }

  Future<void> _useUrlSourse(ImagePickerEventChangePictureWithLink event,
      Emitter<ImagePickerState> emitter) async {
    try {
      emitter(
        ImagePickerStateChangingSuccess(event.url, true),
      );
    } on Exception catch (_) {
      emitter(
        ImagePickerStateChangingBad('Please, check your Internet Connection'),
      );
    }
  }

  Future<void> _pickPicture(ImagePickerEventChangePicture event,
      Emitter<ImagePickerState> emitter) async {
    try {
      final XFile? pickedFile = await _pickImageFromDevice();

      if (pickedFile == null) {
        emitter(
          ImagePickerStateChangingBad('Image did not picked'),
        );
      } else {
        emitter(
          ImagePickerStateChangingSuccess(pickedFile.path, false),
        );
      }
    } on Exception catch (_) {
      emitter(
        ImagePickerStateChangingBad('Please, check your Internet Connection'),
      );
    }
  }

  Future<XFile?> _pickImageFromDevice() async {
    final XFile? pickedFile = await _picker.pickImage(
      requestFullMetadata: false,
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
    );
    return pickedFile;
  }
}
