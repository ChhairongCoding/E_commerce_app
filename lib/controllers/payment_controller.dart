import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/models/checkout_model.dart';
import 'package:e_commerce_app/models/payment_method_model.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final CartController cartController = Get.find();

  RxList<CheckoutModel> orderList = <CheckoutModel>[].obs;
  RxString paymentMethod = ''.obs;
  RxInt selectedIndex = (-1).obs; // -1 = none selected

  List<PaymentMethodModel> paymentList = <PaymentMethodModel>[
    PaymentMethodModel(
      method: 'Khqr',
      imageUrl:
          'https://bredcambodia.com.kh/wp-content/uploads/2022/12/KHQR-available-here-logo-with-bg-1024x422.png',
    ),
    PaymentMethodModel(
      method: 'Cash on Delivery',
      imageUrl: 'https://cdn-icons-png.freepik.com/512/9198/9198191.png',
    ),
  ];

  void selectMethod(int index) {
    selectedIndex.value = index;
  }

  void makePayment() {
    paymentMethod.value = selectedIndex.value == 0
        ? 'Khqr'
        : 'Cash on Delivery';
    if (paymentMethod.value != 'Khqr') {
      Get.toNamed(AppRoutes.completedOrder);
      for (var item in cartController.cartList) {
        orderList.add(
          CheckoutModel(
            name: item.name,
            price: item.price,
            quantity: item.quantity,
            images: item.images,
            selectedSize: item.selectedSize,
            selectedColor: item.selectedColor,
            status: 'Pending',
          ),
        );
      }
      cartController.cartList.clear();
      cartController.totalPrice.value = 0.0;
      cartController.selectedItems.clear();
      cartController.selectedItems.refresh();
      cartController.subTotal.value = 0.0;
      Get.snackbar('Success', 'Your order has been confirmed!');
      Get.toNamed(AppRoutes.completedOrder);
    } else {
      Get.toNamed(AppRoutes.khqr);
    }
  }
}
