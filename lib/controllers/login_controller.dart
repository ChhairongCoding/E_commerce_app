import 'package:e_commerce_app/services/auth_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isObsecure = true.obs;
  final AuthService authService = Get.put(AuthService());

  void toggleOpenObsecure() {
    isObsecure.value = !isObsecure.value;
  }

  void login(String email, String password){
  }
}
