import 'package:e_commerce_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = Get.find<AppTheme>();

    return Scaffold(
      appBar: AppBar(title: const Text("Theme Settings")),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => SwitchListTile(
            title: const Text("Dark Mode"),
            value: appTheme.isDarkMode.value,
            onChanged: (val) {
              appTheme.toggleDarkMode(); 
              Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light);
            },
            secondary: const Icon(Icons.dark_mode),
          ),
        ),
      ),
    );
  }
}
