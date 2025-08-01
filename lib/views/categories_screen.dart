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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Text('Categories'), 

            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(
                70,
              ), // set height to fit your search widget
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: SearchWidget(text: "Search Categories"),
              ),
            ),
          ),

          // Grid of categories with 2 items per row
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 4, // Adjust to your card's aspect ratio
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                final category = shopController.listCate[index];
                final title = category['name'];
                final image = category['imageUrl'];

                return CustomCategoryCardWidget(
                  title: title,
                  imageUrl: image,
                  subtitle: "323 Product", // Replace with actual value
                  onTap: () {},
                );
              }, childCount: shopController.listCate.length),
            ),
          ),
        ],
      ),
    );
  }
}
