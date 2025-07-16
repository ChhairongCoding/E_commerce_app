import 'package:flutter/material.dart';
import 'package:get/get.dart';


void ShippingBottomSheet(BuildContext context) {
  Get.bottomSheet(
    isDismissible: false,
    enableDrag: true,
    isScrollControlled: true,
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white
      ),
       width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.85,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shipping Address",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),)
          ],
        ),
      ),
    )
  );
}