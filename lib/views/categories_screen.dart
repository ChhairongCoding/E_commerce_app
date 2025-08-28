import 'package:e_commerce_app/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final HomeController homeController = Get.find<HomeController>();

  final Map<String, IconData> categoryIcons = {
    "All": Icons.all_inclusive_rounded,
    "electronics": Icons.electrical_services_rounded,
    "jewelery": Icons.diamond_rounded,
    "men's clothing": Icons.male_rounded,
    "women's clothing": Icons.female_rounded,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Explore Categories",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black87,
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: homeController.categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1, // Makes the cards square
        ),
        itemBuilder: (context, index) {
          final categoryName = homeController.categories[index];
          return GestureDetector(
            onTap: () {
              homeController.setCategory(categoryName);
              Get.to(
                () => CategoryProductsScreen(category: categoryName),
                transition: Transition.rightToLeftWithFade,
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              shadowColor: Colors.blueAccent.withOpacity(0.2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent.withOpacity(0.8),
                      Colors.lightBlueAccent.withOpacity(0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      categoryIcons[categoryName.toLowerCase()] ??
                          Icons.category_rounded,
                      size: 48,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      categoryName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryProductsScreen extends StatelessWidget {
  final String category;
  final HomeController homeController = Get.find<HomeController>();

  CategoryProductsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = category == "All"
        ? homeController.productList
        : homeController.productList
              .where((p) => p.category == category)
              .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: products.map((product) {
            return SizedBox(
              width: (MediaQuery.of(context).size.width - 48) / 2,
              child: CustomCardWidget(data: product),
            );
          }).toList(),
        ),
      ),
    );
  }
}
