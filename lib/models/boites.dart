import 'package:hive/hive.dart';
import 'dart:math';

late Box boiteCategories;
late Box boiteProduits;

String genererCode() {
  Random random = Random();
  String code = '';
  for (int i = 0; i < 4; i++) {
    code += random.nextInt(10).toString(); // Génère un chiffre entre 0 et 9
  }
  return code;
}
