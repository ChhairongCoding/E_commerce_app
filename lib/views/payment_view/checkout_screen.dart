import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/payment_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});
  final RxInt selectedIndex = 0.obs;
  final RxInt selectedCardIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check out")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Product Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                spacing: 16,
                children: List.generate(
                  3,
                  (index) => Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://flatspotrecords.com/cdn/shop/files/ONLYONEMODEJERSEYFRONT2_1800x1800.png?v=1714055319",
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SPEED - ONLY ONE MODE JERSEY – Flatspot Records",
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: Colors.grey[700]),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$60.00",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "x1",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: Colors.grey[700]),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 36),

            // Address
            address(context),

            SizedBox(height: 36, child: Divider()),

            // Payment
            paymentMethod(context),

            SizedBox(height: 36, child: Divider()),

            Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Summary",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text("\$100", style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shipping (Standard 5-8day) ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "\$8.55",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tax", style: Theme.of(context).textTheme.bodyLarge),
                    Text("\$0", style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: Theme.of(context).textTheme.bodyLarge),
                    Text(
                      "\$108.55",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 36),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 20),
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Confirm Order",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column paymentMethod(BuildContext context) {
    final PaymentController paymentController = Get.put(PaymentController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "2. Payment Method",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => SizedBox(
                width: 200,
                child: paymentController.selectedMethod.value != "card"
                    ? Text("Cash on Delivery",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey[700]
                    ),)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chhairong Chhin",
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "Visa Platinum",
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "**** **** **** 5342",
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            "EXP 10/22",
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                        ],
                      ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.paymentCard),
              child: Row(
                children: [
                  Text(
                    "Edit",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.blue),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container address(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.shipping),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "1. Shipping Information",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    "No. 86A, Street 110, Russian Federation Blvd (110), Phnom Penh",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Edit",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: Colors.blue),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
