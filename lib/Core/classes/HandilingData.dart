import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task/Core/classes/statusRequest.dart';

import '../constant/Images.dart';


class HandilingDataView extends StatelessWidget {
  const HandilingDataView(
      {super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImages.loadingImage,
                width: 50, height: 50, fit: BoxFit.fill))
        : statusRequest == StatusRequest.faliure
            ? Center(child: Lottie.asset(AppImages.errorImage))
            : statusRequest == StatusRequest.offlineFaliure
                ? Center(
                    child: Lottie.asset(AppImages.offlineImage,
                        width: 200, height: 200, fit: BoxFit.fill))
                : statusRequest == StatusRequest.serverFaliure
                    ? Center(
                        child: Lottie.asset(AppImages.serverErrorImage,
                            width: 400, height: 400))
                    : widget;
  }
}

class HandilingDataRequest extends StatelessWidget {
  const HandilingDataRequest(
      {super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImages.loadingImage,
                width: 50, height: 50, fit: BoxFit.fill))
        : statusRequest == StatusRequest.offlineFaliure
            ? Center(child: Lottie.asset(AppImages.offlineImage))
            : statusRequest == StatusRequest.serverFaliure
                ? Center(
                    child: Lottie.asset(AppImages.serverErrorImage,
                        width: 400, height: 400))
                : widget;
  }
}
