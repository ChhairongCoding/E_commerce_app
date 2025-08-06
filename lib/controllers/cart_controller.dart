import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Map<String, dynamic>> cartList = <Map<String, dynamic>>[].obs;
  RxDouble totalPrice = 0.0.obs;

  void calculateTotal() {
    double total = 0.0;
    for (var item in cartList) {
      double price = double.tryParse(item["price"].toString()) ?? 0.0;
      int quantity = item["quantity"] ?? 1;
      total += price * quantity;
    }
    totalPrice.value = total;
  }

  void addToCart(Map<String, dynamic> product) {
    int index = cartList.indexWhere((item) => item['name'] == product['name']);
    if (index >= 0) {
      cartList[index]['quantity'] = (cartList[index]['quantity'] ?? 1) + 1;
      cartList.refresh();
    } else {
      cartList.add({...product, 'quantity': 1});
    }
    calculateTotal();
    Get.snackbar(
      "Cart",
      "${product['name']} added to cart!",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
    );
  }

  void removeCart(int index) {
    cartList.removeAt(index);
    calculateTotal(); // 👈 Add this
    Get.snackbar(
      'Item Removed',
      'The item has been removed from your cart.',
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }
}
