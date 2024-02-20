import 'package:meme_generator/data/meme_patterns_repository/meme_patterns_repository.dart';
import 'package:meme_generator/data/model/meme_type/meme_type_model.dart';

class MemesPatternInteractor {
  final IMemePatternsRepository _repository;

  MemesPatternInteractor({required IMemePatternsRepository repository})
      : _repository = repository;

  List<MemeTypeDemotivator> get demotivators =>
      _repository.getMemes.whereType<MemeTypeDemotivator>().toList();
}
