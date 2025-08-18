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
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[100],
      title: const Text("Payment Methods"),
      actions: [
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.createCreditCard),
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xffFEF7FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: const [
                Icon(HugeIcons.strokeRoundedAdd01, color: Colors.black, size: 18),
                SizedBox(width: 8),
                Text("Add Card"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          SizedBox(height: 8),
          PaymentCardTile(),
          SizedBox(height: 16),
          CashOnDeliveryTile(),
        ],
      ),
    );
  }
}

class PaymentCardTile extends StatelessWidget {
  const PaymentCardTile({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.find();

    return Obx(
      () => Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: HugeIcons.strokeRoundedDelete01,
              label: 'Delete',
              autoClose: true,
            ),
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: HugeIcons.strokeRoundedEdit01,
              label: 'Edit',
              autoClose: true,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => controller.selectMethod('card'),
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Visa Card", style: Theme.of(context).textTheme.titleMedium),
                    Text("0972 1234 2315 4832",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey)),
                    Text("12/25",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey)),
                    Text("Chhin Chhairong",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey)),
                  ],
                ),
                Checkbox(
                  value: controller.selectedMethod.value == 'card',
                  onChanged: (_) => controller.selectMethod('card'),
                  activeColor: Colors.black,
                  shape: const CircleBorder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CashOnDeliveryTile extends StatelessWidget {
  const CashOnDeliveryTile({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.find();

    return Obx(
      () => Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: HugeIcons.strokeRoundedDelete01,
              label: 'Delete',
              autoClose: true,
            ),
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: HugeIcons.strokeRoundedEdit01,
              label: 'Edit',
              autoClose: true,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => controller.selectMethod('cash'),
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Cash Payment at Delivery",
                    style: Theme.of(context).textTheme.titleMedium),
                Checkbox(
                  value: controller.selectedMethod.value == 'cash',
                  onChanged: (_) => controller.selectMethod('cash'),
                  activeColor: Colors.black,
                  shape: const CircleBorder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
