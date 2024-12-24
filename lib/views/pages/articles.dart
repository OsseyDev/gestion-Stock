// import 'package:app_stock/models/produit.dart';
// import 'package:app_stock/style/couleurs.dart';
import 'package:app_stock/views/pages/ajout_article.dart';
import 'package:app_stock/views/pages/dash.dart';
// import 'package:app_stock/views/widgets/Texte.dart';
// import 'package:app_stock/views/widgets/articles_card.dart';
import 'package:app_stock/views/widgets/cat_card.dart';
import 'package:app_stock/views/widgets/squelette_page.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:icons_plus/icons_plus.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  // Future<Box<Produit>>? boiteArticleFuture;
  @override
  void initState() {
    super.initState();
    // boiteArticleFuture = Hive.openBox<Produit>('produitsBox');
    // print(boite);
    // print('${boiteCategoriesFuture.le}');
  }

  @override
  Widget build(BuildContext context) {
    return SquelettePage(
      titrePage: 'Nos Articles',
      tapRetour: () {
        print('precedent');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const accueil()),
        );
      },
      tapAdd: () {
        print('Add form');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AjouterArticle()),
        );
      },
      contenu: [
        CatCard(
          iconCat: Bootstrap.tag,
          onTapSup: () {},
          onTapMod: () {},
          code: '1123',
          designation: 'Téléphone',
        )
      ],
    );
  }
}
