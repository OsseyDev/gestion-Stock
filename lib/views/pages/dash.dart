import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/pages/arrivages.dart';
import 'package:app_stock/views/pages/articles.dart';
import 'package:app_stock/views/pages/familles.dart';
// import 'package:app_stock/views/pages/liste_cat.dart';
// import 'package:app_stock/views/pages/login.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:app_stock/views/widgets/cardAlerte.dart';
import 'package:app_stock/views/widgets/cardSolde.dart';
// import 'package:app_stock/views/widgets/card_action.dart';
import 'package:app_stock/views/widgets/optionFonct.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class accueil extends StatelessWidget {
  const accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              // Messages bienvenu nom boutique

              const Center(
                child: TextePrincipal(
                  texte: 'Bienvenue à EntrepriseA',
                  couleur: Couleurs.noirDoux,
                  espace: 1,
                  taille: 25,
                  forme: FontWeight.w500,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // Montant vendu
              CardSolde(
                montant: '15000',
                onTap: () {},
              ),

              const SizedBox(
                height: 10,
              ),

              // Actions
              const TextePrincipal(
                texte: 'Actions',
                couleur: Couleurs.noirDoux,
                espace: 1,
                taille: 25,
                forme: FontWeight.w500,
              ),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Vente
                  Optionfonct(
                    onTap: () {
                      print('Ajouter achat');
                    },
                    icon: Bootstrap.basket2_fill,
                    action: 'Vente',
                  ),

                  // Arrivages
                  Optionfonct(
                    onTap: () {
                      print('Voir les arrivages');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Arrivages()),
                      );
                    },
                    icon: Bootstrap.basket2_fill,
                    action: 'Arrivages',
                  ),
                  // Articles
                  Optionfonct(
                    onTap: () {
                      print('Voir les articles');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Articles()),
                      );
                    },
                    icon: Bootstrap.basket2_fill,
                    action: 'Articles',
                  ),
                  // Famille
                  Optionfonct(
                    onTap: () {
                      print('Voir les familles');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Familles()),
                      );
                    },
                    icon: Bootstrap.basket2_fill,
                    action: 'Familles',
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // Alertes stock
              const TextePrincipal(
                texte: 'Alertes',
                couleur: Couleurs.noirDoux,
                espace: 1,
                taille: 25,
                forme: FontWeight.w500,
              ),

              const SizedBox(
                height: 10,
              ),

              const CardAlerte(
                qte: '3',
                article: 'Montre',
              ),
              const SizedBox(
                height: 10,
              ),

              const CardAlerte(
                qte: '3',
                article: 'Montre',
              ),
              const SizedBox(
                height: 10,
              ),

              const CardAlerte(
                qte: '3',
                article: 'Montre',
              )
            ],
          ),
        ),
      ),
    );
  }
}
