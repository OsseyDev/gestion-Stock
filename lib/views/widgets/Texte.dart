import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextePrincipal extends StatelessWidget {
  final String texte;
  final Color couleur;
  final double espace;
  final double taille;
  final FontWeight forme;
  const TextePrincipal({
    super.key,
    required this.texte,
    required this.couleur,
    required this.espace,
    required this.taille,
    required this.forme,
  });

  @override
  Widget build(BuildContext context) {
    return Text(texte,
        textAlign: TextAlign.start,
        style: GoogleFonts.quicksand(
          textStyle: TextStyle(
              color: couleur,
              // height: espace,
              fontSize: taille,
              fontWeight: forme),
        ));
  }
}
