part of "../meme_generator_screen.dart";

class TextStore implements TextMemePlaceHolderModel {
  @override
  final Observable<double> fontSize = 25.0.obs();
  @override
  final Observable<String> inputText = 'meme'.obs();
  @override
  void tappingText(String text) => runInAction(() => inputText.value = text);
}

abstract class TextMemePlaceHolderModel {
  final Observable<String> inputText;
  final Observable<double> fontSize;
  void tappingText(String text);

  TextMemePlaceHolderModel({required this.inputText, required this.fontSize});
}

abstract class ImageMemePlaceHolderModel {
  final Observable<String> imageLink;
  final Observable<InputWay> inputWay;

  ImageMemePlaceHolderModel({
    required this.imageLink,
    required this.inputWay,
  });
}

class _MemePlaceHolder extends StatelessWidget {
  final TextMemePlaceHolderModel textModel;
  final ImageMemePlaceHolderModel imageModel;
  const _MemePlaceHolder({
    required this.textModel,
    required this.imageModel,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );

    // final textAndImageHolder = getIt<TextHandler>();
    // final imageHolder = getIt<ImageHandler>();

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
                        builder: (_) => imageModel.inputWay.value ==
                                InputWay.byLink
                            ? imageModel.imageLink.value == ''
                                ? const _StockMemeImage()
                                : CachedNetworkImage(
                                    imageUrl: imageModel.imageLink.value,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                            : imageModel.imageLink.value == ''
                                ? const _StockMemeImage()
                                : Image(
                                    image: FileImage(
                                      File(imageModel.imageLink.value),
                                    ),
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) => Text(
                  textModel.inputText.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Impact',
                    fontSize: textModel.fontSize.value,
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
