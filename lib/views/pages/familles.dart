import 'package:app_stock/views/pages/ajout_famille.dart';
import 'package:app_stock/views/pages/dash.dart';
import 'package:app_stock/views/widgets/cat_card.dart';
import 'package:app_stock/views/widgets/squelette_page.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Familles extends StatefulWidget {
  const Familles({super.key});

  @override
  State<Familles> createState() => _FamillesState();
}

class _FamillesState extends State<Familles> {
  @override
  Widget build(BuildContext context) {
    return SquelettePage(
        titrePage: 'Les Familles',
        contenu: [
          CatCard(
            iconCat: Bootstrap.tag,
            onTapSup: () {
              print('Supprimer');
            },
            onTapMod: () {
              print('Modifier');
            },
            designation: 'Eaux',
            code: '1111',
          ),
        ],
        tapRetour: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const accueil(),
              ));
        },
        tapAdd: () {
          print('Ajouter une famille');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AjoutFamille(),
              ));
        });
  }
}
