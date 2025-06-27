import 'package:e_commerce_app/views/favorite_screen.dart';
import 'package:e_commerce_app/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<Widget> listScreens = [HomeScreen(), FavoriteScreen()];

  void toggleSwitch(int value) {
    currentIndex.value = value;
  }
}
