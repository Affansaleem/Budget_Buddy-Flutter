import 'dart:ui';
import 'package:flutter/material.dart';

TextStyle modernLightTextStyle({
  double fontSize = 16.0,
  Color color = Colors.black54,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.w300, // Light weight
    color: Color(0xFF4A4A4A),
    letterSpacing: 0.5, // Slightly spaced out letters
    fontFamily: 'Roboto', // Modern font family

  );
}

class AppColors {
  static const Color primaryColor = Color(0xFF000080);
  static const Color secondaryColor = Color(0xFFBA7C63);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color textColorLight = Color(0xFFFFFFFF);
  static const Color textColorDark = Color(0xFF171717);
}
