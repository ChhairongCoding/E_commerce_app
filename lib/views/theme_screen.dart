import 'package:e_commerce_app/controllers/drawer_controller_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawerControllerX drawerController = Get.find<DrawerControllerX>();

    return Scaffold(
      appBar: AppBar(title: Text("Title")),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => SwitchListTile(
            title: const Text("Dark Mode"),
            value: drawerController.isDarkMode.value,
            onChanged: (val) {
              drawerController.isDarkMode.value = val;
              Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light);
            },
            secondary: const Icon(Icons.dark_mode),
          ),
        ),
      ),
    );
  }
}
