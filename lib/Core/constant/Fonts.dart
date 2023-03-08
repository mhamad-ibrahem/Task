import 'package:flutter/material.dart';
import 'package:task/Core/constant/Colors.dart';

TextStyle purpleTextStyle(bool isUnderLine) {
  return TextStyle(
      color: AppColors.purple,
      fontSize: 22,
      fontFamily: 'AlexandriaFLF',
      decoration:
          isUnderLine == true ? TextDecoration.underline : TextDecoration.none,
      fontWeight: FontWeight.w600);
}

TextStyle buttonTextStyle() {
  return const TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontFamily: 'AlexandriaFLF',
      fontWeight: FontWeight.w600);
}
