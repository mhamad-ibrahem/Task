import 'package:flutter/material.dart';

import '../../Core/Constant/Colors.dart';
import '../../Core/constant/Fonts.dart';

class CustomHomeListTile2 extends StatelessWidget {
  const CustomHomeListTile2({super.key, required this.title, this.onPressed});
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: AppColors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          onTap: onPressed,
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.purple,
          ),
          title: Text(
            title,
            style: purpleTextStyle(false),
          ),
        ),
      ),
    );
  }
}
