
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../classes/HiveBox.dart';

class Services extends GetxService {
  //i use it for intialize all data i need insted of intialize it in the main funcation 
  late Box box;
  Future<Services> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(HiveBox.authBox);
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}

