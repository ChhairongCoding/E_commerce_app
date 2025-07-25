import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCardMyOrderWidget extends StatelessWidget {
  const CustomCardMyOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFEF7FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 0.4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: CachedNetworkImage(
                  width: 120,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://www.thesportstuff.in/cdn/shop/files/Optimized-GreyBlackFront.jpg?v=1696607763",
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Text label this",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "Text label thi dks sdfdsa",
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "Quantity: 1",
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "Size: 42",
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "Color: ",
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                        ],
                      ),

                      Text(
                        "\$120",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
