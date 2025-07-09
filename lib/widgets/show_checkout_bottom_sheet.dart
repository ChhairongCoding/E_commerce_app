import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCheckoutBottomSheet(BuildContext context) {
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
                child: Text("Detail Products",style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
              ),
              Icon(Icons.image),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Products Total",style: Theme.of(context).textTheme.bodyLarge,), Text("\$231",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Shipping ",style: Theme.of(context).textTheme.bodyLarge,) ,Text("\$21",style: Theme.of(context).textTheme.bodyLarge,)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Discount ",style: Theme.of(context).textTheme.bodyLarge,), Text("15%",style: Theme.of(context).textTheme.bodyLarge,)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Subtotal ",style: Theme.of(context).textTheme.bodyLarge,), Text("\$221",style: Theme.of(context).textTheme.bodyLarge,)],
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: Text("Check-Out"),
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
