import 'package:get/get.dart';

class PaymentController extends GetxController {
  RxString selectedMethod = 'card'.obs;

  void selectMethod(String method) {
    selectedMethod.value = method;
  }
}
