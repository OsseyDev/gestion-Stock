import 'package:app_stock/style/couleurs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Monchamp extends StatelessWidget {
  final String hintText;
  final bool hidden;
  final TextEditingController controller;
  final bool nbrOrTexte;
  final void Function(String)? funct;

  const Monchamp({
    super.key,
    required this.hintText,
    required this.hidden,
    required this.controller,
    this.nbrOrTexte = true,
    this.funct,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        // textAlign: TextAlign.center,
        style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Couleurs.bleuM,
        )),
        keyboardType: nbrOrTexte ? TextInputType.phone : TextInputType.text,
        obscureText: hidden,
        controller: controller,
        onChanged: funct,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Couleurs.grisCl,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Couleurs.bleuM)),
          fillColor: Couleurs.blanc,
          filled: true,
          hintText: hintText,
          hintStyle: GoogleFonts.quicksand(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Couleurs.grisDesact,
          )),
        ));
  }
}
