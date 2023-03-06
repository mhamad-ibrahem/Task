import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Core/constant/Size.dart';
import '../../../Controller/welcom/WelcomController.dart';
import '../../shared/CustomTopAuth.dart';
import '../../widgets/CustomButton.dart';

class WelcomScreen extends GetView<WelcomController> {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WelcomController());
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
               CustomTopAuth(title: "Welcom to the app",height :AppSize.screenHight * 0.1, size: 20,),
              SizedBox(
                height: AppSize.screenHight * 0.15,
              ),
              CustomButton(
                  title: "Login",
                  width: AppSize.screenWidth * 0.7,
                  isPurple: true,
                  onPressed: () {
                    controller.goToLogin();
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  title: "Register",
                  width: AppSize.screenWidth * 0.7,
                  isPurple: false,
                  onPressed: () {
                    controller.goToRigester();
                  }),
             
             
            ],
          ),
        ),
      )),
    );
  }
}
