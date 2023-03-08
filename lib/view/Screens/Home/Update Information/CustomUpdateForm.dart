import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/Home/UpdateController.dart';
import '../../../../Core/constant/Images.dart';
import '../../../../Core/functions/ShowCountryPicker.dart';
import '../../../../Core/functions/Validation.dart';
import '../../../widgets/CustomTextFormField.dart';

class CustomUpdateForm extends StatelessWidget {
  CustomUpdateForm({super.key});
  UpdateImplement controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKey,
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
                    }, '2');
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
                  return validation(val!, 2, 10, "number");
                },
                suffixIcon: null),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                icon: null,
                hint: "Email Address",
                obscure: false,
                textEditingController: controller.updateEmail,
                validator: (val) {
                  return validation(val!, 11, 50, "name");
                },
                suffixIcon: null),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
