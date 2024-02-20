// Шаблон мема
sealed class MemeTypeModel {
  final String backgroundImage;
  final String initialText;
  final String typeName;
  MemeTypeModel({
    required this.backgroundImage,
    required this.initialText,
    required this.typeName,
  });
}

// Тип - демотиватор
class MemeTypeDemotivator extends MemeTypeModel {
  MemeTypeDemotivator({
    required super.backgroundImage,
    required super.initialText,
    super.typeName = 'Demotivator',
  });
}

// Тип - мем с текстами на картинке
class MemeTypeUsual extends MemeTypeModel {
  final List<String> quotes;
  MemeTypeUsual({
    required super.backgroundImage,
    required super.initialText,
    required this.quotes,
    super.typeName = 'Usual',
  });
}
