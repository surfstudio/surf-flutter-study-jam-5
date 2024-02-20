part of "../meme_generator_screen.dart";

class AutoDisplayInputField extends StatefulWidget {
  const AutoDisplayInputField({super.key});

  @override
  AutoDisplayInputFieldState createState() => AutoDisplayInputFieldState();
}

class AutoDisplayInputFieldState extends State<AutoDisplayInputField> {
  @override
  Widget build(BuildContext context) {
    final textHolder = getIt<TextAndImageHandler>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          style: const TextStyle(color: AppColors.mainWhite),
          onChanged: (value) => textHolder.tappingText(value),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withAlpha(30),
              hintText: 'Type inscription of meme...',
              hintStyle: const TextStyle(color: AppColors.mainWhite)),
        ),
      ],
    );
  }
}
