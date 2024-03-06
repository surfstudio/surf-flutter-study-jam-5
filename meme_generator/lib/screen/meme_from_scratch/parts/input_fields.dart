part of "../meme_generator_screen.dart";

class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  InputFieldsState createState() => InputFieldsState();
}

class InputFieldsState extends State<InputFields> {
  @override
  Widget build(BuildContext context) {
    final textStore = getIt<TextStore>();
    final imageStore = getIt<ImageStore>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          style: const TextStyle(color: AppColors.mainWhite),
          onChanged: (value) => textStore.textHolderProvider.tappingText(value),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withAlpha(30),
              hintText: 'Type inscription of meme...',
              hintStyle: const TextStyle(color: AppColors.mainWhite)),
        ),
        Space.v10,
        TextField(
          style: const TextStyle(color: AppColors.mainWhite),
          onSubmitted: (value) {
            imageStore.imageHolderProvider.prepareToLink();
            imageStore.imageHolderProvider.inputNetworkImage(value);
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withAlpha(30),
              hintText: 'Paste image link',
              hintStyle: const TextStyle(color: AppColors.mainWhite)),
        ),
      ],
    );
  }
}
