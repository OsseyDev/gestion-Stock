import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:app_stock/views/widgets/icon_wid.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CatCard extends StatelessWidget {
  final BootstrapIconData iconCat;
  final void Function() onTapSup;
  final void Function() onTapMod;
  final String designation;
  final String code;
  const CatCard({
    super.key,
    required this.iconCat,
    required this.onTapSup,
    required this.onTapMod,
    required this.designation,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        color: Couleurs.grisCl,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          IconWid(
            icon: iconCat,
            taille: 25,
            couleurIc: Couleurs.blanc,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextePrincipal(
                texte: code,
                couleur: Couleurs.noirDoux,
                espace: 1,
                taille: 20,
                forme: FontWeight.w600,
              ),
              TextePrincipal(
                texte: designation,
                couleur: Couleurs.grisF,
                espace: 1,
                taille: 15,
                forme: FontWeight.w500,
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              // InkWell(
              //   onTap: onTapMod,
              //   child: const IconWid(
              //     cercleOuNon: false,
              //     icon: Bootstrap.pen_fill,
              //     taille: 25,
              //     couleurIc: Couleurs.bleuM,
              //   ),
              // ),
              // const SizedBox(
              //   width: 5,
              // ),
              InkWell(
                onTap: onTapSup,
                child: const IconWid(
                  cercleOuNon: false,
                  icon: Bootstrap.trash_fill,
                  taille: 25,
                  couleurIc: Couleurs.rougeA,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
