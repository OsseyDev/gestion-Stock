import 'package:app_stock/views/pages/add_arrivages.dart';
import 'package:app_stock/views/pages/ajout_categorie.dart';
import 'package:app_stock/views/pages/familles.dart';
import 'package:app_stock/views/widgets/bouton.dart';
import 'package:app_stock/views/widgets/champs.dart';
import 'package:app_stock/views/widgets/squelette_page.dart';
import 'package:flutter/material.dart';

class AjoutFamille extends StatefulWidget {
  const AjoutFamille({super.key});

  @override
  State<AjoutFamille> createState() => _AjoutFamilleState();
}

class _AjoutFamilleState extends State<AjoutFamille> {
  final TextEditingController designationController = TextEditingController();

  bool activeBtn = false;

  @override
  void initState() {
    super.initState();
    // ouvrirBoite();

    designationController.addListener(verifChamps);
  }

  void verifChamps() {
    setState(() {
      activeBtn = designationController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    designationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SquelettePage(
      titrePage: 'Nouvel Famille',
      contenu: [
        // Designation
        entete('Nom de la famille'),
        Monchamp(
          hintText: 'Entrez le nom de la famille',
          hidden: false,
          controller: designationController,
          nbrOrTexte: false,
          // funct: check,
        ),

        // Bouton
        espaceH(20),
        MonBouton(
          text: 'Ajouter la famille',
          valide: activeBtn,
          onTap: () {
            print('Ajouter une famille');
            // Logique d'enregistrement local
            // Navigation vers la liste des familles
            naviguer(
              context,
              const Familles(),
            );
          },
        ),
      ],
      tapRetour: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Familles(),
          ),
        );
      },
      tapAdd: () {},
    );
  }
}

dynamic naviguer(BuildContext context, vers) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => vers(),
    ),
  );
}
