import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appTitle() {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: 'Chat',
        style: GoogleFonts.portLligatSans(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xff435de6),
        ),
        children: [
          TextSpan(
            text: 'UP',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ]),
  );
}
