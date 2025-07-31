import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/widgets/custom_card_widget.dart';
import 'package:e_commerce_app/widgets/custom_product_card_with_rating.dart';
import 'package:e_commerce_app/widgets/custom_promotion_card.dart';
import 'package:e_commerce_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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

             SearchCustom(homeController: homeController),

              CategoriesSection(
                setectedCateIndex: homeController.setectedCateIndex,
              ),

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
                          if (index < 2) SizedBox(height: 16),
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
  PromotionSection({super.key});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Promotion", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: PageView.builder(
              controller: controller.promoPageController,
              itemCount: controller.promotions.length,
              onPageChanged: controller.onPromoPageChanged,
              itemBuilder: (context, index) {
                final promo = controller.promotions[index];
                return CustomPromotionCard(
                  title: promo['title']!,
                  title2: promo['title2']!,
                  code: promo['code']!,
                  imageUrl: promo['imageUrl']!,
                );
              },
            ),
          ),

          const SizedBox(height: 12),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(controller.promotions.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentPromoPage.value == index ? 12 : 8,
                  height: controller.currentPromoPage.value == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: controller.currentPromoPage.value == index
                        ? Colors.black
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}

class SearchCustom extends StatelessWidget {
  const SearchCustom({super.key, required this.homeController});
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 9, child: SearchWidget(text: "Search in Store...")),
        Flexible(
          flex: 2,
          child: GestureDetector(
            onTap:
                homeController.onFilter, // ✅ Call the method to toggle filter
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
              onTap: () {
                Get.toNamed(AppRoutes.category);
              },
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
