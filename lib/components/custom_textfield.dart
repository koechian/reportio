import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool hide;
  final Color bordercolor;
  final Color focusedbordercolor;
  final int maxLines;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.hide,
      this.maxLines = 1,
      this.bordercolor = Colors.grey,
      this.focusedbordercolor = const Color.fromRGBO(167, 221, 82, 1)});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          style: GoogleFonts.rubik(color: Colors.white, fontSize: 18),
          controller: controller,
          obscureText: hide,
          maxLines: maxLines,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: bordercolor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: focusedbordercolor),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.rubik(color: Colors.grey.shade700),
          ),
        ));
  }
}
