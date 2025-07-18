import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ShippingBottomSheet extends StatelessWidget {
  const ShippingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shipping")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => shippingBottomSheet(context),
          child: Text("Open Shipping Bottom Sheet"),
        ),
      ),
    );
  }
}

void shippingBottomSheet(BuildContext context) {
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.90,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shipping Address",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            // Add more fields here
          ],
        ),
      ),
    ),
    isDismissible: false,
    enableDrag: true,
    isScrollControlled: true,
  );
}
