import 'package:get/get.dart';
import 'package:task/view/Screens/Auth/Login/Login.dart';
import 'package:task/view/Screens/Auth/Rgister/Register.dart';
import 'package:task/view/Screens/Home/ChangePassword/ChangePassword.dart';
import 'package:task/view/Screens/Home/HomeScreen.dart';
import 'package:task/view/Screens/Home/Update%20Information/UpdateInformation.dart';
import 'package:task/view/Screens/Welcom/WelcomScreen.dart';

import 'Core/Middleware/Meddelware.dart';
import 'Core/constant/Routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.welcom,
    page: () => const WelcomScreen(),
    middlewares: [MiddleWare()],
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 1000),
  ),
  GetPage(
    name: AppRoute.register,
    page: () => RegisterScreen(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 1000),
  ),
  GetPage(
    name: AppRoute.login,
    page: () => LoginScreen(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 1000),
  ),
  GetPage(
    name: AppRoute.home,
    page: () => HomeScreen(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 1000),
  ),
  GetPage(
    name: AppRoute.updateInformation,
    page: () => UpdateInformation(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 1000),
  ),
  GetPage(
    name: AppRoute.changePassword,
    page: () => ChangePasswordScreen(),
    transition: Transition.fade,
    transitionDuration: const Duration(milliseconds: 1000),
  ),
];
