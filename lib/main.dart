import 'package:e_commerce_app/binding/init_binding.dart';
import 'package:e_commerce_app/views/auth/login_screen.dart';
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
      initialBinding: InitBinding(),
      title: 'E-Commerce App',
      initialRoute: '/',
      getPages: [
        GetPage(name: "/", page: () => GettingStartScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
      ],
    );
  }
}


// class RootScreen extends StatelessWidget {
//   // final TokenService tokenService = Get.find();
//   RootScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     String? token = tokenService.getToken();
//     return token.isNotEmpty ? MainScreen() : SignInScreen();
//   }
// }