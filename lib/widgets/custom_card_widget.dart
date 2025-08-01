import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const CustomCardWidget({super.key, required this.data});

  String getImageUrl(dynamic images) {
    if (images is List && images.isNotEmpty) {
      return images.first;
    } else if (images is String) {
      return images;
    } else {
      return 'https://via.placeholder.com/150'; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeController homeController = Get.find<HomeController>();

    final String imageUrl = getImageUrl(data['images']);
    final String name = data['name'] ?? 'No Name';
    final String price = data['price'] ?? data['Price'] ?? '€0.00';

    return GestureDetector(
      onTap: () => homeController.tempProduct(data),
      child: SizedBox(
        width: size.width * 0.44,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: size.width * 0.43,
                height: size.height * 0.20,
                fit: BoxFit.cover,
                errorWidget: (context, error, stackTrace) => Container(
                  height: size.height * 0.25,
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image, size: 40),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Product Name
            Text(
              name,
              style: Theme.of(context).textTheme.titleSmall,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 4),

            // Product Price
            Text(
              price,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
