part of "../meme_generator_screen.dart";

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
