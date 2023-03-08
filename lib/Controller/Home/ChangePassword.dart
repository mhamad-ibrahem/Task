import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:task/Core/classes/HiveKeys.dart';
import 'package:task/Core/constant/Colors.dart';
import 'package:task/Core/constant/Routes.dart';
import 'package:task/data/DataSource/remote/changePasswordData.dart';
import 'package:task/data/model/ChangePasswordModel.dart';
import '../../Core/classes/HiveBox.dart';
import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../Core/functions/warningAuthDialog.dart';

abstract class ChangePasswordController extends GetxController {
  changePassword();
  changeObscurePassword();
  changeObscureNewPassword();
  changeObscureConfirmPassword();
}

class ChangePasswordImplement extends ChangePasswordController {
  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;
  StatusRequest statusRequest = StatusRequest.none;
  ChangePasswordData changePasswordData = ChangePasswordData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Box authBox = Hive.box(HiveBox.authBox);
  bool passwordObscure = true;
  bool newpasswordObscure = true;
  bool confirmpasswordObscure = true;
  @override
  changePassword() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      ChangePasswordModel model = ChangePasswordModel(
          password: newPassword.text,
          confirmPassword: confirmPassword.text,
          oldPassword: oldPassword.text);
      statusRequest = StatusRequest.loading;
      update();
      var response = await changePasswordData.changePasswordData(
        model,
        authBox.get(HiveKeys.tokenKeY),
      );
      statusRequest = handilingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['success'] == true) {
          Get.offAllNamed(
            AppRoute.home,
          );
          Get.snackbar("Success", "Password change successfully",
              backgroundColor: AppColors.green,
              colorText: AppColors.white,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          warningAuthDialog('check your connection');
          statusRequest = StatusRequest.faliure;
        }
      }
      if (StatusRequest.serverFaliure == statusRequest) {
        warningAuthDialog("Your password is wrong");
         statusRequest = StatusRequest.faliure;
      }
      update();
    }
  }

  @override
  void onInit() {
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    oldPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }

  @override
  changeObscurePassword() {
    passwordObscure = !passwordObscure;
    update();
  }

  @override
  changeObscureNewPassword() {
    newpasswordObscure = !newpasswordObscure;
    update();
  }

  @override
  changeObscureConfirmPassword() {
    confirmpasswordObscure = !confirmpasswordObscure;
    update();
  }
}
