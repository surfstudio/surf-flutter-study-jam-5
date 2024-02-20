part of "../meme_generator_screen.dart";

class _ScaleButtons extends StatelessWidget {
  const _ScaleButtons();

  @override
  Widget build(BuildContext context) {
    final textAndImageHolder = getIt<TextAndImageHandler>();
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                foregroundColor:
                    const MaterialStatePropertyAll(AppColors.mainWhite),
                backgroundColor: MaterialStatePropertyAll(
                  Colors.white.withAlpha(40),
                ),
              ),
              onPressed: () => textAndImageHolder.fontFlag.value != 2
                  ? textAndImageHolder.textScaleUp()
                  : {},
              child: const Text("Text scale Up")),
          Space.h10,
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor:
                  const MaterialStatePropertyAll(AppColors.mainWhite),
              backgroundColor: MaterialStatePropertyAll(
                Colors.white.withAlpha(40),
              ),
            ),
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