import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Controller/Home/HomeController.dart';
import 'package:task/view/shared/CustomHomeListTile1.dart';
import 'package:task/view/shared/CustomHomeListTile2.dart';
import 'package:task/view/widgets/CustomScaffold.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeImplement controller = Get.put(HomeImplement());
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Home Page",
      widget: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomHomeListTile1(
              title: controller.name!, iconData: Icons.person_outline_outlined),
          CustomHomeListTile1(
              title: "${controller.countryCode!}  ${controller.phoneNumber!}",
              iconData: Icons.phone_android),
          CustomHomeListTile1(
              title: controller.emeil!, iconData: Icons.email_outlined),
          CustomHomeListTile2(
              title: "Update Information",
              onPressed: () {
                controller.goToUpdateInformation();
              }),
          CustomHomeListTile2(title: "Change Password", onPressed: () {}),
          CustomHomeListTile2(title: "Delete Account", onPressed: () {}),
          CustomHomeListTile2(
              title: "Logout",
              onPressed: () {
                controller.logOut();
                
              }),
        ],
      ),
    );
  }
}
