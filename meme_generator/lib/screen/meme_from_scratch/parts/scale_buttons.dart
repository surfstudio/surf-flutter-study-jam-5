part of "../meme_generator_screen.dart";

class _ScaleButtons extends StatelessWidget {
  const _ScaleButtons();

  @override
  Widget build(BuildContext context) {
    final textHolder = getIt<TextStore>();
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: scaleButtonDecoration,
              onPressed: () => textHolder.textHolder.fontFlag.value != 2
                  ? textHolder.textHolderProvider.textScaleUp()
                  : {},
              child: const Text("Text scale Up")),
          Space.h10,
          ElevatedButton(
            style: scaleButtonDecoration,
            onPressed: () => textHolder.textHolder.fontFlag.value != 1
                ? textHolder.textHolderProvider.textScaleDown()
                : {},
            child: const Text("Text scale Down"),
          ),
        ],
      ),
    );
  }
}
