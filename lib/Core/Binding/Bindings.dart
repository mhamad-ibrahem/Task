
import 'package:get/get.dart';

import '../classes/Crud.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}