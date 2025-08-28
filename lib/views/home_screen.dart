import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/controllers/payment_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/views/all_product_screen.dart';
import 'package:e_commerce_app/widgets/custom_card_widget.dart';
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
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey[100],
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final PaymentController paymentController = Get.find<PaymentController>();

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(AppRoutes.myOrder),
              icon: Badge(
                label: Obx(() => Text("${paymentController.orderList.length}")),
                child: Icon(HugeIcons.strokeRoundedShoppingBag02),
              ),
            ),
          ],
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(HugeIcons.strokeRoundedPinLocation03, size: 14),
                  SizedBox(width: 8),
                  Text("Your location", style: TextStyle(fontSize: 12)),
                ],
              ),
              Text(
                "Phnom Penh",
                style: TextStyle(fontSize: 14, fontFamily: "ProductSans"),
              ),
            ],
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
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

                CategoriesSection(),

                PromotionSection(),

                NewArriveSection(),

                Column(
                  spacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending now",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        GestureDetector(
                          child: Text(
                            "View All",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.grey[900]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 180,
                      child: PageView.builder(
                        controller: homeController.trendingPageController,
                        itemCount: homeController.trendings.length,
                        onPageChanged: (index) {
                          homeController.currentTrendingPage.value = index;
                        },
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: homeController.trendings[index].image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 8),
                    // Dots Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        homeController.trendings.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: homeController.currentTrendingPage == index
                              ? 12
                              : 8,
                          height: homeController.currentTrendingPage == index
                              ? 12
                              : 8,
                          decoration: BoxDecoration(
                            color: homeController.currentTrendingPage == index
                                ? Colors.blue
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                PopularProducts(size: size),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PopularProducts extends StatelessWidget {
  PopularProducts({super.key, required this.size});
  final HomeController homeController = Get.find<HomeController>();

  final Size size;

  @override
  Widget build(BuildContext context) {
    final populars = homeController.productList
        .where(
          (product) =>
              product.status != null &&
              product.status!.toLowerCase() == 'popular'.toLowerCase(),
        )
        .toList();

    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular Products",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            GestureDetector(
              onTap: () => Get.to(
                AllProductScreen(
                  products: homeController.productList,
                  title: "Popular",
                ),
              ),
              child: Text(
                "View All",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[900]),
              ),
            ),
          ],
        ),

        Wrap(
          spacing: 2,
          runSpacing: 2,
          children: populars
              .take(4)
              .map(
                (product) => SizedBox(
                  width: MediaQuery.of(context).size.width * 0.458,
                  child: CustomCardWidget(data: product),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class NewArriveSection extends StatelessWidget {
  NewArriveSection({super.key});
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    // Filter products with status "New Arrival"
    final newArrivals = homeController.productList
        .where(
          (product) =>
              product.status != null &&
              product.status!.toLowerCase() == 'new arrival'.toLowerCase(),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("New Arrivals", style: Theme.of(context).textTheme.titleLarge),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => AllProductScreen(
                    title: "New Arrival",
                    products: homeController.productList,
                  ),
                );
              },
              child: Text(
                "View All",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[900]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 2,
          runSpacing: 2,
          children: newArrivals.take(4).map((product) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.458,
              child: CustomCardWidget(data: product),
            );
          }).toList(),
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
      ],
    );
  }
}

class CategoriesSection extends StatelessWidget {
  CategoriesSection({super.key});

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
              onTap: () => Get.toNamed(AppRoutes.category),
              child: Text(
                "View All",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[900]),
              ),
            ),
          ],
        ),

        // Category Chips
        Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 12,
              children: homeController.categories.map((cat) {
                final isSelected = homeController.selectedCategory.value == cat;
                return GestureDetector(
                  onTap: () => homeController.setCategory(cat),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                      color: isSelected ? Colors.black : Colors.transparent,
                    ),
                    child: Text(
                      cat,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        // Filtered Products
        Obx(() {
          final products = homeController.filteredProducts.take(4).toList();

          if (products.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("No products found in this category."),
              ),
            );
          }

          return Wrap(
            spacing: 2,
            runSpacing: 2,
            children: products
                .map(
                  (product) => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.458,
                    child: CustomCardWidget(data: product),
                  ),
                )
                .toList(),
          );
        }),
      ],
    );
  }
}
