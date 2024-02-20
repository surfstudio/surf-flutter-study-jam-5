part of 'image_picker_bloc.dart';

sealed class ImagePickerEvent {
}

class ImagePickerEventChangePicture extends ImagePickerEvent {}

class ImagePickerEventChangePictureWithLink extends ImagePickerEvent {
  final String url;

  ImagePickerEventChangePictureWithLink({required this.url});
}

class ImagePickerEventRetrieveLostData extends ImagePickerEvent {}