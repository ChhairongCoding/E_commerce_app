import 'package:e_commerce_app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartModel> cartList = <CartModel>[].obs;
  RxList<bool> selectedItems = <bool>[].obs;
  RxInt totalQuantity = 0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxDouble shippingPrice = 2.0.obs;
  RxDouble subTotal = 0.0.obs;

  /// Sync selected items list when cart changes
  void syncSelectedItems() {
    selectedItems.value = List.generate(cartList.length, (_) => true);
    calculateTotal();
  }

  /// Calculate total based only on selected items
  void calculateTotal() {
    subTotal.value = 0.0;
    totalQuantity.value = 0; // ✅ Reset before summing
    for (int i = 0; i < cartList.length; i++) {
      if (selectedItems[i]) {
        subTotal.value += cartList[i].price * cartList[i].quantity;
        totalQuantity.value += cartList[i].quantity;
      }
    }
    totalPrice.value = subTotal.value;
    subTotal.value += shippingPrice.value;
  }

  void incrementQuantity(int index) {
    final item = cartList[index];
    cartList[index] = item.copyWith(quantity: item.quantity + 1);

    calculateTotal();
  }

  void decrementQuantity(int index) {
    final item = cartList[index];
    if (item.quantity > 1) {
      cartList[index] = item.copyWith(quantity: item.quantity - 1);
      calculateTotal();
    } else {
      removeCart(index);
    }
  }

  void addToCart(CartModel product) {
    int index = cartList.indexWhere((item) => item.name == product.name);
    if (index >= 0) {
      var updated = cartList[index].copyWith(
        quantity: cartList[index].quantity + 1,
      );
      cartList[index] = updated;
    } else {
      cartList.add(product.copyWith(quantity: 1));
      selectedItems.add(true); // default to selected
    }
    calculateTotal();
    Get.snackbar(
      "Cart",
      "${product.name} added to cart!",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
    );
  }

  void removeCart(int index) {
    cartList.removeAt(index);
    selectedItems.removeAt(index);
    calculateTotal();
    Get.snackbar(
      'Item Removed',
      'The item has been removed from your cart.',
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }

  /// Toggle a single item's checkbox
  void toggleItemSelection(int index) {
    selectedItems[index] = !selectedItems[index];
    selectedItems.refresh();
    calculateTotal();
  }

  /// Toggle "select all"
  void toggleSelectAll(bool? value) {
    selectedItems.value = List.generate(cartList.length, (_) => value ?? false);
    calculateTotal();
  }

  /// Check if all items are selected
  bool get isAllSelected => selectedItems.every((item) => item == true);
}
