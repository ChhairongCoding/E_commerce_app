import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPaymentWidget extends StatelessWidget {
  const CustomPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.find<PaymentController>();
    final CartController cartController = Get.find<CartController>();

    return Container(
      padding: const EdgeInsets.all(16),
      height: 600,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Method",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Column(
                  children: List.generate(
                    paymentController.paymentList.length,
                    (index) => _buildPaymentMethod(
                      context,
                      title: paymentController.paymentList[index].method,
                      imageUrl: paymentController.paymentList[index].imageUrl,
                      isSelected:
                          paymentController.selectedIndex.value == index,
                      onChanged: (value) {
                        paymentController.selectMethod(index);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              //  SizedBox(width: 16,),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      Text(
                        "Pay Now",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Obx(
                        () => Text(
                          "\$${cartController.subTotal.value}",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => paymentController.makePayment(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(
    BuildContext context, {
    required String title,
    required String imageUrl,
    required bool isSelected,
    required Function(bool?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey,
          width: 0.8,
        ),
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
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: 30,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Spacer(),
          Checkbox(
            shape: const CircleBorder(),
            value: isSelected,
            checkColor: Colors.white,
            onChanged: onChanged,
            activeColor: Colors.black,
            side: const BorderSide(color: Colors.black),
            visualDensity: VisualDensity.compact,
            fillColor: isSelected
                ? WidgetStateProperty.all(Colors.black)
                : WidgetStateProperty.all(Colors.white),
          ),
        ],
      ),
    );
  }
}
