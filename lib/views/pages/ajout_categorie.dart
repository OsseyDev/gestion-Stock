import 'package:app_stock/models/boites.dart';
import 'package:app_stock/models/categorie.dart';
import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/pages/liste_cat.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:app_stock/views/widgets/bouton.dart';
import 'package:app_stock/views/widgets/champs.dart';
import 'package:app_stock/views/widgets/squelette_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AjoutCategorie extends StatefulWidget {
  const AjoutCategorie({super.key});

  @override
  State<AjoutCategorie> createState() => _AjoutCategorieState();
}

class _AjoutCategorieState extends State<AjoutCategorie> {
  final TextEditingController titreController = TextEditingController();
  final TextEditingController familleController = TextEditingController();
  String message = '';
  String texte = 'Sélectionner une option';
  bool activeBtn = false;
  final List<String> options = ['Consommable', 'Non Consommable '];
  // bool checkSelect = false;
  String optionSelect = 'Consommable';

  void verifChamps() {
    setState(() {
      activeBtn = titreController.text.isNotEmpty &&
          familleController.text.isNotEmpty &&
          (titreController.text == 'Consommable' ||
              titreController.text == 'Non Consommable');
      if (titreController.text == 'Consommable' ||
          titreController.text == 'Non Consommable') {
        message = 'Le doit doit être consommable ou non consommable';
      }
      if (titreController.text.isEmpty || familleController.text.isEmpty) {
        message = 'Renseigner les champs';
      } else {
        message = '';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    ouvrirBoite();

    titreController.addListener(verifChamps);
    familleController.addListener(verifChamps);
    // checkSelect.addListener();
  }

  void ouvrirBoite() async {
    boiteCategories = await Hive.openBox<Categorie>('categoriesBox');
  }

  @override
  Widget build(BuildContext context) {
    return SquelettePage(
      addBtn: false,
      titrePage: 'Ajouter une Categorie',
      contenu: [
        const Row(
          children: [
            TextePrincipal(
              texte: 'Titre de la Categorie',
              couleur: Couleurs.noirDoux,
              espace: 1,
              taille: 20,
              forme: FontWeight.normal,
            ),
            Spacer()
          ],
        ),
        Monchamp(
          hintText: 'Entrez le titre de la categorie',
          hidden: false,
          controller: titreController,
          nbrOrTexte: false,
          // funct: check,
        ),

        espaceH(10),
        // Famille
        const Row(
          children: [
            TextePrincipal(
              texte: 'Famille de la Categorie',
              couleur: Couleurs.noirDoux,
              espace: 1,
              taille: 20,
              forme: FontWeight.normal,
            ),
            Spacer()
          ],
        ),
        Monchamp(
          hintText: 'Entrez la famille de la categorie',
          hidden: false,
          controller: familleController,
          nbrOrTexte: false,
          // funct: check,
        ),
        espaceH(20),
        // Bouton validation
        MonBouton(
          text: "Enregister la Catégorie",
          valide: activeBtn,
          onTap: () {
            setState(() {
              boiteCategories.put(
                boiteCategories.length + 1,
                Categorie(
                  code: (boiteCategories.length + 1).toString(),
                  titre: titreController.text,
                  famille: familleController.text,
                ),
              );
            });

            print(
                'titre : ${titreController.text} $optionSelect, famille : ${familleController.text}');
            print('${boiteCategories.length}');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Categories()),
            );
          },
        )
      ],
      tapRetour: () {
        print('precedent');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Categories()),
        );
      },
      tapAdd: () {},
    );
  }
}

SizedBox espaceH(double espace) {
  return SizedBox(
    height: espace,
  );
}
