import 'package:flutter/material.dart';
import '../../Core/Constant/Colors.dart';
import '../../Core/constant/Fonts.dart';

class CutsombottomAuth extends StatelessWidget {
  const CutsombottomAuth(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.subTitle});
  final VoidCallback onPressed;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: AppColors.darkGrey),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            subTitle,
            style: purpleTextStyle(false).copyWith(fontSize: 17),
          ),
        )
      ],
    );
  }
}
