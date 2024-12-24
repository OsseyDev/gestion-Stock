import 'package:app_stock/views/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SquelettePage extends StatelessWidget {
  final String titrePage;
  final List<Widget> contenu;
  final VoidCallback tapRetour;
  final VoidCallback tapAdd;
  final bool addBtn;
  const SquelettePage({
    super.key,
    required this.titrePage,
    required this.contenu,
    required this.tapRetour,
    required this.tapAdd,
    this.addBtn = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            // Header
            const SizedBox(
              height: 25,
            ),

            Header(
              icon: Bootstrap.arrow_left_short,
              texte: titrePage,
              retour: tapRetour,
              add: tapAdd,
              affAdd: addBtn,
            ),

            // Contenu
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: contenu,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
