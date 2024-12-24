import 'package:hive/hive.dart';

dynamic dernierLigne(Box boite) {
  int taille = boite.length;
  return boite.getAt(taille);
}
