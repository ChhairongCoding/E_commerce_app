import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/views/auth_view/login_screen.dart';
import 'package:e_commerce_app/views/auth_view/sign_up_screen.dart';
import 'package:e_commerce_app/views/cart_screen.dart';
import 'package:e_commerce_app/views/completed_order_screen.dart';
import 'package:e_commerce_app/views/favorite_screen.dart';
import 'package:e_commerce_app/views/getting_start_screen.dart';
import 'package:e_commerce_app/views/auth_view/otp_screen.dart';
import 'package:e_commerce_app/views/home_screen.dart';
import 'package:e_commerce_app/views/main_views/main_screen.dart';
import 'package:e_commerce_app/views/my_order_screen.dart';
import 'package:e_commerce_app/views/notification_screen.dart';
import 'package:e_commerce_app/views/payment_view/checkout_screen.dart';
import 'package:e_commerce_app/views/payment_view/payment_card_screen.dart';
import 'package:e_commerce_app/views/payment_view/payment_form_screen.dart';
import 'package:e_commerce_app/views/shipping_view/shipping_screen.dart';
import 'package:e_commerce_app/views/categories_screen.dart';
import 'package:e_commerce_app/views/theme_screen.dart';
import 'package:e_commerce_app/widgets/custom_detail_product.dart';
import 'package:get/get_navigation/get_navigation.dart';

List<GetPage<dynamic>> get appPages {
  return [
    GetPage(
      name: AppRoutes.gettingStartRoute,
      page: () => GettingStartScreen(),
    ),
    GetPage(name: AppRoutes.loginRoute, page: () => LoginScreen()),
    GetPage(name: AppRoutes.signUpRoute, page: () => SignUpScreen()),
    GetPage(name: AppRoutes.otpRoute, page: () => OtpScreen()),
    GetPage(name: AppRoutes.mainScreenRoute, page: () => MainScreen()),
    GetPage(name: AppRoutes.detail, page: () => CustomDetailProduct()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.notification, page: () => NotificationScreen()),
    GetPage(name: AppRoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: AppRoutes.shipping, page: () => ShippingScreen()),
    GetPage(name: AppRoutes.theme, page: () => ThemeScreen()),
     GetPage(name: AppRoutes.category, page: () => CategoriesScreen()),
     GetPage(name: AppRoutes.cart, page: () => CartScreen()),
     GetPage(name: AppRoutes.myOrder, page: () => MyOrderScreen()),
     GetPage(name: AppRoutes.paymentCard, page: () => PaymentCardScreen()),
     GetPage(name: AppRoutes.favorite, page: () => FavoriteScreen()),
     GetPage(name: AppRoutes.createCreditCard, page: () => PaymentFormScreen()),
     GetPage(name: AppRoutes.completedOrder, page: () => CompletedOrderScreen()),
  ];
}
