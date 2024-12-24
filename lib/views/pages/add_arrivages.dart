import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/pages/ajout_categorie.dart';
import 'package:app_stock/views/pages/arrivages.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:app_stock/views/widgets/bouton.dart';
import 'package:app_stock/views/widgets/champs.dart';
import 'package:app_stock/views/widgets/squelette_page.dart';
import 'package:flutter/material.dart';

class AddArrivages extends StatefulWidget {
  const AddArrivages({super.key});

  @override
  State<AddArrivages> createState() => _AddArrivagesState();
}

class _AddArrivagesState extends State<AddArrivages> {
  final TextEditingController quantiteController = TextEditingController();
  final TextEditingController prixTAController = TextEditingController();
  final TextEditingController prixTVController = TextEditingController();
  final TextEditingController prixUVController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SquelettePage(
        addBtn: false,
        titrePage: 'Nouvel arrivage',
        contenu: [
          // Liste de roulande article
          // Quantité
          entete('Quantité'),
          Monchamp(
            hintText: 'Entrez la quantité',
            hidden: false,
            controller: quantiteController,
          ),
          espaceH(10),
          // Prix total achat
          entete('Prix Total d\'Achat'),
          Monchamp(
            hintText: 'Entrez le prix total d\'achat',
            hidden: false,
            controller: prixTAController,
          ),
          espaceH(10),
          // Prix total vente
          entete('Prix Total de Vente'),
          Monchamp(
            hintText: 'Entrez le prix total de vente',
            hidden: false,
            controller: prixTVController,
          ),
          espaceH(10),
          // Prix unitaire de vente
          entete('Prix unitaire de vente'),
          Monchamp(
            hintText: 'Entrez le prix unitaire de vente',
            hidden: false,
            controller: prixTAController,
          ),
          espaceH(10),
          // Bouton ajout
          MonBouton(
            text: 'Ajouter l\'Arrivage',
            valide: true,
            onTap: () {
              print('Ajouter l\'arrivage');
            },
          ),
        ],
        tapRetour: () {
          print('precedent');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Arrivages(),
            ),
          );
        },
        tapAdd: () {});
  }
}

Row entete(String texte) {
  return Row(
    children: [
      TextePrincipal(
        texte: texte,
        couleur: Couleurs.noirDoux,
        espace: 1,
        taille: 20,
        forme: FontWeight.normal,
      ),
      const Spacer()
    ],
  );
}
