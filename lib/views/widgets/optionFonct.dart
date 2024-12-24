import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Optionfonct extends StatelessWidget {
  final BootstrapIconData icon;
  final String action;
  final void Function() onTap;
  const Optionfonct({
    super.key,
    required this.icon,
    required this.action,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          // Circlec
          CircleAvatar(
            radius: 30,
            backgroundColor: Couleurs.bleuM,
            child: Icon(
              icon,
              size: 20,
              color: Couleurs.blanc,
            ),
          ),
          // Texte
          TextePrincipal(
            texte: action,
            couleur: Couleurs.noirDoux,
            espace: 1,
            taille: 20,
            forme: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
