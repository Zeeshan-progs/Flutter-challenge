import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color primaryColor = Colors.purple.shade900;
  static const Color cardDateColorDark = Color(0xff87c9b2);
  static const Color white = Colors.white;
  static const Color black = Color(0xff000000);
  static const Color gray = Color(0xff727375);

  static Color dark = const Color(0xff000000).withOpacity(0.87);
  static Map<int, Color> day = {
    1: const Color(0xff252dc4),
  };

  static Map<int, Color> border = {
    1: const Color(0xfff2f20c),
  };
}
