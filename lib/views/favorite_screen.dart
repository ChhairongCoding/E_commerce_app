import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/favorite_controller.dart';
import 'package:e_commerce_app/models/product_model.dart';
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
            // Tabs
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffFEF7FF),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => selectedTab.value = "all",
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          color: selectedTab.value == "all"
                              ? Colors.black
                              : Colors.transparent,
                          child: Center(
                            child: Text(
                              "All Items",
                              style: TextStyle(
                                color: selectedTab.value == "all"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => selectedTab.value = "board",
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          color: selectedTab.value == "board"
                              ? Colors.black
                              : Colors.transparent,
                          child: Center(
                            child: Text(
                              "Boards",
                              style: TextStyle(
                                color: selectedTab.value == "board"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Obx(() {
                List<Product> itemsToShow = favoriteController.favoriteItems;

                if (itemsToShow.isEmpty) {
                  return const Center(child: Text("No favorite products yet."));
                }

                return SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.start, 
                    runSpacing: 16.0,
                    spacing: 12,
                    children: itemsToShow
                        .map((product) => FavoriteProductCard(product: product))
                        .toList(),
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

class FavoriteProductCard extends StatelessWidget {
  final Product product;
  const FavoriteProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final String imageUrl = product.images.isNotEmpty
        ? product.images.first
        : 'https://via.placeholder.com/150';

    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width * 0.44,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {
                    FavoriteController.to.toggleFavorite(product);
                  },
                  icon: Obx(() {
                    bool isFav = FavoriteController.to.isFavorite(product);
                    return Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: Colors.pink,
                      size: 24,
                    );
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "\$${product.price.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: index < (double.tryParse(product.rate ?? "0") ?? 0)
                        ? Colors.amber
                        : Colors.grey.shade300,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                "(${product.reviews?.length ?? 0})",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
