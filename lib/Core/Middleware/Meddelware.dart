
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Constant/routes.dart';
import '../classes/HiveKeys.dart';
import '../services/Services.dart';

class MiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  Services services = Get.find();
  @override 
  RouteSettings? redirect(String? route){
     
   if(services.box.get(HiveKeys.tokenKeY) !=null){
   
    return const RouteSettings(name: AppRoute.home);
   }
   
   return null;
  }
}
