import 'package:e_commerce_app/controllers/main_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    //controller
    Get.put(MainController());

  }
}