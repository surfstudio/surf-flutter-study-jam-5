part of "../meme_generator_screen.dart";

class _UploadButton extends StatelessWidget {
  const _UploadButton();

  @override
  Widget build(BuildContext context) {
    final imageStore = getIt<ImageStore>();

    return ElevatedButton.icon(
        label: const Text('upload image'),
        icon: const Icon(Icons.photo_library_outlined),
        onPressed: () async {
          imageStore.imageHolderProvider.prepareToUpload();

          PermissionService().camera(
            context,
            () async {
              String photo = await PhotoService().getImageGallery();
              if (photo.isNotEmpty) {
                runInAction(
                    () => imageStore.imageHolder.imageLink.value = photo);
              }
            },
          );
        });
  }
}
