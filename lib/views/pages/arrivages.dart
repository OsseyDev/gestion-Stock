import 'package:app_stock/views/pages/add_arrivages.dart';
import 'package:app_stock/views/pages/dash.dart';
import 'package:app_stock/views/widgets/articles_card.dart';
import 'package:app_stock/views/widgets/squelette_page.dart';
import 'package:flutter/material.dart';

class Arrivages extends StatefulWidget {
  const Arrivages({super.key});

  @override
  State<Arrivages> createState() => _ArrivagesState();
}

class _ArrivagesState extends State<Arrivages> {
  // void verifChamps() {
  //   setState(() {
  //     activeBtn = designationController.text.isNotEmpty &&
  //         quantiteController.text.isNotEmpty &&
  //         prixTAController.text.isNotEmpty &&
  //         prixUVController.text.isNotEmpty &&
  //         int.parse(prixUVController.text) >=
  //             int.parse(prixTAController.text) /
  //                 int.parse(quantiteController.text);

  //     double prixMin =
  //         int.parse(prixTAController.text) / int.parse(quantiteController.text);
  //     if (int.parse(prixUVController.text) <= prixMin) {
  //       message =
  //           'le prix utitaire de vente doit etre superieur à ${prixMin.ceil()}';
  //     } else {
  //       message = '';
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SquelettePage(
      titrePage: 'Les arrivages',
      contenu: [
        ArticlesCard(
          articleNom: 'Sac à main',
          qte: '30',
          prix: "1200 FCFA",
        ),
      ],
      tapRetour: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const accueil(),
          ),
        );
      },
      tapAdd: () {
        print('Add arrivage');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddArrivages(),
          ),
        );
      },
    );
  }
}
