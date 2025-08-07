import 'package:flutter/material.dart';

class CartModel {
  final String name;
  final double price;
  final int quantity;
  final dynamic images;
  final String? selectedSize;
  final Color? selectedColor;

  CartModel({
    required this.name,
    required this.price,
    required this.quantity,
    this.images,
    this.selectedSize,
    this.selectedColor,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      name: map['name'] ?? '',
      price: double.tryParse(map['price'].toString()) ?? 0.0,
      quantity: map['quantity'] ?? 1,
      images: map['images'],
      selectedSize: map['selectedSize'],
      selectedColor: map['selectedColor'] != null
          ? Color(map['selectedColor'] as int)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'images': images,
      'selectedSize': selectedSize,
      'selectedColor': selectedColor?.value,
    };
  }

  CartModel copyWith({
    String? name,
    double? price,
    int? quantity,
    dynamic images,
    String? selectedSize,
    Color? selectedColor,
  }) {
    return CartModel(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}
