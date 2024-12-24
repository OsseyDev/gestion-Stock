import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:app_stock/views/widgets/icon_wid.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CardAlerte extends StatelessWidget {
  final String qte;
  final String article;
  const CardAlerte({
    super.key,
    required this.qte,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Couleurs.rougeA,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          // Container
          const IconAlert(
            icon: Bootstrap.bell_fill,
          ),
          const SizedBox(
            width: 10,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextePrincipal(
                texte: article,
                couleur: Couleurs.rougeA,
                espace: 1,
                taille: 25,
                forme: FontWeight.w600,
              ),
              const SizedBox(
                height: 5,
              ),
              TextePrincipal(
                texte: (int.parse(qte) == 1)
                    ? 'Plus que $qte disponible'
                    : 'Plus que $qte disponibles',
                couleur: Couleurs.noirDoux,
                espace: 1,
                taille: 18,
                forme: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
