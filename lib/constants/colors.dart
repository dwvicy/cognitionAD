import 'package:flutter/material.dart';

class AppTheme {
  static const Color red = Color(0xFFDF2935);
  static const Color green = Color(0xFF00CC66);
  static const Color blue = Color(0xFF67AAF9);
  static const Color ello = Color(0xFFF1C40F);
  static const Color white = Color(0xFFF9F9F9);
}

class Style {
  static const TextStyle bigHead = TextStyle(fontFamily: 'Josefin', fontSize: 43);
  static const TextStyle smolHead = TextStyle(fontFamily: 'Josefin', fontSize: 35);
  static const TextStyle smolText = TextStyle(fontFamily: 'Josefin', fontSize: 20);
  static const TextStyle smollyWhite =
      TextStyle(fontFamily: 'Josefin', fontSize: 20, color: Colors.black);
}

BoxDecoration griddecor = BoxDecoration(boxShadow: <BoxShadow>[
  BoxShadow(
    color: Colors.black,
    offset: Offset(1.0, 6.0),
    blurRadius: 20,
  )
], borderRadius: BorderRadius.all(Radius.circular(40)));
