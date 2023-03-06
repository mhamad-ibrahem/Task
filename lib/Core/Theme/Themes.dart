import 'package:flutter/material.dart';
import 'package:task/Core/constant/Colors.dart';

class Themes {
  ThemeData currentTheme = Themes.lightsTheme;
  static ThemeData darksTheme = ThemeData.dark()
      .copyWith(appBarTheme: const AppBarTheme(color: Colors.white));
  static ThemeData lightsTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 15,
            fontFamily: 'AlexandriaFLF',
            fontWeight: FontWeight.w600),
      ));
}
