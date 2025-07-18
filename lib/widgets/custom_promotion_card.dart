import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPromotionCard extends StatelessWidget {
  const CustomPromotionCard({
    super.key,
    required this.title,
    required this.title2,
    required this.code,
    required this.imageUrl,
  });

  final String title, title2, code, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.grey[300],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            right: -90,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: SizedBox(
                width: 250,
                height: 250,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
          // Text and button overlay
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                Text(title2, style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: 10),
                Text(
                  "With code: $code",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(110, 25),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Get Now",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "ProductSans",
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
