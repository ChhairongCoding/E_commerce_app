import 'package:e_commerce_app/controllers/favorite_controller.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final RxString selectedTab = "all".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text("Favorite"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                List<Product> itemsToShow = favoriteController.favoriteItems;
                if (itemsToShow.isEmpty) {
                  return const Center(child: Text("No favorite products yet."));
                }
                return SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 2,
                    spacing: 2,
                    children: itemsToShow.take(4).map((product) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.458,
                        child: CustomCardWidget(data: product),
                      );
                    }).toList(),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
