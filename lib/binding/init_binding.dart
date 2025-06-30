import 'package:e_commerce_app/controllers/login_controller.dart';
import 'package:e_commerce_app/controllers/otp_controller.dart';
import 'package:e_commerce_app/controllers/signup_controller.dart';
import 'package:e_commerce_app/controllers/main_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    //controller
    Get.put(MainController());
    Get.put(LoginController());
    Get.put(SignupController());
    Get.put(OtpController());

  }
}