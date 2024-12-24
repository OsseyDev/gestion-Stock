// import 'package:app_stock/models/boites.dart';
import 'package:app_stock/models/categorie.dart';
import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/pages/ajout_categorie.dart';
import 'package:app_stock/views/pages/dash.dart';
import 'package:app_stock/views/widgets/cat_card.dart';
import 'package:app_stock/views/widgets/squelette_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:icons_plus/icons_plus.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<Box<Categorie>>? boiteCategoriesFuture;

  @override
  void initState() {
    super.initState();
    boiteCategoriesFuture = Hive.openBox<Categorie>('categoriesBox');
    // print('${boiteCategoriesFuture.le}');
  }

  void supprimerCategorie(int index, Box boiteCategories) async {
    await boiteCategories.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return SquelettePage(
      titrePage: 'Les Familles',
      contenu: [
        FutureBuilder<Box<Categorie>>(
          future: boiteCategoriesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Couleurs.bleuF,
              ));
            }

            if (snapshot.hasError) {
              return Center(child: Text('Erreur: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // print(boiteCategories.length);
              return const Center(child: Text('Aucune famille disponible'));
            }

            Box<Categorie> boiteCategories = snapshot.data!;
            print('Nous avons ${boiteCategories.length} categorie(s)');
            return ListView.builder(
              shrinkWrap: true,
              itemCount: boiteCategories.length,
              itemBuilder: (context, index) {
                Categorie categorie = boiteCategories.getAt(index)!;
                print(
                    'Catégorie ${index + 1}: ${categorie.titre}, ${categorie.famille}');
                return CatCard(
                  iconCat: Bootstrap.tag_fill,
                  onTapSup: () async {
                    print('Supprimer la categorie');
                    setState(() {
                      supprimerCategorie(index, boiteCategories);
                      print(
                          'Nous avons ${boiteCategories.length} categorie(e)');

                      // await boiteCategories.deleteAt(index);
                    });
                  },
                  onTapMod: () {
                    print('Modifier la categorie');
                  },
                  code: categorie.titre,
                  designation: categorie.famille,
                );
              },
            );
          },
        ),
        // CatCard(
        //   iconCat: Bootstrap.tag_fill,
        //   onTapSup: () {
        //     print('Supprimer la categorie');
        //   },
        //   onTapMod: () {
        //     print('Modifier la categorie');
        //   },
        //   titre: 'Consommable',
        //   famille: 'Eaux',
        // ),
      ],
      tapRetour: () {
        print('Précédent');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const accueil()),
        );
      },
      tapAdd: () {
        print('Nouvelle Catégorie');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AjoutCategorie()),
        );
      },
    );
  }
}
