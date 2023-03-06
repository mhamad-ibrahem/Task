import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:task/Core/constant/Colors.dart';
import 'package:task/data/model/RegisterModel.dart';

import '../../../Core/Constant/routes.dart';
import '../../../Core/classes/HiveBox.dart';
import '../../../Core/classes/HiveKeys.dart';
import '../../../Core/classes/statusRequest.dart';
import '../../../Core/functions/handilingData.dart';
import '../../../Core/functions/warningAuthDialog.dart';
import '../../../data/DataSource/remote/Auth/signupData.dart';
import '../../../data/DataSource/static/CountryData.dart';
import '../../../data/model/countryModel.dart';

abstract class RegisterController extends GetxController {
  void goToLogin();
  void completevalidate();
  void changeObscurePassword();
  void changeObscureConfirmPassword();
  void openBox();
  changeCounty(List<CountryModel> country, int index);
}

class RegisterImplement extends RegisterController {
  Box? authBox;
  late TextEditingController signUpEmail;
  late TextEditingController signUppassword;
  late TextEditingController signUppasswordConfirm;
  late TextEditingController name;
  late TextEditingController phoneNumber;
  GlobalKey<FormState> signUpState = GlobalKey<FormState>();
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;
  StatusRequest statusRequest = StatusRequest.none;
  List<CountryModel> countryList = countryData;
  String? countryImage;
  String? countryCode;

  SignupData signupData = SignupData(Get.find());
  @override
  void goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void completevalidate() async {
    var formData = signUpState.currentState;
    print(countryCode);
    if ((formData!.validate() && countryCode != null)) {
      RegisterModel registerModel = RegisterModel(
          password: signUppassword.text,
          confirmPassword: signUppasswordConfirm.text,
          name: name.text,
          countryCode: countryCode!,
          phone: phoneNumber.text,
          email: signUpEmail.text);
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(registerModel);
      statusRequest = handilingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['success'] == true) {
          authBox!.put(HiveKeys.userNameKey, response['data']['name']);
          authBox!.put(HiveKeys.emailKey, response['data']['email']);
          authBox!.put(HiveKeys.phoneKey, response['data']['phone']);
          authBox!
              .put(HiveKeys.countryCodeKey, response['data']['country_code']);
          authBox!.put(HiveKeys.idKey, response['data']['id']);
          authBox!.put(HiveKeys.tokenKeY, response['data']['token']);
          authBox!
              .put(HiveKeys.tokenExpiryKey, response['data']['token_expiry']);
          Get.offAllNamed(AppRoute.home);
        } else {
          warningAuthDialog('email or phone number already exsist');
          statusRequest = StatusRequest.faliure;
        }
      }
      
      update();
    } else {
      Get.snackbar("WARNING", "chose country or check valid",
          backgroundColor: AppColors.white);
    }
  }

  @override
  void changeObscureConfirmPassword() {
    confirmPasswordObscure = !confirmPasswordObscure;
    update();
  }

  @override
  void changeObscurePassword() {
    passwordObscure = !passwordObscure;
    update();
  }

  @override
  void onInit() {
    openBox();
    signUpEmail = TextEditingController();
    signUppassword = TextEditingController();
    signUppasswordConfirm = TextEditingController();
    name = TextEditingController();
    phoneNumber = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    signUpEmail.dispose();
    signUppassword.dispose();
    signUppasswordConfirm.dispose();
    name.dispose();
    phoneNumber.dispose();
    super.onClose();
  }

  @override
  changeCounty(country, index) {
    countryCode = country[index].code;
    countryImage = country[index].image;
    Get.back();
    print(countryCode);
    print(countryImage);
    update();
  }

  @override
  void openBox() async {
    authBox = await Hive.openBox(HiveBox.authBox);
  }
}
