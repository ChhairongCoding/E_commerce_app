import 'package:e_commerce_app/binding/init_binding.dart';
import 'package:e_commerce_app/core/utils/app_pages.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final AppTheme themeController = Get.put(AppTheme());

    return Obx(
      () => GetMaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
        initialBinding: InitBinding(),
        title: 'SlowKey Kits',
        initialRoute: AppRoutes.mainScreenRoute,
        getPages: appPages,
      ),
    );
  }
}
