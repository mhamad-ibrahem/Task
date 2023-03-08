import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constant/Colors.dart';


warningAuthDialog( String subTitle) {
  Get.defaultDialog(
      title: 'Warning',
      middleText: subTitle,
      middleTextStyle: const TextStyle(
          color: AppColors.black, fontSize: 17, fontWeight: FontWeight.w500),
          titleStyle: const TextStyle(
          color: AppColors.red, fontSize: 24, fontWeight: FontWeight.bold)
          );
}
