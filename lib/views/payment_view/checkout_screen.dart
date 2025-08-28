import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/checkout_controller.dart';
import 'package:e_commerce_app/widgets/custom_address_widget.dart';
import 'package:e_commerce_app/widgets/custom_order_summary_widget.dart';
import 'package:e_commerce_app/widgets/custom_payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});
  final CartController cartController = Get.find<CartController>();
  final RxInt selectedIndex = 0.obs;
  final RxInt selectedCardIndex = 0.obs;

  String getImageUrl(dynamic images) {
    if (images is List && images.isNotEmpty) {
      return images.first;
    } else if (images is String) {
      return images;
    } else {
      return 'https://via.placeholder.com/150';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.grey[100],
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  _buildAppBar(context) {
    return AppBar(
      backgroundColor: Colors.grey[100],
      title: const Text("Checkout"),
    );
  }

  Widget _buildBody(context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Cart",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...cartController.cartList.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: getImageUrl(item.images),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (item.selectedColor != null)
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: item.selectedColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              )
                            else
                              const Text("No color"),
                            const SizedBox(width: 12),
                            Text(
                              item.selectedSize != null
                                  ? "Size: ${item.selectedSize}"
                                  : "No size",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${item.price}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "Qty: ${item.quantity}",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          const CustomAddressWidget(),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          const CustomOrderSummaryWidget(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(context) {
    final CheckoutController checkoutController = Get.find<CheckoutController>();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 55),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {
          checkoutController.selectPaymentMethod();
        },
        child: Text(
          "Confirm Order",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
