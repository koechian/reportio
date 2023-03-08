import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool hide;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.hide});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          controller: controller,
          obscureText: hide,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(167, 221, 82, 1)),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.rubik(color: Colors.grey.shade700),
          ),
        ));
  }
}
