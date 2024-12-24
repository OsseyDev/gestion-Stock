import 'package:app_stock/views/widgets/bouton.dart';
import 'package:app_stock/views/widgets/champs.dart';
import 'package:app_stock/views/widgets/squelette_page.dart';
import 'package:flutter/material.dart';

class AjouterAchat extends StatefulWidget {
  const AjouterAchat({super.key});

  @override
  State<AjouterAchat> createState() => _AjouterAchatState();
}

class _AjouterAchatState extends State<AjouterAchat> {
  final TextEditingController nomArtController = TextEditingController();
  final TextEditingController quantiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SquelettePage(
      titrePage: 'Nouvel Achat',
      contenu: [
        // Liste deroulande article id et nom

        // Quantité
        Monchamp(
          hintText: 'Entrez la quantité',
          hidden: false,
          controller: quantiteController,
        ),

        // Bouton de valisation
        MonBouton(
          text: 'Enregistrer l\'Achat',
          valide: true,
          onTap: () {},
        ),
      ],
      tapRetour: () {},
      tapAdd: () {},
    );
  }
}
