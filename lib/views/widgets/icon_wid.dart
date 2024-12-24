import 'package:app_stock/style/couleurs.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class IconWid extends StatelessWidget {
  final BootstrapIconData icon;
  final double taille;
  final Color couleurIc;
  final bool cercleOuNon;
  final Color couleurCir;
  const IconWid({
    super.key,
    required this.icon,
    required this.taille,
    required this.couleurIc,
    this.cercleOuNon = true,
    this.couleurCir = Couleurs.rougeA,
  });

  @override
  Widget build(BuildContext context) {
    return cercleOuNon
        ? CircleAvatar(
            backgroundColor: couleurCir,
            radius: 25,
            child: Icon(
              icon,
              size: taille,
              color: couleurIc,
            ),
          )
        : Icon(
            icon,
            size: taille,
            color: couleurIc,
          );
  }
}

class IconAlert extends StatelessWidget {
  final BootstrapIconData icon;
  const IconAlert({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: Couleurs.rougeA,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Center(
        child: IconWid(
          icon: icon,
          taille: 30,
          couleurIc: Couleurs.blanc,
        ),
      ),
    );
  }
}
