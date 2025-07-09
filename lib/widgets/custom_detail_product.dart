import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomDetailProduct extends StatelessWidget {
  CustomDetailProduct({super.key});

  final List<String> sizes = ['S', 'M', 'L', 'XL'];
  final RxInt selectedSize = 0.obs;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actionsPadding: EdgeInsets.all(16),
        actions: const [
          Icon(HugeIcons.strokeRoundedFavourite),
          SizedBox(width: 16,),
          Icon(HugeIcons.strokeRoundedUpload01),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: homeController.listDetail['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 500,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: homeController.listDetail['image'],
                                width: 100,
                              ),
                              const SizedBox(width: 16),
                              CachedNetworkImage(
                                imageUrl: homeController.listDetail['image'],
                                width: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Product Details
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        homeController.listDetail["name"],
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            homeController.listDetail["price"],
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: Colors.deepOrange),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.star_border_outlined),
                              Text("4.5"),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Color & Size Labels
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Text("Color"), Text("Size")],
                      ),
                      const SizedBox(height: 10),

                      // Color Options
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(3, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey),
                                  ),
                                ),
                              );
                            }),
                          ),
                          Obx(
                            () => Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(
                                sizes.length,
                                (index) => Material(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(3),
                                    onTap: () => selectedSize.value = index,
                                    child: Ink(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: selectedSize.value == index
                                            ? const Color(0xFF667EEA)
                                            : const Color(0xFFF3F3F3),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          sizes[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color:
                                                    selectedSize.value == index
                                                    ? Colors.white
                                                    : Colors.black87,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Description"),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Description"),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      size: 26,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Add To Cart",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
