  import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/views/auth/login_screen.dart';
import 'package:e_commerce_app/views/auth/sign_up_screen.dart';
import 'package:e_commerce_app/views/getting_start_screen.dart';
import 'package:e_commerce_app/views/auth/otp_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

List<GetPage<dynamic>> get appPages {
    return [
      GetPage(name: AppRoutes.gettingStartRoute, page: () => GettingStartScreen()),
      GetPage(name: AppRoutes.loginRoute, page: () => LoginScreen()),
      GetPage(name: AppRoutes.signUpRoute, page: () => SignUpScreen()),    
      GetPage(name: AppRoutes.otpRoute, page: ()=> OtpScreen())  
    ];
  }