import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KhqrScreen extends StatelessWidget {
  const KhqrScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(title: const Text("KHQR Payment"));

  Widget _buildBody() {
  final CartController cartController = Get.find<CartController>(); 

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Scan to Pay",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Use your ABA or other KHQR-supported banking app to scan.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // 💰 Amount Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Amount: \$${cartController.subTotal}", 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 30),

          // QR Image
          Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                "assets/images/khqr/chhinchhairong_khqr.jpg",
                width: 250,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 30),
          const Text(
            "After payment, please screenshot and send to us for confirmation.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
