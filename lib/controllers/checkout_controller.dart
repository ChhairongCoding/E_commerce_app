import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/payment_controller.dart';
import 'package:e_commerce_app/controllers/shipping_controller.dart';
import 'package:e_commerce_app/widgets/custom_payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final CartController cartController = Get.find<CartController>();
  final PaymentController paymentController = Get.find<PaymentController>();
  final ShippingController shippingController = Get.put(ShippingController());

  RxString paymentMethod = 'Cash On Delivery'.obs;

  void selectPaymentMethod() {
    if (shippingController.shippingList.isEmpty) {
    Get.snackbar(
      backgroundColor: Colors.white,
      colorText: Colors.black,
      
      "Error", "Please add shipping address");
    } else {
      Get.bottomSheet(CustomPaymentWidget());
    }
  }
}
