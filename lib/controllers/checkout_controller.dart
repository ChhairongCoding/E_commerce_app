import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/payment_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/models/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CheckoutController extends GetxController {
  final CartController cartController = Get.find<CartController>();
  final PaymentController paymentController = Get.find<PaymentController>();
  
  RxList<CheckoutModel> orderList = <CheckoutModel>[].obs;
  RxString paymentMethod = 'Cash On Delivery'.obs;

  void confirmOrder() {
    if (!paymentController.isCard.value) {
      for (var item in cartController.cartList) {
        orderList.add(
          CheckoutModel(
            name: item.name,
            price: item.price,
            quantity: item.quantity,
            images: item.images,
            selectedSize: item.selectedSize,
            selectedColor: item.selectedColor,
            status: 'Pending',
          ),
        );
      }
      Get.toNamed(AppRoutes.completedOrder);
    } else {
      Get.bottomSheet(
        Container(
          width: double.infinity,
          height: 500,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Choose Payment Method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
        
            ],
          ),
        ),
      );
    }
  }
}
