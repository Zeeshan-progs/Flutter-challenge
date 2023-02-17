import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/colors.dart';

ThemeData themeData = ThemeData(
  textTheme:  TextTheme(
    bodyLarge: const TextStyle(
      fontSize: 14,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.75,
      fontStyle: FontStyle.normal,
    ),
    titleLarge:const  TextStyle(
      fontSize: 22,
      color: AppColors.black,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.75,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      color: AppColors.dark,
      fontWeight: FontWeight.w300,
      letterSpacing: 1,
      fontStyle: FontStyle.italic,
    ),
  ),
);
