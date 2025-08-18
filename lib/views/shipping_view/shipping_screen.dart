import 'package:e_commerce_app/views/shipping_view/new_shipping_bottom_sheet.dart';
import 'package:e_commerce_app/views/shipping_view/shipping_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text("Shipping"),
        actions: [
          TextButton(
            onPressed: () => newShippingBottomSheet(context),
            child: Text(
              "+ New Shipping",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _shippingCard(context),
          // You can repeat _shippingCard(context) for multiple entries
        ],
      ),
    );
  }

  Widget _shippingCard(BuildContext context) {
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
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shihan Town, Nanhai District",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "No. 31, Tiekeng Industrial Zone, Guihe Road, Jitu International",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: IconButton(
                  onPressed: () => shippingBottomSheet(context),
                  icon: const Icon(HugeIcons.strokeRoundedEdit01),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                "Rong02832   0917384893",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
              ),
              const SizedBox(width: 16),
              Text(
                "Default",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
