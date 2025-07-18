import 'package:e_commerce_app/views/cart_screen.dart';
import 'package:e_commerce_app/views/home_screen.dart';
import 'package:e_commerce_app/views/profile_screen.dart';
import 'package:e_commerce_app/views/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxString title = 'Home'.obs;

  final List<Widget> listScreens = [
    HomeScreen(),
    ShopScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void toggleSwitch(int value) {
    currentIndex.value = value;
    if (value == 0) {
      title("Home");
    } else if (value == 1) {
      title("Discover");
    } else if (value == 2) {
      title("Your Cart");
    } else {
      title("Profile");
    }
  }
}
