import 'package:get/get.dart';
import 'package:task/Core/constant/Routes.dart';

class WelcomController extends GetxController{
  goToRigester(){
   Get.toNamed(AppRoute.register);
  }
  goToLogin(){
    Get.toNamed(AppRoute.login);
  }
}