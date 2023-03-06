import 'package:flutter/material.dart';
import 'package:task/Core/constant/Routes.dart';
import 'package:task/routes.dart';
import 'package:get/get.dart';
import 'Core/Binding/Bindings.dart';
import 'Core/Theme/Themes.dart';
import 'Core/services/Services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task',
      getPages: routes,
      initialRoute: AppRoute.welcom,
      theme: Themes.lightsTheme,
      initialBinding: MyBindings(),
    );
  }
}
