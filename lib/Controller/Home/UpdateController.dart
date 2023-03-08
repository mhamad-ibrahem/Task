import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:task/Core/classes/HiveKeys.dart';
import 'package:task/Core/constant/Colors.dart';
import 'package:task/Core/constant/Routes.dart';
import 'package:task/data/DataSource/remote/updateData.dart';
import 'package:task/data/model/UpdateUserModel.dart';
import '../../Core/classes/HiveBox.dart';
import '../../Core/classes/statusRequest.dart';
import '../../Core/functions/handilingData.dart';
import '../../Core/functions/warningAuthDialog.dart';
import '../../data/DataSource/static/CountryData.dart';
import '../../data/model/countryModel.dart';

abstract class UpdateController extends GetxController {
  updateInformation();
  initialData();
  changeCounty(List<CountryModel> country, int index);
}

class UpdateImplement extends UpdateController {
  late TextEditingController updateEmail;
  late TextEditingController name;
  late TextEditingController phoneNumber;
  StatusRequest statusRequest = StatusRequest.none;
  UpdateData updateData = UpdateData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Box authBox = Hive.box(HiveBox.authBox);
  List<CountryModel> countryList = countryData;
  String? countryImage;
  String countryCode = '+20';

  @override
  updateInformation() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      UpdateUserModel model = UpdateUserModel(
        name: name.text,
        email: updateEmail.text,
        phone: phoneNumber.text,
        countryCode: countryCode,
      );
      statusRequest = StatusRequest.loading;
      update();
      var response = await updateData.updateData(
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
          authBox.put(HiveKeys.userNameKey, response['data']['name']);
          authBox.put(HiveKeys.emailKey, response['data']['email']);
          authBox.put(HiveKeys.phoneKey, response['data']['phone']);
          authBox.put(
              HiveKeys.countryCodeKey, response['data']['country_code']);
          Get.snackbar("Success", "Your information is updated successfuly",
              backgroundColor: AppColors.green,
              colorText: AppColors.white,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          warningAuthDialog(response['message']);
          statusRequest = StatusRequest.faliure;
        }
      }
      if (StatusRequest.serverFaliure == statusRequest) {
        warningAuthDialog("Phone number or email has already been taken");
        statusRequest = StatusRequest.faliure;
      }
      update();
    }
  }

  @override
  changeCounty(country, index) {
    countryCode = country[index].code;
    countryImage = country[index].image;
    Get.back();
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void onClose() {
    updateEmail.dispose();
    name.dispose();
    phoneNumber.dispose();
    super.onClose();
  }

  @override
  initialData() {
    updateEmail = TextEditingController();
    name = TextEditingController();
    phoneNumber = TextEditingController();
  }
}
