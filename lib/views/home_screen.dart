import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeController homeController = Get.find<HomeController>();

    final List<String> categories = [
      "All",
      "Mens",
      "Kits",
      "Tshirt",
      "Jersey",
      "Shoes",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            spacing: 16,
            children: [
              // Hero Section
              Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://store.fcbarcelona.com/cdn/shop/files/IMG_6274.jpg?v=1737554507&width=1200",
                    width: double.infinity,
                    height: size.height * 0.7,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.7,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Text(
                    "Collection \n 1995-97's \n Season Jersey ".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "ProductSans",
                      height: 1.2,
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              // Best sellers
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 16,
                  children: [
                    Center(
                      child: Text(
                        "Best Sellers".toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 16,
                        children: List.generate(
                          homeController.listProductSellers.length,
                          (index) => CustomCardWidget(
                            data: homeController.listProductSellers[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // New Arrival Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Arrival".toUpperCase(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextButton(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Explore More",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward,
                                size: 18,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    // Category Buttons
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: categories.map((category) {
                          final isActive =
                              homeController.selectedCategory.value == category;
                          return GestureDetector(
                            onTap: () => homeController.setCategory(category),
                            child: Column(
                              children: [
                                Text(
                                  category,
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    fontSize: 14,
                                    color: isActive
                                        ? Colors.black
                                        : Colors.grey[500],
                                    fontWeight: isActive
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                if (isActive)
                                  const Icon(
                                    Icons.circle,
                                    size: 6,
                                    color: Colors.brown,
                                  ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // Filtered Products
                    // Filtered Products (show only 4)
                    Obx(
                      () => Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: homeController.filteredProducts
                            .take(4) // 👈 LIMIT to 4 products
                            .map((product) => CustomCardWidget(data: product))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Collection",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Explore More",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://brand.assets.adidas.com/image/upload/f_auto,q_auto:best,fl_lossy/if_w_gt_800,w_800/xcat_fw25_bts_tcc_htt_mw_d_539f2055e6.png",
                    width: double.infinity,
                    height: size.height * 0.3,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.3,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "| Sale up to 40%",
                          style: const TextStyle(
                            fontFamily: "Nunito",
                            height: 1.2,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "BACK TO \n SCHOOL MUST HAVES".toUpperCase(),
                          style: const TextStyle(
                            fontFamily: "ProductSans",
                            height: 1.2,
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
