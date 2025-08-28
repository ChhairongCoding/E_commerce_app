import 'package:e_commerce_app/controllers/shipping_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAddressWidget extends StatelessWidget {
  const CustomAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ShippingController shippingController =
        Get.find<ShippingController>();

    return Obx(
      () {
        // Find default shipping address
        final defaultAddress = shippingController.shippingList.isNotEmpty
            ? shippingController.shippingList
                .firstWhere((a) => a.isDefault, orElse: () => shippingController.shippingList.first)
            : null;

        return GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.shipping),
          child: Container(
            padding: const EdgeInsets.all(16),
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
            child: defaultAddress == null
                ? Row(
                    children: [
                      const Text("No shipping address yet"),
                      const Spacer(),
                      TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.shipping),
                        child: Text(
                          "+ New Shipping",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipping Information",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "${defaultAddress.name}, ${defaultAddress.phone}, ${defaultAddress.city}, ${defaultAddress.zip}, ${defaultAddress.address}",
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: [
                              Text(
                                "Change",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(color: Colors.blue),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
