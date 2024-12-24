import 'package:hive/hive.dart';

part 'categorie.g.dart';

@HiveType(typeId: 0)
class Categorie {
  @HiveField(0)
  final String code;

  @HiveField(1)
  final String titre;

  @HiveField(2)
  final String famille;

  Categorie({
    required this.code,
    required this.titre,
    required this.famille,
  });
}
