import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:app_stock/views/widgets/icon_wid.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CardSolde extends StatelessWidget {
  final String montant;
  final VoidCallback onTap;
  const CardSolde({
    super.key,
    required this.montant,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: const BoxDecoration(
            color: Couleurs.bleuV,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              // Icon
              const IconWid(
                icon: Bootstrap.piggy_bank_fill,
                taille: 25,
                couleurIc: Couleurs.bleuV,
                couleurCir: Couleurs.blanc,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Texte
                  TextePrincipal(
                    texte: 'Vente d\'aujourd\'hui',
                    couleur: Couleurs.blanc,
                    espace: 1,
                    taille: 23,
                    forme: FontWeight.normal,
                  )
                ],
              ),

              // Montant
              TextePrincipal(
                texte: '$montant FCFA',
                couleur: Couleurs.blanc,
                espace: 1,
                taille: 40,
                forme: FontWeight.bold,
              ),
            ],
          )),
    );
  }
}
