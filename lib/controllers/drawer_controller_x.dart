import 'package:e_commerce_app/views/main_views/main_controller.dart';
import 'package:get/get.dart';

class DrawerControllerX extends GetxController {
  RxInt selectedIndex = 0.obs;
  final isDarkMode = false.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
    Get.find<MainController>().currentIndex.value = selectedIndex.value ; 
    

  }
  
    void toggleDarkMode() {
      isDarkMode.value = !isDarkMode.value;
    }
}
