import 'package:get/get.dart';

class DrawerControllerX extends GetxController {
  RxInt selectedIndex = 0.obs;
  final isDarkMode = false.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;

  }
  
    void toggleDarkMode() {
      isDarkMode.value = !isDarkMode.value;
    }
}
