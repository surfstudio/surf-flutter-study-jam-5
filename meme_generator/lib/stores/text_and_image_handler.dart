import 'package:meme_generator/domain/data_providers/image_holder_provider.dart';
import 'package:meme_generator/domain/entity/image_holder.dart';

class ImageStore {
  ImageStore({
    required this.imageHolder,
    required this.imageHolderProvider,
  });
  ImageHolder imageHolder;
  ImageHolderProvider imageHolderProvider;
}
