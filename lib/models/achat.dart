import 'package:hive/hive.dart';
import 'produit.dart';

part 'achat.g.dart';

@HiveType(typeId: 2)
class Achat {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int produitId;

  @HiveField(2)
  final int quantite;

  @HiveField(3)
  final DateTime date;

  Achat({
    required this.id,
    required this.produitId,
    required this.quantite,
    required this.date,
  });
}
