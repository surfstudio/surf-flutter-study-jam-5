import 'package:meme_generator/data/meme_patterns_repository/meme_patterns_repository.dart';
import 'package:meme_generator/data/model/meme_type/meme_type_model.dart';

class MemePatternsRepository implements IMemePatternsRepository {
  @override
  List<MemeTypeModel> get getMemes => source;

  final List<MemeTypeModel> source = [
    MemeTypeDemotivator(
        backgroundImage: 'assets/boromir.jpg',
        initialText: 'Нельзя просто так взять и..'),
    MemeTypeDemotivator(
        backgroundImage: 'assets/clown.jpg',
        initialText: 'Давай, расскажи мне..'),
  ];
}
