import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 40, 40, 43);
  static const Color secondaryColor = Color.fromARGB(255, 108, 230, 112);
  static LinearGradient linearGradient = LinearGradient(
      colors: [Colors.green.shade500, Colors.green.shade200],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static LinearGradient imageGradient = const LinearGradient(
      colors: [Colors.black12, Colors.black87],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const Color blackshadowColor = Color.fromARGB(255, 42, 41, 41);

  static const Color textColor = Colors.white;
  static const Color textBlackColor = Colors.black;
  static const Color cardColor = Color.fromARGB(255, 54, 69, 79);
  static Color shadowColor = const Color(0xFFF9F9F9);
}
