// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meme_generator/domain/data_providers/text_holder_provider.dart';
import 'package:meme_generator/domain/entity/text_holder.dart';

class TextStore {
  final TextHolder textHolder;
  final TextHolderProvider textHolderProvider;
  TextStore({
    required this.textHolder,
    required this.textHolderProvider,
  });
}
