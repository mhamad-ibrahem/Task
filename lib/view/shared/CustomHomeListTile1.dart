import 'package:flutter/material.dart';

import '../../Core/Constant/Colors.dart';

class CustomHomeListTile1 extends StatelessWidget {
  const CustomHomeListTile1(
      {super.key, required this.title, required this.iconData});
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, color: AppColors.purple),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
