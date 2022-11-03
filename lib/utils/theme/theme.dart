import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/colors.dart';

class Theme {
  final lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColor),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      brightness: Brightness.light,
      onPrimary: AppColors.primaryColor,
      secondary: AppColors.black,
    ),
    cardColor: AppColors.white,
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.white,
  );

  final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff212121),
    ),
    cardColor: AppColors.black.withOpacity(0.2),
    colorScheme: ColorScheme.dark(
      primary: AppColors.cardDateColorDark,
      brightness: Brightness.dark,
      onPrimary: AppColors.primaryColor,
      secondary: AppColors.white,
    ),
    primaryColor: AppColors.primaryColor,
  );
}
