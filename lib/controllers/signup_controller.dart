import 'package:get/get.dart';

class SignupController extends GetxController {
  var isObsecure = true.obs;
  var isObsecurePw= true.obs;

  void toggleOpenObsecure() {
    isObsecure.value = !isObsecure.value;
  }
  void toggleOpenObsecurePw(){
    isObsecurePw.value = !isObsecurePw.value;
  }
}