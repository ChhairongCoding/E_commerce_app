
import 'package:e_commerce_app/controllers/payment_controller.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class PaymentCardScreen extends StatelessWidget {
 const PaymentCardScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xffFEF7FF),
                borderRadius: BorderRadius.zero,
              ),
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.createCreditCard),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      HugeIcons.strokeRoundedAdd01,
                      color: Colors.black,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Add Card",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 16,
    children: [
      Text("Credit Card", style: Theme.of(context).textTheme.titleLarge),
      CreditCardCustom(),
      SizedBox(height: 16),
      Text("Cash on Delivery", style: Theme.of(context).textTheme.titleLarge),
      CashOnDeliveryTile(),
    ],
  ),
),

    );
  }
}

class CreditCardCustom extends StatelessWidget {
  const CreditCardCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.find();

    return Obx(() => Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Delete action
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: HugeIcons.strokeRoundedDelete01,
            label: 'Delete',
            autoClose: true,
          ),
          SlidableAction(
            onPressed: (context) {
              // Edit action
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: HugeIcons.strokeRoundedEdit01,
            label: 'Edit',
            autoClose: true,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          controller.selectMethod('card');
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Visa Card", style: Theme.of(context).textTheme.titleMedium),
                  Text("0972 1234 2315 4832", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                  Text("12/25", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                  Text("Chhin Chhairong", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                ],
              ),
              Checkbox(
                value: controller.selectedMethod.value == 'card',
                onChanged: (_) {
                  controller.selectMethod('card');
                },
                activeColor: Colors.black,
                shape: CircleBorder(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}


class CashOnDeliveryTile extends StatelessWidget {
  const CashOnDeliveryTile({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.find();

    return Obx(() => Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Delete action
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: HugeIcons.strokeRoundedDelete01,
            label: 'Delete',
            autoClose: true,
          ),
          SlidableAction(
            onPressed: (context) {
              // Edit action
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: HugeIcons.strokeRoundedEdit01,
            label: 'Edit',
            autoClose: true,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          controller.selectMethod('cash');
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cash Payment at Delivery",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Checkbox(
                value: controller.selectedMethod.value == 'cash',
                onChanged: (_) {
                  controller.selectMethod('cash');
                },
                activeColor: Colors.black,
                shape: CircleBorder(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
