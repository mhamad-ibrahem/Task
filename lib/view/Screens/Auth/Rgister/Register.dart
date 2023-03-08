import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Controller/Auth/SignUp/SignUpController.dart';
import 'package:task/Core/constant/Size.dart';
import 'package:task/view/Screens/Auth/Rgister/RegisterForm.dart';
import 'package:task/view/shared/CutsombottomAuth.dart';
import '../../../../Core/classes/HandilingData.dart';
import '../../../shared/CustomTopAuth.dart';
import '../../../widgets/CustomButton.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  RegisterImplement controller = Get.put(RegisterImplement());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<RegisterImplement>(
        builder: (controller) => HandilingDataRequest(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Column(children: [
              CustomTopAuth(
                title: "Rigester",
                height: AppSize.screenHight * 0.05,
                size: 25,
              ),
              SizedBox(
                height: AppSize.screenHight * 0.05,
              ),
              RegisterForm(),
              CustomButton(
                title: "Register",
                width: AppSize.screenWidth * 0.7,
                isPurple: true,
                onPressed: () {
                  controller.completevalidate();
                },
              ),
              SizedBox(
                height: AppSize.screenHight * 0.03,
              ),
              CutsombottomAuth(
                onPressed: () {
                  controller.goToLogin();
                },
                title: "Already have an account?",
                subTitle: "Login",
              ),
            ]),
          ),
        ),
      ),
    )));
  }
}
