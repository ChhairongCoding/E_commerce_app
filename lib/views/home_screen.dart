import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/widgets/custom_card_widget.dart';
import 'package:e_commerce_app/widgets/custom_product_card_with_rating.dart';
import 'package:e_commerce_app/widgets/custom_promotion_card.dart';
import 'package:e_commerce_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  RxInt setectedCateIndex = 1.obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome,",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Our Fashions App,",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.grey[700]),
                  ),
                ],
              ),

              SearchCustom(),

              CategoriesSection(setectedCateIndex: setectedCateIndex),

              PromotionSection(),

              NewArriveSection(),

              Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      GestureDetector(
                        child: Text(
                          "View All",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: List.generate(3, (index) {
                      return Column(
                        children: [
                          CustomProductCardWithRating(size: size),
                          if (index < 2)
                            SizedBox(
                              height: 16,
                            ), 
                        ],
                      );
                    }),
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

class NewArriveSection extends StatelessWidget {
  NewArriveSection({super.key});
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("New Arrivals", style: Theme.of(context).textTheme.titleLarge),
            GestureDetector(
              child: Text(
                "View All",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: homeController.listProduct
              .take(4)
              .map((product) => CustomCardWidget(data: product))
              .toList(),
        ),
      ],
    );
  }
}

class PromotionSection extends StatelessWidget {
  const PromotionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Promotion", style: Theme.of(context).textTheme.titleLarge),
          Row(
            spacing: 16,
            children: [
              CustomPromotionCard(
                title: "50% Off",
                title2: "On everything today",
                code: "FSCREATION",
                imageUrl:
                    "https://soccerpost.com/cdn/shop/files/AURORA_DX2614-101_PHSFM001-2000_clipped_rev_1.png?v=1695216765&width=1440",
              ),
              CustomPromotionCard(
                title: "70% Off",
                title2: "On everything today",
                code: "FSCREATION",
                imageUrl:
                    "https://static.nike.com/a/images/t_default/9b178226-99d4-4f77-8f00-ba2f5caa2325/zoom-mercurial-superfly-9-elite-km-fg-high-top-football-boot-RbvQKW.png",
              ),
              CustomPromotionCard(
                title: "50% Off",
                title2: "On everything today",
                code: "FSCREATION",
                imageUrl:
                    "https://soccerpost.com/cdn/shop/files/AURORA_DX2614-101_PHSFM001-2000_clipped_rev_1.png?v=1695216765&width=1440",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchCustom extends StatelessWidget {
  const SearchCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 9,
          child: SearchWidget(
            text: "Search in Store...",
            icon: HugeIcons.strokeRoundedSearch01,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(
              HugeIcons.strokeRoundedFilterHorizontal,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class CategoriesSection extends StatelessWidget {
  CategoriesSection({super.key, required this.setectedCateIndex});

  final RxInt setectedCateIndex;
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Categories", style: Theme.of(context).textTheme.titleLarge),
            GestureDetector(
              child: Text(
                "View All",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
              ),
            ),
          ],
        ),
        Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 16,
              children: [
                GestureDetector(
                  onTap: () {
                    setectedCateIndex.value = 1;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                      color: setectedCateIndex.value == 1
                          ? Colors.black
                          : Colors.transparent,
                    ),
                    child: Text(
                      "Jersey",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: setectedCateIndex.value == 1
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setectedCateIndex.value = 2;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                      color: setectedCateIndex.value == 2
                          ? Colors.black
                          : Colors.transparent,
                    ),
                    child: Text(
                      "Boost",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: setectedCateIndex.value == 2
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setectedCateIndex.value = 3;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                      color: setectedCateIndex.value == 3
                          ? Colors.black
                          : Colors.transparent,
                    ),
                    child: Text(
                      "Collection",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: setectedCateIndex.value == 3
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setectedCateIndex.value = 4;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                      color: setectedCateIndex.value == 4
                          ? Colors.black
                          : Colors.transparent,
                    ),
                    child: Text(
                      "Accessories",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: setectedCateIndex.value == 4
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: homeController.listProduct
              .take(4)
              .map((product) => CustomCardWidget(data: product))
              .toList(),
        ),
      ],
    );
  }
}
