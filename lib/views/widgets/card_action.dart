import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:app_stock/views/widgets/icon_wid.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CardAction extends StatelessWidget {
  final BootstrapIconData icon;
  final double taille;
  final String action;
  final Color couleurIc;
  final void Function() onTap;
  const CardAction({
    super.key,
    required this.icon,
    required this.taille,
    required this.couleurIc,
    required this.action,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // double largeur = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 25,
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: Couleurs.grisCl, // Couleur de la bordure
              width: 2.0, // Épaisseur de la bordure
            ),
            // color: Couleurs.grisCl,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Couleurs.jauneAttention,
              child: IconWid(
                cercleOuNon: false,
                icon: icon,
                taille: taille,
                couleurIc: couleurIc,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextePrincipal(
              texte: action,
              couleur: Couleurs.noirDoux,
              espace: 1,
              taille: 20,
              forme: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
