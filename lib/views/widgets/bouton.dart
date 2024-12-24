import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:flutter/material.dart';

class MonBouton extends StatelessWidget {
  final String text;
  final bool valide;
  final VoidCallback onTap;
  // void Function()? onTap;

  const MonBouton(
      {super.key,
      required this.text,
      required this.valide,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: valide ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          color: valide ? Couleurs.vertSucc : Couleurs.grisCl,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: TextePrincipal(
            texte: text,
            taille: 15,
            forme: FontWeight.w600,
            couleur: Colors.white,
            espace: 1,
          ),
        ),
      ),
    );
  }
}
