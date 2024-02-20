part of "../meme_generator_screen.dart";

class _ScaleButtons extends StatelessWidget {
  const _ScaleButtons();

  @override
  Widget build(BuildContext context) {
    final textAndImageHolder = getIt<TextHandler>();
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: scaleButtonDecoration,
              onPressed: () => textAndImageHolder.fontFlag.value != 2
                  ? textAndImageHolder.textScaleUp()
                  : {},
              child: const Text("Text scale Up")),
          Space.h10,
          ElevatedButton(
            style: scaleButtonDecoration,
            onPressed: () => textAndImageHolder.fontFlag.value != 1
                ? textAndImageHolder.textScaleDown()
                : {},
            child: const Text("Text scale Down"),
          ),
        ],
      ),
    );
  }
}
