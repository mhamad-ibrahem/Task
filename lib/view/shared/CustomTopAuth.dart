import 'package:flutter/material.dart';
import '../../Core/constant/Fonts.dart';
import '../../Core/constant/Images.dart';

class CustomTopAuth extends StatelessWidget {
  const CustomTopAuth(
      {super.key,
      required this.title,
      required this.height,
      required this.size});
  final String title;
  final double height;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: height),
            height: 140,
            width: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                AppImages.welcomImage,
              ),
              fit: BoxFit.contain,
            )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: purpleTextStyle(false).copyWith(fontSize: size),
        ),
      ],
    );
  }
}
