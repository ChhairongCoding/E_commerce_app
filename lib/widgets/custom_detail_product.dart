import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/favorite_controller.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/controllers/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:e_commerce_app/models/cart_model.dart';

class CustomDetailProduct extends StatefulWidget {
  const CustomDetailProduct({super.key});

  @override
  State<CustomDetailProduct> createState() => _CustomDetailProductState();
}

class _CustomDetailProductState extends State<CustomDetailProduct> {
  final ProductDetailController productDetailController =
      Get.find<ProductDetailController>();

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      body: Stack(
        children: [
          _buildBody(context, homeController),
          _buildButtonAddToCart(homeController, cartController, context),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar(
    FavoriteController favoriteController,
    HomeController homeController,
  ) {
    return SliverAppBar(
      backgroundColor: Colors.orange,
      actions: [
        Obx(() {
          final product = homeController.tempSelectedProduct.value;
          final isFav =
              product != null && favoriteController.isFavorite(product);
          return IconButton(
            onPressed: () {
              if (product != null) {
                favoriteController.toggleFavorite(product);
              }
            },
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : Colors.white,
            ),
          );
        }),
        IconButton(
          onPressed: () {},
          icon: const Icon(HugeIcons.strokeRoundedShare01, color: Colors.white),
        ),
        const SizedBox(width: 16),
      ],
      leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back, color: Colors.white)),
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: ProductImageCarousel(
          key: ValueKey(
            homeController.tempSelectedProduct.value?.id ?? UniqueKey(),
          ),
          images: homeController.tempSelectedProduct.value?.images ?? [],
        ),
      ),
    );
  }

  _buildBody(BuildContext context, HomeController homeController) {
    final FavoriteController favoriteController =
        Get.find<FavoriteController>();

    return CustomScrollView(
      slivers: [
        _buildAppBar(favoriteController, homeController),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homeController.tempSelectedProduct.value?.name ?? "No Name",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${(homeController.tempSelectedProduct.value?.price ?? 0.0).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.deepOrange,
                      ),
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

                // Size Selection
                Text("Size"),
                const SizedBox(height: 8),
                Obx(() {
                  final sizes =
                      homeController.tempSelectedProduct.value?.sizes ?? [];
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      sizes.length,
                      (index) => Material(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(3),
                          onTap: () =>
                              productDetailController.selectedSize.value =
                                  index,
                          child: Ink(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color:
                                  productDetailController.selectedSize.value ==
                                      index
                                  ? const Color(0xFF667EEA)
                                  : const Color(0xFFF3F3F3),
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                sizes[index],
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color:
                                          productDetailController
                                                  .selectedSize
                                                  .value ==
                                              index
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 16),

                // Color Selection
                Text("Color"),
                const SizedBox(height: 8),
                Obx(() {
                  final product = homeController.tempSelectedProduct.value;
                  final colors = product?.color ?? [];
                  if (colors.isEmpty) return const Text("No colors available");

                  return Row(
                    children: List.generate(colors.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            productDetailController.selectedColor.value = index;
                          },
                          child: Obx(
                            () => Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: colors[index],
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      productDetailController
                                              .selectedColor
                                              .value ==
                                          index
                                      ? Colors.black
                                      : Colors.grey,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }),

                const SizedBox(height: 20),
                const Divider(),

                // Description
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    (homeController
                                .tempSelectedProduct
                                .value
                                ?.description
                                ?.isNotEmpty ??
                            false)
                        ? homeController.tempSelectedProduct.value!.description!
                        : "No Description",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Divider(),

                // Reviews
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Review",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "All comments(200+)",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.grey),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: List.generate(
                    (homeController
                                .tempSelectedProduct
                                .value
                                ?.reviews
                                ?.length ??
                            0)
                        .clamp(0, 2),
                    (index) => reviewerCard(context, homeController, index),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Positioned _buildButtonAddToCart(
    HomeController homeController,
    CartController cartController,
    BuildContext context,
  ) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minimumSize: const Size(double.infinity, 60),
          ),
          onPressed: () {
            final product = homeController.tempSelectedProduct.value;
            if (product != null) {
              final selectedSize = product.sizes.isNotEmpty
                  ? product.sizes[productDetailController.selectedSize.value]
                  : null;
              final selectedColor = product.color.isNotEmpty
                  ? product.color[productDetailController.selectedColor.value]
                  : null;

              cartController.addToCart(
                CartModel(
                  name: product.name,
                  price: product.price,
                  quantity: 1,
                  images: product.images,
                  selectedSize: selectedSize,
                  selectedColor: selectedColor,
                ),
              );
            }
          },
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
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container reviewerCard(
    BuildContext context,
    HomeController homeController,
    int index,
  ) {
    final review = homeController.tempSelectedProduct.value?.reviews?[index];
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: 8),
              Text(
                review?.userName ?? "Reviewer Name",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            review?.comment ?? "Review contents",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key, required this.images});
  final List<String> images;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  late final PageController _pageController; // new controller per instance
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.images.length,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemBuilder: (context, index) => CachedNetworkImage(
            imageUrl: widget.images[index],
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentPage == index ? 12 : 8,
                height: currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: currentPage == index ? Colors.white : Colors.white54,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
