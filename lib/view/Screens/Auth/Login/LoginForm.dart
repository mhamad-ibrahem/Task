import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Controller/Auth/SignIn/SignInController.dart';
import 'package:task/Core/Constant/Colors.dart';

import '../../../../Core/functions/Validation.dart';
import '../../../widgets/CustomTextFormField.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  LoginImplement controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.signinState,
        child: Column(
          children: [
            CustomTextFormField(
                icon: null,
                hint: "Email Address",
                obscure: false,
                textEditingController: controller.signinEmail,
                validator: (val) {
                  return validation(val!, 11, 50, "name");
                },
                suffixIcon: null),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                icon: null,
                hint: "Password",
                obscure: controller.obscureVisability,
                textEditingController: controller.signinpassword,
                validator: (val) {
                  return validation(val!, 6, 30, "name");
                },
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.changeObscure();
                    },
                    icon: Icon(
                      controller.obscureVisability == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.darkGrey,
                    ))),
          ],
        ));
  }
}
