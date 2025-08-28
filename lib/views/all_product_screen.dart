import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/custom_card_widget.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({
    super.key,
    required this.products,
    required this.title,
  });

  final List<Product> products;
  final String title;

  @override
  Widget build(BuildContext context) {
    // Filter products based on status
    List<Product> filteredProducts;
    if (title.toLowerCase() == "all") {
      filteredProducts = products;
    } else {
      filteredProducts = products
          .where(
            (product) =>
                product.status != null &&
                product.status!.toLowerCase() == title.toLowerCase(),
          )
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: filteredProducts.isEmpty
          ? const Center(child: Text("No products available"))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: filteredProducts.map((product) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: CustomCardWidget(data: product),
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }
}
