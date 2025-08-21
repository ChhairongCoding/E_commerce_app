import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/checkout_controller.dart';
import 'package:e_commerce_app/controllers/favorite_controller.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/controllers/login_controller.dart';
import 'package:e_commerce_app/controllers/otp_controller.dart';
import 'package:e_commerce_app/controllers/payment_controller.dart';
import 'package:e_commerce_app/controllers/product_detail_controller.dart';
import 'package:e_commerce_app/controllers/shop_controller.dart';
import 'package:e_commerce_app/controllers/signup_controller.dart';
import 'package:e_commerce_app/theme/app_theme.dart';
import 'package:e_commerce_app/views/main_views/main_controller.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    //controller
    Get.put(MainController());
    Get.put(LoginController());
    Get.put(SignupController());
    Get.put(OtpController());
    Get.put(HomeController());
    Get.put(CartController());
    Get.put(ShopController());
    Get.put(FavoriteController());
    Get.put(AppTheme());
    Get.put(PaymentController());
    Get.put(ProductDetailController());
    Get.put(CheckoutController());

    //service
    Get.put(AuthService());
  }
}
