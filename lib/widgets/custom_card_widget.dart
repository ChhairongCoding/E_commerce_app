import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/favorite_controller.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomCardWidget extends StatelessWidget {
  final Product data;

  const CustomCardWidget({super.key, required this.data});

  String getImageUrl(List<String> images) {
    if (images.isNotEmpty) {
      return images.first;
    } else {
      return 'https://via.placeholder.com/150';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeController homeController = Get.find<HomeController>();
    final FavoriteController favoriteController =
        FavoriteController.to; 

    final String imageUrl = getImageUrl(data.images);
    final String name = data.name;
    final String price = data.price.toStringAsFixed(2);

    return Container(
      width: size.width * 0.45,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: GestureDetector(
        onTap: () {
          homeController.tempProduct(data);

        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image & Favorite
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    height: size.height * 0.20,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, error, stackTrace) => Container(
                      height: size.height * 0.20,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image, size: 40),
                    ),
                  ),
                ),

                // Favorite Button
                Positioned(
                  right: 12,
                  top: 12,
                  child: Obx(() {
                    final isFav = favoriteController.isFavorite(data);
                    return InkWell(
                      onTap: () => favoriteController.toggleFavorite(data),
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          size: 18,
                          color: isFav ? Colors.red : Colors.grey,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),

            // Product Info
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$$price",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      IconButton(
                        style: ButtonStyle(
                          visualDensity: VisualDensity.compact,
                          padding: WidgetStatePropertyAll(
                            const EdgeInsets.all(6),
                          ),
                          foregroundColor: WidgetStatePropertyAll(Colors.black),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                          overlayColor: WidgetStatePropertyAll(
                            Colors.grey.shade200,
                          ),
                        ),
                        onPressed: () {
                          homeController.tempProduct(data);
                        },
                        icon: const Icon(
                          HugeIcons.strokeRoundedAdd01,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
