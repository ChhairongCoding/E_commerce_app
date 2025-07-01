import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/controllers/login_controller.dart';
import 'package:e_commerce_app/controllers/otp_controller.dart';
import 'package:e_commerce_app/controllers/signup_controller.dart';
import 'package:e_commerce_app/views/main_views/main_controller.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:e_commerce_app/views/new_arrival_view/main_new_arrival_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    //controller
    Get.put(MainController());
    Get.put(MainNewArrivalController());
    Get.put(LoginController());
    Get.put(SignupController());
    Get.put(OtpController());
    Get.put(HomeController());

    //service
    Get.put(AuthService());

  }
}