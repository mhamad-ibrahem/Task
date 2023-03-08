
import 'package:get/get.dart';
import '../classes/Crud.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    // to injection the crud class from the start of the application work
    Get.put(Crud());
  }

}