import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/favorite_controller.dart';
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
    final FavoriteController favoriteController =
        Get.find<FavoriteController>();
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.amber,
            actions: [
              Obx(
                () => IconButton(
                  onPressed: () => favoriteController.addFav(),
                  icon: favoriteController.addFavorite.value
                      ? const Icon(HugeIcons.strokeRoundedFavourite)
                      : const Icon(Icons.favorite, color: Colors.red),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(HugeIcons.strokeRoundedShare01),
              ),
              const SizedBox(width: 16),
            ],
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ProductImageCarousel(
                images: List<String>.from(homeController.listDetail['images']),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
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

                  Text("Color"),

                  const SizedBox(height: 8),

                  // Color Options and Sizes
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

                  SizedBox(height: 16),
                  Text("Size"),
                  SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                            color: selectedSize.value == index
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
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Description"),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Review"),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  const SizedBox(height: 100),


                  
                  Container(
                    color: Colors.white,
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
                        cartController.addToCart(
                          Map<String, dynamic>.from(homeController.listDetail),
                        );
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
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImageCarousel extends StatefulWidget {
  final List<String> images;
  const ProductImageCarousel({Key? key, required this.images})
    : super(key: key);

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
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
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: widget.images[index],
              fit: BoxFit.cover,
              width: double.infinity,
            );
          },
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
