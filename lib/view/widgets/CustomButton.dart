import 'package:flutter/material.dart';
import 'package:task/Core/constant/Colors.dart';

import '../../Core/constant/Fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.title,
      required this.width,
      required this.isPurple});
  final void Function()? onPressed;
  final String title;
  final double width;
  final bool isPurple;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side:isPurple == false ?const  BorderSide(color: AppColors.purple):BorderSide.none),
      color: isPurple == true ? AppColors.purple : AppColors.white,
      elevation: 3,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      minWidth: width,
      child: Text(
        title,
        style: isPurple == true
            ? buttonTextStyle()
            : purpleTextStyle(false).copyWith(fontSize: 20),
      ),
    );
  }
}
