import 'package:hive/hive.dart';
import 'categorie.dart';

part 'produit.g.dart';

@HiveType(typeId: 1)
class Produit {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String designation;

  @HiveField(2)
  final int quantite;

  @HiveField(3)
  final int prixTA;

  @HiveField(4)
  final int prixUV;

  @HiveField(5)
  final String categorieId;

  Produit({
    required this.id,
    required this.designation,
    required this.quantite,
    required this.prixTA,
    required this.prixUV,
    required this.categorieId,
  });
}
