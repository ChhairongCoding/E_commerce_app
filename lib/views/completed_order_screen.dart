import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedOrderScreen extends StatelessWidget {
  const CompletedOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text("Completed Order"),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 32),
            Center(
              child: SizedBox(
                width: 220,
                child: Text(
                  "Thank you for your purchase.You can view your order in ‘My Orders’ section.",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only( top: 32, left: 16, right: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text("Go to My Orders", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)),
            onPressed: ()=> Get.toNamed(AppRoutes.myOrder), 
            ),
        )
      ],
    );
  }
}
