import 'package:e_commerce_app/controllers/shipping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingBottomSheet extends StatelessWidget {
  const ShippingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shipping")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => shippingBottomSheet(context),
          child: const Text("Open Shipping Bottom Sheet"),
        ),
      ),
    );
  }
}

void shippingBottomSheet(BuildContext context) {
  final ShippingController controller = Get.find<ShippingController>();

  Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.90,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
        child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter your name" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller.phoneController,
                decoration: const InputDecoration(labelText: "Phone"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter your phone" : null,
              ),
              const Spacer(),
              Obx(() => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.submitShipping(),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Confirm Shipping"),
                  )),
            ],
          ),
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
