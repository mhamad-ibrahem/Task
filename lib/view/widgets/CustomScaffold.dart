import 'package:flutter/material.dart';

import '../../Core/Constant/Colors.dart';
import '../../Core/constant/Fonts.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.title, required this.widget});
  final String title;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.purple,
          title: Text(
            title,
            style: buttonTextStyle(),
          ),
        ),
        body: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
    child:  widget
    ));
  }
}
