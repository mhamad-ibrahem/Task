import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:task/Core/constant/Routes.dart';
import 'package:task/view/Screens/Welcom/WelcomScreen.dart';

import '../../Core/classes/HiveBox.dart';
import '../../Core/classes/HiveKeys.dart';

abstract class HomeController extends GetxController {
  goToUpdateInformation();
  logOut();
  initialData();
}

class HomeImplement extends HomeController {
  Box authBox = Hive.box(HiveBox.authBox);
  String? name;
  String? countryCode;
  String? phoneNumber;
  String? emeil;

  @override
  goToUpdateInformation() {
    Get.toNamed(AppRoute.updateInformation);
  }

  @override
  logOut() {
    Hive.box(HiveBox.authBox).clear();
    Get.offAll(()=> const WelcomScreen(),transition: Transition.fade,);
  }

  @override
  initialData() {
    name = authBox.get(HiveKeys.userNameKey);
    countryCode = authBox.get(HiveKeys.countryCodeKey);
    phoneNumber = authBox.get(HiveKeys.phoneKey);
    emeil = authBox.get(HiveKeys.emailKey);
    print("================================================");
    print("================================================");
    print(authBox.get(HiveKeys.tokenKeY));
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
