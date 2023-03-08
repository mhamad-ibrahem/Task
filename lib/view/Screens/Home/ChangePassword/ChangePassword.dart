import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Core/classes/HandilingData.dart';
import '../../../../Controller/Home/ChangePassword.dart';
import '../../../../Core/constant/Size.dart';
import '../../../widgets/CustomButton.dart';
import '../../../widgets/CustomScaffold.dart';
import 'CustomChangePasswordForm.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  ChangePasswordImplement controller = Get.put(ChangePasswordImplement());
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: "Change Password",
        widget: GetBuilder<ChangePasswordImplement>(
          builder:(controller)=> HandilingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                CustomChangePasswordForm(),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: "Save",
                  width: AppSize.screenWidth * 0.75,
                  isPurple: true,
                  onPressed: () {
                    controller.changePassword();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
