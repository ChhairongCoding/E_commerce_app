import 'package:e_commerce_app/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find<MainController>();

    return Scaffold(
      body: Obx(
        () => mainController.listScreens[mainController.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: mainController.currentIndex.value,
          onTap: mainController.toggleSwitch,
          selectedItemColor: Colors.blue,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(HugeIcons.strokeRoundedHome01),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(HugeIcons.strokeRoundedFavourite),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
