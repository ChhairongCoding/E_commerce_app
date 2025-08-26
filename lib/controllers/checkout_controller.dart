import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/payment_controller.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final CartController cartController = Get.find<CartController>();
  final PaymentController paymentController = Get.find<PaymentController>();

  RxString paymentMethod = 'Cash On Delivery'.obs;

  
}
