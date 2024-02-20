import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/stores/text_and_image_handler.dart';

void initStores() {
  getIt.registerLazySingleton<TextAndImageHandler>(() => TextAndImageHandler());
}
