import 'package:e_commerce_app/binding/init_binding.dart';
import 'package:e_commerce_app/core/utils/app_pages.dart';
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
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 30,fontFamily: 'Sora',fontWeight: FontWeight.w700,color: Colors.black),
          titleMedium: TextStyle(fontSize: 20,fontFamily: 'Sora',fontWeight: FontWeight.w600,color: Colors.black),
          titleSmall: TextStyle(fontSize: 16,fontFamily: 'Sora',fontWeight: FontWeight.w600,color: Colors.black),
          bodyLarge: TextStyle(fontSize: 20,fontFamily: 'Sora',color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16,fontFamily: 'Sora',fontWeight: FontWeight.w400,color: Colors.black),
          bodySmall: TextStyle(fontSize: 14,fontFamily: 'Sora',fontWeight: FontWeight.w400,color: Colors.black)
          )
      ),
      initialBinding: InitBinding(),
      title: 'E-Commerce App',
      initialRoute: '/',
      getPages: appPages,
    );
  }


}

