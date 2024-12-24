import 'package:app_stock/models/boites.dart';
import 'package:app_stock/models/categorie.dart';
// import 'package:app_stock/models/dernier_element.dart';
import 'package:app_stock/models/produit.dart';
import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/pages/add_arrivages.dart';
import 'package:app_stock/views/pages/ajout_categorie.dart';
import 'package:app_stock/views/pages/articles.dart';
import 'package:app_stock/views/widgets/Texte.dart';
import 'package:app_stock/views/widgets/bouton.dart';
import 'package:app_stock/views/widgets/champs.dart';
import 'package:app_stock/views/widgets/squelette_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AjouterArticle extends StatefulWidget {
  const AjouterArticle({super.key});

  @override
  State<AjouterArticle> createState() => _AjouterArticleState();
}

class _AjouterArticleState extends State<AjouterArticle> {
  final TextEditingController designationController = TextEditingController();
  // final TextEditingController quantiteController = TextEditingController();
  // final TextEditingController prixTAController = TextEditingController();
  // final TextEditingController prixUVController = TextEditingController();
  String message = '';
  bool activeBtn = false;

  @override
  void initState() {
    super.initState();
    ouvrirBoite();

    designationController.addListener(verifChamps);
    // quantiteController.addListener(verifChamps);
    // prixTAController.addListener(verifChamps);
    // prixUVController.addListener(verifChamps);
  }

  @override
  void dispose() {
    designationController.dispose();
    // quantiteController.dispose();
    // prixTAController.dispose();
    // prixUVController.dispose();
    super.dispose();
  }

  void ouvrirBoite() async {
    boiteProduits = await Hive.openBox<Produit>('produitsBox');
    boiteCategories = await Hive.openBox<Categorie>('categoriesBox');
  }

  void verifChamps() {
    setState(() {
      activeBtn = designationController.text.isNotEmpty;

      // if (designationController.text.isEmpty) {
      //   message =
      //       'Entrer un destinan';
      // } else {
      //   message = '';
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SquelettePage(
      addBtn: false,
      titrePage: 'Ajouter un Articles',
      contenu: [
        // Designation
        entete('Nom de l\'article'),
        Monchamp(
          hintText: 'Entrez le nom de l\'article',
          hidden: false,
          controller: designationController,
          nbrOrTexte: false,
          // funct: check,
        ),

        espaceH(20),
        // Bouton de validation
        MonBouton(
          text: 'Ajouter l\'article',
          valide: activeBtn,
          onTap: () {
            // Categorie cat1 = boiteCategories.getAt(0);
            // print('${cat1.id} | ${cat1.titre} | ${cat1.famille}');
            print(
                'Il y a :\n ${boiteProduits.length} produits\n ${boiteCategories.length} categorie');

            setState(() {
              // if (boiteProduits.length == 0) {
              //   print(
              //       'C\'est le permier enregistrement, produit categories ${cat1.code}');
              // boiteProduits.put(
              //   1,
              //   Produit(
              //     id: 1,
              //     designation: designationController.text,
              //     quantite: int.parse(quantiteController.text),
              //     prixTA: int.parse(prixTAController.text),
              //     prixUV: int.parse(prixUVController.text),
              //     categorieId: cat1.code,
              //   ),
              // );
              // } else {
              //   // Produit dernier = dernierLigne(boiteProduits);
              //   Produit dernier = boiteProduits.getAt(boiteProduits.length - 1);
              //   print('c\'est le ${dernier.id + 1} ieme element');
              //   boiteProduits.put(
              //     dernier.id + 1,
              //     Produit(
              //       id: dernier.id + 1,
              //       designation: designationController.text,
              //       quantite: int.parse(quantiteController.text),
              //       prixTA: int.parse(prixTAController.text),
              //       prixUV: int.parse(prixUVController.text),
              //       categorieId: cat1.code,
              //     ),
              //   );
              // }
            });
            // Vers la liste des articles
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Articles(),
              ),
            );
          },
        ),

        // Message d'erreur
        if (message.isNotEmpty)
          TextePrincipal(
            texte: message,
            couleur: Couleurs.rougeA,
            espace: 1,
            taille: 15,
            forme: FontWeight.w800,
          ),
      ],
      tapRetour: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Articles()),
        );
      },
      tapAdd: () {},
    );
  }
}
