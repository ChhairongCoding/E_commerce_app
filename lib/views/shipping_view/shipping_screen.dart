import 'package:e_commerce_app/controllers/shipping_controller.dart';
import 'package:e_commerce_app/views/shipping_view/new_shipping_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShippingController controller = Get.put(ShippingController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text("Shipping"),
        actions: [
          TextButton(
            onPressed: () => newShippingBottomSheet(context, controller),
            child: Text(
              "+ New Shipping",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.shippingList.isEmpty) {
            return const Center(child: Text("No shipping address yet"));
          }

          return ListView.builder(
            itemCount: controller.shippingList.length,
            itemBuilder: (context, index) {
              final shipping = controller.shippingList[index];
              return _shippingCard(shipping, controller, index);
            },
          );
        }),
      ),
    );
  }

  Widget _shippingCard(ShippingAddress shipping, ShippingController controller, int index) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 6,
          spreadRadius: 2,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${shipping.city}, ${shipping.zip}",
                      style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 5),
                  Text(
                    shipping.address,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                controller.nameController.text = shipping.name;
                controller.phoneController.text = shipping.phone;
                controller.addressController.text = shipping.address;
                controller.cityController.text = shipping.city;
                controller.zipController.text = shipping.zip;

                newShippingBottomSheet(Get.context!, controller, editIndex: index);
              },
              icon: const Icon(HugeIcons.strokeRoundedEdit01),
            ),
            IconButton(
              onPressed: () => controller.deleteShipping(index),
              icon: const Icon(HugeIcons.strokeRoundedDelete01, color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text("${shipping.name}   ${shipping.phone}",
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(width: 16),
            if (shipping.isDefault)
              const Text(
                "Default",
                style: TextStyle(color: Colors.blue),
              ),
            if (!shipping.isDefault)
              TextButton(
                onPressed: () => controller.setDefaultShipping(index),
                child: const Text("Set Default"),
              ),
          ],
        ),
      ],
    ),
  );
}

}
