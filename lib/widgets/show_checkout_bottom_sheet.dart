import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCheckoutBottomSheet(BuildContext context, CartController controller) {
  String getImageUrl(dynamic images) {
    if (images is List && images.isNotEmpty) {
      return images.first;
    } else if (images is String) {
      return images;
    } else {
      return 'https://via.placeholder.com/150';
    }
  }

  Get.bottomSheet(
    Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 16,
        children: [
          Column(
            spacing: 16,
            children: [
              Center(
                child: Text(
                  "Detail Products",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.cartList
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: getImageUrl(item.images),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products Total",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Color(0xff8A8A8F)),
                  ),
                  Text(
                    "\$${controller.totalPrice.toStringAsFixed(2)}",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 18),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Items ",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Color(0xff8A8A8F)),
                  ),
                  Text(
                    "X${controller.cartList.length}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping ",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Color(0xff8A8A8F)),
                  ),
                  Text(
                    "\$${controller.shippingPrice}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount ",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Color(0xff8A8A8F)),
                  ),
                  Text(
                    "0%",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "\$${controller.subTotal.toStringAsFixed(2)}",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () => Get.toNamed(AppRoutes.checkout),
              child: Text(
                "Proceed to Checkout",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
    isDismissible: false,
    enableDrag: true,
    isScrollControlled: true,
  );
}
