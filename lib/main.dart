import 'package:e_commerce_app/binding/init_binding.dart';
import 'package:e_commerce_app/views/auth/login_screen.dart';
import 'package:e_commerce_app/views/auth/sign_up_screen.dart';
import 'package:e_commerce_app/views/getting_start_screen.dart';
// import 'package:e_commerce_app/views/main_screen.dart';
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
          titleLarge: TextStyle(fontSize: 30,fontFamily: 'Sora',fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 20,fontFamily: 'Sora',fontWeight: FontWeight.w600),
          titleSmall: TextStyle(fontSize: 16,fontFamily: 'Sora',fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 20,fontFamily: 'Sora',),
          bodyMedium: TextStyle(fontSize: 16,fontFamily: 'Sora',fontWeight: FontWeight.w600),
          bodySmall: TextStyle(fontSize: 14,fontFamily: 'Sora',fontWeight: FontWeight.w500)
          )
      ),
      initialBinding: InitBinding(),
      title: 'E-Commerce App',
      initialRoute: '/',
      getPages: [
        GetPage(name: "/", page: () => GettingStartScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
      
      ],
    );
  }
}

