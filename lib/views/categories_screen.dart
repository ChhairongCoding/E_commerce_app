import 'package:e_commerce_app/controllers/shop_controller.dart';
import 'package:e_commerce_app/widgets/custom_category_card_widget.dart';
import 'package:e_commerce_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShopController shopController = Get.find<ShopController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              // search
              SearchWidget(text: "Search Categories"),
              // category
              // Updated Shoe Display Card
              Wrap(
                spacing: 16, 
                runSpacing: 16,
                children: List.generate(shopController.listCate.length, (
                  index,
                ) {
                  final title = shopController.listCate[index]['name'];
                  final image = shopController.listCate[index]['imageUrl'];

                  return CustomCategoryCardWidget(
                    title: title,
                    imageUrl: image,
                    subtitle:
                        "323 Product", // Replace with actual value if available
                    onTap: () {},
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
