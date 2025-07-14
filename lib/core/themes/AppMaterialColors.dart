import 'package:flutter/material.dart';

class MaterialColors {
  static const MaterialColor primarySwatch = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFFF2F0FF),
      100: Color(0xFFE5E0FE),
      200: Color(0xFFCBC1FE),
      300: Color(0xFFB0A1FD),
      400: Color(0xFF9682FD),
      500: Color(_primaryColor), // Regular
      600: Color(0xFF5D4ABD),
      700: Color(0xFF3E327E),
      800: Color(0xFF1F193F),
      900: Color(0xFF0C0A19),
    },
  );

  static const int _primaryColor = 0xFFFF7C63FC;
}
