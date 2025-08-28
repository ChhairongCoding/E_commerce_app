import 'package:e_commerce_app/views/cart_screen.dart';
import 'package:e_commerce_app/views/home_screen.dart';
import 'package:e_commerce_app/views/notification_screen.dart';
import 'package:e_commerce_app/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxString title = 'Home'.obs;

  final List<Widget> listScreens = [
    HomeScreen(),
    CartScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  final List<Map<String , dynamic>> listIcons = [
    {'icon': HugeIcons.strokeRoundedHome01, 'name': 'Home'},
    {'icon': HugeIcons.strokeRoundedShoppingCart01, 'name': 'Your Cart'},
    {'icon': HugeIcons.strokeRoundedNotification01, 'name': 'Notification'},
    {'icon': HugeIcons.strokeRoundedUser, 'name': 'Profile'},
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
