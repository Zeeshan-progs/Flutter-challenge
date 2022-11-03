import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/colors.dart';

ThemeData themeData = ThemeData(
  textTheme:  TextTheme(
    bodyText1: const TextStyle(
      fontSize: 14,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.75,
      fontStyle: FontStyle.normal,
    ),
    headline6:const  TextStyle(
      fontSize: 22,
      color: AppColors.black,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.75,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      fontSize: 16,
      color: AppColors.dark,
      fontWeight: FontWeight.w300,
      letterSpacing: 1,
      fontStyle: FontStyle.italic,
    ),
  ),
);
