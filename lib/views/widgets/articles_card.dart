import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:app_stock/views/widgets/icon_wid.dart';
import 'package:app_stock/views/widgets/rowSect.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ArticlesCard extends StatelessWidget {
  final String articleNom;
  final String qte;
  final String prix;
  const ArticlesCard({
    super.key,
    required this.articleNom,
    required this.qte,
    required this.prix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Couleurs.grisCl,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          // Nom de l'article
          Row(
            children: [
              TextePrincipal(
                texte: articleNom,
                couleur: Couleurs.noirDoux,
                espace: 1,
                taille: 22,
                forme: FontWeight.w500,
              ),
              const Spacer(),
            ],
          ),

          const SizedBox(
            height: 5,
          ),

          // Container avec qte et prix
          ArtDet(qte: qte, prix: prix),

          const SizedBox(
            height: 5,
          ),

          // Actions supprimer ou modifier
          RowSection(
            widget1: IconTexte(
              icon: Bootstrap.pen_fill,
              texte: 'Modifier',
              onTap: () {
                print('Modifier l\'article');
              },
            ),
            spacer: true,
            widget2: IconTexte(
              icon: Bootstrap.trash_fill,
              texte: 'Suprimer',
              onTap: () {
                print('Supprimer l\'article');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class IconTexte extends StatelessWidget {
  final BootstrapIconData icon;
  final String texte;
  final void Function() onTap;
  const IconTexte({
    super.key,
    required this.icon,
    required this.texte,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWid(
              cercleOuNon: false,
              icon: icon,
              taille: 20,
              couleurIc: Couleurs.noirDoux,
            ),
            const SizedBox(
              width: 5,
            ),
            TextePrincipal(
              texte: texte,
              couleur: Couleurs.noirDoux,
              espace: 1,
              taille: 20,
              forme: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}

class ArtDet extends StatelessWidget {
  final String qte;
  final String prix;
  const ArtDet({
    super.key,
    required this.qte,
    required this.prix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xfff2f3f4),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          RowSection(
            spacer: true,
            widget1: const TextePrincipal(
              texte: 'Quantité :',
              couleur: Colors.grey,
              espace: 1,
              taille: 17,
              forme: FontWeight.w500,
            ),
            widget2: TextePrincipal(
              texte: qte,
              couleur: Couleurs.noirDoux,
              espace: 1,
              taille: 25,
              forme: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          RowSection(
            spacer: true,
            widget1: const TextePrincipal(
              texte: 'Prix :',
              couleur: Colors.grey,
              espace: 1,
              taille: 17,
              forme: FontWeight.w500,
            ),
            widget2: TextePrincipal(
              texte: '$prix FCFA',
              couleur: Couleurs.noirDoux,
              espace: 1,
              taille: 25,
              forme: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
