import 'package:get/get.dart';

class LoginController extends GetxController {
  var isObsecure = true.obs;

  void toggleOpenObsecure() {
    isObsecure.value = !isObsecure.value;
  }
}
