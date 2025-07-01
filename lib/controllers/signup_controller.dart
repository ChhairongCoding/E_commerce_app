import 'package:e_commerce_app/services/auth_service.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isObsecure = true.obs;
  var isObsecurePw = true.obs;
  RxBool isLoading = false.obs;

  // service
  final AuthService authService = Get.put(AuthService());

  void toggleOpenObsecure() {
    isObsecure.value = !isObsecure.value;
  }

  void toggleOpenObsecurePw() {
    isObsecurePw.value = !isObsecurePw.value;
  }

  void signup(String username, email, password) {
    isLoading(true);
    authService.signup(username, email, password);
    isLoading(false);
  }
}
