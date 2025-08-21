import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardMyOrderWidget extends StatelessWidget {
  const CustomCardMyOrderWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  final CheckoutController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final order = controller.orderList[index];

      String imageUrl = "";
      if (order.images is List && order.images.isNotEmpty) {
        imageUrl = order.images[0].toString();
      } else if (order.images is String) {
        imageUrl = order.images;
      }

      return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color(0xffFEF7FF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey, width: 0.4),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: imageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      imageUrl: imageUrl,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.broken_image, size: 50),
                    )
                  : const Icon(Icons.image_not_supported, size: 50),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.name,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text("Quantity: ${order.quantity}"),
                  if (order.selectedSize != null)
                    Text("Size: ${order.selectedSize}"),
                  if (order.selectedColor != null)
                    Row(
                      children: [
                        const Text("Color: "),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: order.selectedColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 4),
                  
                ],
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Status: ${order.status}", 
                      style: TextStyle(
                        color: order.status == "Pending"
                            ? Colors.orange
                            : order.status == "Delivered"
                                ? Colors.green
                                : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    "\$${order.price}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
