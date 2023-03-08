import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../Core/Constant/routes.dart';
import '../../../Core/classes/HiveBox.dart';
import '../../../Core/classes/HiveKeys.dart';
import '../../../Core/classes/statusRequest.dart';
import '../../../Core/functions/handilingData.dart';
import '../../../Core/functions/warningAuthDialog.dart';
import '../../../Core/services/Services.dart';
import '../../../data/DataSource/remote/Auth/loginData.dart';
import '../../../data/model/LoginModel.dart';

abstract class LoginController extends GetxController {
  GlobalKey<FormState> signinState = GlobalKey<FormState>();
  void signInvalidate();
  void changeObscure();
  void goToSignUp();
  void openBox();
}

class LoginImplement extends LoginController {
  Box? authBox; //where i store user information
  bool obscureVisability = true;
  late TextEditingController signinEmail;
  late TextEditingController signinpassword;
  StatusRequest statusRequest =
      StatusRequest.none; // to hamdiling request state
  LoginData loginData = LoginData(Get.find());
  Services services = Get.find();

  @override
  void signInvalidate() async {
    var formData = signinState.currentState;
    if (formData!.validate()) {
      //check validation
      LoginModel loginModel = //adding data to request
          LoginModel(password: signinpassword.text, email: signinEmail.text);
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(loginModel);
      statusRequest = handilingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['success'] == true) {
          //storing data information
          authBox!.put(HiveKeys.userNameKey, response['data']['name']);
          authBox!.put(HiveKeys.emailKey, response['data']['email']);
          authBox!.put(HiveKeys.phoneKey, response['data']['phone']);
          authBox!
              .put(HiveKeys.countryCodeKey, response['data']['country_code']);
          authBox!.put(HiveKeys.idKey, response['data']['id']);
          authBox!.put(HiveKeys.tokenKeY, response['data']['token']);
          Get.offAllNamed(AppRoute.home);
        } else {
          print(response['success']);
          warningAuthDialog('email or password is wrong');
          statusRequest = StatusRequest.faliure;
        }
      }
      if (StatusRequest.serverFaliure == statusRequest) {
        warningAuthDialog('email or password is wrong');
        statusRequest = StatusRequest.faliure;
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.register);
    signinEmail.clear();
    signinpassword.clear();
  }

  @override
  void changeObscure() {
    obscureVisability = !obscureVisability;
    update();
  }

  @override
  void onInit() {
    openBox();
    signinEmail = TextEditingController();
    signinpassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    signinEmail.dispose();
    signinpassword.dispose();
    super.dispose();
  }

  @override
  void openBox() async {
    authBox = await Hive.openBox(HiveBox.authBox);
  }
}
