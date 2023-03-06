import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Core/constant/Routes.dart';
import 'package:task/data/DataSource/remote/Auth/updateData.dart';

import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../Core/functions/warningAuthDialog.dart';

abstract class UpdateController extends GetxController {
  updateInformation();
}

class UpdateImplement extends UpdateController {
  late TextEditingController updateEmail;
  late TextEditingController name;
  late TextEditingController phoneNumber;
  StatusRequest statusRequest = StatusRequest.none;
  UpdateData updateData = UpdateData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  updateInformation() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await updateData.updateData(
        name.text,
        updateEmail.text,
        phoneNumber.text,
        "9634",
      );
      statusRequest = handilingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['success'] == true) {
          Get.offAllNamed(
            AppRoute.home,
          );
        } else {
          warningAuthDialog('check your connection');
          statusRequest = StatusRequest.faliure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    updateEmail = TextEditingController();
    name = TextEditingController();
    phoneNumber = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    updateEmail.dispose();
    name.dispose();
    phoneNumber.dispose();
    super.onClose();
  }
}
