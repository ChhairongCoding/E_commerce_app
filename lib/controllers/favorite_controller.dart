import 'package:get/get.dart';
import '../models/product_model.dart';

class FavoriteController extends GetxController {
  static FavoriteController get to => Get.find(); // singleton

  RxList<Product> favoriteItems = <Product>[].obs;

  void toggleFavorite(Product product) {
    if (favoriteItems.any((p) => p.id == product.id)) {
      favoriteItems.removeWhere((p) => p.id == product.id);
    } else {
      favoriteItems.add(product);
    }
  }

  bool isFavorite(Product product) {
    return favoriteItems.any((p) => p.id == product.id);
  }
}
