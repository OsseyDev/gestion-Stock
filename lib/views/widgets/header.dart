import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:app_stock/views/widgets/icon_wid.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Header extends StatelessWidget {
  final BootstrapIconData icon;
  final String texte;
  final VoidCallback retour;
  final bool affAdd;
  final VoidCallback add;
  const Header({
    super.key,
    required this.icon,
    required this.texte,
    required this.retour,
    required this.add,
    this.affAdd = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon circle
        InkWell(
          onTap: retour,
          child: IconWid(
            icon: icon,
            taille: 25,
            couleurIc: Couleurs.noirDoux,
            couleurCir: Couleurs.grisCl,
          ),
        ),

        const SizedBox(
          width: 10,
        ),

        // Nom de la page
        TextePrincipal(
          texte: texte,
          couleur: Couleurs.noirDoux,
          espace: 1,
          taille: 25,
          forme: FontWeight.w700,
        ),

        const Spacer(),
        if (affAdd)
          InkWell(
            onTap: add,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Couleurs.jauneAttention,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(13),
                ),
              ),
              child: const IconWid(
                cercleOuNon: false,
                icon: Bootstrap.plus,
                taille: 30,
                couleurIc: Couleurs.jauneAttention,
              ),
            ),
          ),
      ],
    );
  }
}
