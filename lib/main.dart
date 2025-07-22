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

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: ThemeData.dark(),
      initialBinding: InitBinding(),
      title: 'SlowKey Kits',
      initialRoute: AppRoutes.mainScreenRoute,
      getPages: appPages,
    );
  }
}
