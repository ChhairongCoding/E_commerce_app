import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Map<String, dynamic>> cartList = <Map<String, dynamic>>[].obs;

  void addToCart(Map<String, dynamic> product) {
    int index = cartList.indexWhere((item) => item['name'] == product['name']);
    if (index >= 0) {
      cartList[index]['quantity'] = (cartList[index]['quantity'] ?? 1) + 1;
      cartList.refresh();
    } else {
      cartList.add({...product, 'quantity': 1}); // ✅ Proper map
    }
    Get.snackbar(
      "Cart",
      "${product['name']} added to cart!",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
    );
  }

  void removeCart(int index) {
    cartList.removeAt(index);
    Get.snackbar(
      'Item Removed',
      'The item has been removed from your cart.',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }
}
