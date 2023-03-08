import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Core/constant/Size.dart';
import 'package:task/view/Screens/Auth/Login/LoginForm.dart';
import 'package:task/view/shared/CutsombottomAuth.dart';
import 'package:task/view/widgets/CustomButton.dart';
import '../../../../Controller/Auth/SignIn/SignInController.dart';
import '../../../../Core/classes/HandilingData.dart';
import '../../../shared/CustomTopAuth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  LoginImplement controller = Get.put(LoginImplement());
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<LoginImplement>(
          builder: (controller) => HandilingDataRequest(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTopAuth(
                    title: "Login",
                    height: AppSize.screenHight * 0.05,
                    size: 25,
                  ),
                  SizedBox(
                    height: AppSize.screenHight * 0.14,
                  ),
                  LoginForm(),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    title: "Login",
                    width: AppSize.screenWidth * 0.7,
                    isPurple: true,
                    onPressed: () {
                      controller.signInvalidate();
                    },
                  ),
                  SizedBox(
                    height: AppSize.screenHight * 0.12,
                  ),
                  CutsombottomAuth(
                      onPressed: () {
                        controller.goToSignUp();
                      },
                      title: "Dont have an account?",
                      subTitle: "Register")
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
