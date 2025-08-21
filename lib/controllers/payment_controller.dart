import 'package:get/get.dart';

class PaymentController extends GetxController {
  RxString selectedMethod = 'card'.obs;
  RxBool isCard = true.obs;

  void selectMethod(String method) {
    selectedMethod.value = method;
    isCard.value = method == 'card';
  }
}
