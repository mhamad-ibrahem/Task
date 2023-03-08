import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
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
  void initialData();
  changeCounty(List<CountryModel> country, int index);
}

class RegisterImplement extends RegisterController {
  Box? authBox; //where i store user information
  late TextEditingController signUpEmail;
  late TextEditingController signUppassword;
  late TextEditingController signUppasswordConfirm;
  late TextEditingController name;
  late TextEditingController phoneNumber;
  GlobalKey<FormState> signUpState = GlobalKey<FormState>();
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;
  StatusRequest statusRequest =
      StatusRequest.none; // to hamdiling request state
  List<CountryModel> countryList = countryData;
  String? countryImage;
  String countryCode = '+20';

  SignupData signupData = SignupData(Get.find());
  @override
  void goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void completevalidate() async {
    var formData = signUpState.currentState;
    print(countryCode);
    if (formData!.validate()) {
      //check validation
      //adding data to request
      RegisterModel registerModel = RegisterModel(
          password: signUppassword.text,
          confirmPassword: signUppasswordConfirm.text,
          name: name.text,
          countryCode: countryCode,
          phone: phoneNumber.text,
          email: signUpEmail.text);
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(registerModel);
      statusRequest = handilingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['success'] == true) {
          //store user information
          authBox!.put(HiveKeys.userNameKey, response['data']['name']);
          authBox!.put(HiveKeys.emailKey, response['data']['email']);
          authBox!.put(HiveKeys.phoneKey, response['data']['phone']);
          authBox!
              .put(HiveKeys.countryCodeKey, response['data']['country_code']);
          authBox!.put(HiveKeys.idKey, response['data']['id']);
          authBox!.put(HiveKeys.tokenKeY, response['data']['token']);
          Get.offAllNamed(AppRoute.home);
        } else {
          warningAuthDialog('email or phone number already exsist');
          statusRequest = StatusRequest.faliure;
        }
      }
      if (StatusRequest.serverFaliure == statusRequest) {
        warningAuthDialog('email or phone number already exsist');
        statusRequest = StatusRequest.faliure;
      }

      update();
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
    initialData();
    super.onInit();
  }

  @override
  void onClose() {
    //t dispose textEditing controller after close
    signUpEmail.dispose();
    signUppassword.dispose();
    signUppasswordConfirm.dispose();
    name.dispose();
    phoneNumber.dispose();
    super.onClose();
  }

  @override
  changeCounty(country, index) {
    // change the flage and country code
    countryCode = country[index].code;
    countryImage = country[index].image;
    Get.back();
    update();
  }

  @override
  void openBox() async {
    authBox = await Hive.openBox(HiveBox.authBox);
  }

  @override
  void initialData() {
    signUpEmail = TextEditingController();
    signUppassword = TextEditingController();
    signUppasswordConfirm = TextEditingController();
    name = TextEditingController();
    phoneNumber = TextEditingController();
  }
}
