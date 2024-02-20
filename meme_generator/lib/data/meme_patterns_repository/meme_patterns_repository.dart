import 'package:meme_generator/data/model/meme_type/meme_type_model.dart';

abstract interface class IMemePatternsRepository {
  List<MemeTypeModel> get getMemes;
}
