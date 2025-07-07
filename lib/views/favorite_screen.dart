// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:hugeicons/hugeicons.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController =
        Get.find<FavoriteController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(
                leading: Icon(HugeIcons.strokeRoundedSearch02),
                hintText: "Search",
              ),
              SizedBox(height: 20),
              Column(
                spacing: 16,
                children: List.generate(favoriteController.listFav.length, (
                  index,
                ) {
                  return favoriteCard(favoriteController.listFav[index]);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget favoriteCard(final Map<String, dynamic> data) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: data['image'],
            width: 100,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        data['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => FavoriteController().addToCart(data),

                      label: Icon(Icons.add),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("(" + data['selled'] + ")"),
                        SizedBox(width: 4),
                        Text("(" + data['rate'] + ")"),
                        SizedBox(width: 4),
                        Icon(Icons.favorite, size: 16, color: Colors.red),
                      ],
                    ),
                    Text(
                      "\$" + data['price'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
