import 'package:flutter/material.dart';

class PaymentFormScreen extends StatelessWidget {
  const PaymentFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Payment Card"),),
      body: Padding(padding: EdgeInsetsGeometry.all(16),child: Column(
        children: [
          Center(child: Text("Payment"),)
        ],
      ),),

    );
  }
}