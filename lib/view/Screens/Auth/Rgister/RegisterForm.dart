import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Core/constant/Images.dart';
import '../../../../Controller/Auth/SignUp/SignUpController.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/functions/ShowCountryPicker.dart';
import '../../../../Core/functions/Validation.dart';
import '../../../widgets/CustomTextFormField.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});
  RegisterImplement controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.signUpState,
        child: Column(
          children: [
            CustomTextFormField(
                icon: null,
                hint: "Full Name",
                obscure: false,
                textEditingController: controller.name,
                validator: (val) {
                  return validation(val!, 3, 50, "name");
                },
                suffixIcon: null),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                icon: GestureDetector(
                  onTap: () {
                    showCountryDialog(controller.countryList, () {
                      controller.changeCounty(
                        controller.countryList,
                        1,
                      );
                    }, '1');
                  },
                  child: SizedBox(
                    width: 35,
                    height: 30,
                    child: Image.asset(
                      controller.countryCode == '+20'
                          ? AppImages.egyptFlagImage
                          : controller.countryImage!,
                    ),
                  ),
                ),
                hint: "555994435",
                obscure: false,
                textEditingController: controller.phoneNumber,
                validator: (val) {
                  return validation(val!, 10, 10, "number");
                },
                suffixIcon: null),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                icon: null,
                hint: "Email Address",
                obscure: false,
                textEditingController: controller.signUpEmail,
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
                obscure: controller.passwordObscure,
                textEditingController: controller.signUppassword,
                validator: (val) {
                  return validation(val!, 6, 30, "name");
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
                hint: "Confirm Password",
                obscure: controller.confirmPasswordObscure,
                textEditingController: controller.signUppasswordConfirm,
                validator: (val) {
                  return confirmValidate(controller.signUppassword.text,
                      controller.signUppasswordConfirm.text);
                },
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.changeObscureConfirmPassword();
                    },
                    icon: Icon(
                      controller.confirmPasswordObscure == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.darkGrey,
                    ))),
            const SizedBox(
              height: 40,
            ),
          ],
        ));
  }
}
