import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/Home/ChangePassword.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/functions/Validation.dart';
import '../../../widgets/CustomTextFormField.dart';

class CustomChangePasswordForm extends StatelessWidget {
  CustomChangePasswordForm({super.key});
  ChangePasswordImplement controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKey,
        child: Column(
          children: [
            CustomTextFormField(
                icon: null,
                hint: "Old Password",
                obscure: controller.passwordObscure,
                textEditingController: controller.oldPassword,
                validator: (val) {
                  return validation(val!, 6, 50, "name");
                },
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.changeObscurePassword();
                    },
                    icon: Icon(
                      controller.passwordObscure == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.darkGrey,
                    ))),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                icon: null,
                hint: "New Password",
                obscure: controller.newpasswordObscure,
                textEditingController: controller.newPassword,
                validator: (val) {
                  return validation(val!, 6, 50, "number");
                },
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.changeObscureNewPassword();
                    },
                    icon: Icon(
                      controller.newpasswordObscure == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.darkGrey,
                    ))),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                icon: null,
                hint: "Email Address",
                obscure: controller.confirmpasswordObscure,
                textEditingController: controller.confirmPassword,
                validator: (val) {
                  return confirmValidate(controller.newPassword.text,
                      controller.confirmPassword.text);
                },
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.changeObscureConfirmPassword();
                    },
                    icon: Icon(
                      controller.confirmpasswordObscure == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.darkGrey,
                    ))),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
