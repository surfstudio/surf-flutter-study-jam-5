part of "../meme_generator_screen.dart";

class _MemePlaceHolder extends StatelessWidget {
  const _MemePlaceHolder();

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );

    final textAndImageHolder = getIt<TextHandler>();
    final imageHolder = getIt<ImageHandler>();

    return ColoredBox(
      color: Colors.black,
      child: DecoratedBox(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: DecoratedBox(
                  decoration: decoration,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RepaintBoundary(
                      child: Observer(
                        builder: (_) => imageHolder.inputWay.value ==
                                InputWay.byLink
                            ? imageHolder.imageLink.value == ''
                                ? const _StockMemeImage()
                                : CachedNetworkImage(
                                    imageUrl: imageHolder.imageLink.value,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                            : imageHolder.imageLink.value == ''
                                ? const _StockMemeImage()
                                : Image(
                                    image: FileImage(
                                      File(imageHolder.imageLink.value),
                                    ),
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) => Text(
                  textAndImageHolder.inputText.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Impact',
                    fontSize: textAndImageHolder.fontSize.value,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StockMemeImage extends StatelessWidget {
  const _StockMemeImage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "meme picture",
        style: TextStyle(
          fontSize: 20,
          color: AppColors.mainWhite,
        ),
      ),
    );
  }
}
