import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:task/Core/classes/statusRequest.dart';
import 'package:task/Core/constant/Routes.dart';
import 'package:task/view/Screens/Welcom/WelcomScreen.dart';
import '../../Core/classes/HiveBox.dart';
import '../../Core/classes/HiveKeys.dart';
import '../../Core/functions/handilingData.dart';
import '../../data/DataSource/remote/deleteData.dart';

abstract class HomeController extends GetxController {
  goToUpdateInformation();
  logOut();
  initialData();
  deleteAccount();
  goChangePassword();
}

class HomeImplement extends HomeController {
  Box authBox = Hive.box(HiveBox.authBox);
  String? name;
  String? countryCode;
  String? phoneNumber;
  String? emeil;
  StatusRequest statusRequest = StatusRequest.none;
  DeleteData deleteData = DeleteData(Get.find());
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  goToUpdateInformation() {
    Get.toNamed(AppRoute.updateInformation);
  }

  @override
  goChangePassword() {
    Get.toNamed(AppRoute.changePassword);
  }

  @override
  logOut() {
    Hive.box(HiveBox.authBox).clear();
    Get.offAll(
      () => const WelcomScreen(),
      transition: Transition.fade,
    );
  }

  @override
  initialData() {
    name = authBox.get(HiveKeys.userNameKey);
    countryCode = authBox.get(HiveKeys.countryCodeKey);
    phoneNumber = authBox.get(HiveKeys.phoneKey);
    emeil = authBox.get(HiveKeys.emailKey);
  }

  @override
  deleteAccount() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteData.deleteData(
      authBox.get(HiveKeys.tokenKeY),
    );
    statusRequest = handilingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        Hive.box(HiveBox.authBox).clear();
        Get.offAll(
          const WelcomScreen(),
        );
      } else {
        statusRequest = StatusRequest.faliure;
      }
      update();
    }
  }
}
