part of 'image_picker_bloc.dart';
sealed class ImagePickerState {}

class ImagePickerStateInitial extends ImagePickerState {}

class ImagePickerStateProccess extends ImagePickerState {}

class ImagePickerStateChangingBad extends ImagePickerState {
  ImagePickerStateChangingBad(this.message);
  final String message;
}

class ImagePickerStateChangingSuccess extends ImagePickerState {
  final String message = 'Image had been changed successfully';
  final String newUrl;
  final bool useUrlSource;

  ImagePickerStateChangingSuccess(this.newUrl,this.useUrlSource);
}
