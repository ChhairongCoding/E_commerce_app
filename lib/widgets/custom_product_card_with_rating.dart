import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomProductCardWithRating extends StatelessWidget {
  const CustomProductCardWithRating({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
          width: size.width,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(
                          16,
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048",
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Column(
                        spacing: 2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tshirt retro style",
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium,
                          ),
                          SizedBox(
                            width: 180,
                            child: Text(
                              "This is a local brand, created for barcelona fan.",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey[700],
                                  ),
                              maxLines: 1,
                            ),
                          ),
                          Row(
                            spacing: 6,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text("(4.5)"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text("\$72.00",style: Theme.of(context).textTheme.titleMedium,),
                  ),
                ],
              ),
            ],
          ),
        );
  }
}


