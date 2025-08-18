import 'package:e_commerce_app/models/review_model.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String? category;
  final String? description;
  final String? rate;
  final List<String> images;
  final List<String> sizes;   
  final List<Color> color;    
  final List<Review>? reviews;

  Product({
    required this.name,
    required this.price,
    this.category,
    this.description,
    this.rate,
    required this.images,
    required this.sizes,
    required this.color,
    this.reviews
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    List<String> imageList = [];
    if (map['images'] is List) {
      imageList = List<String>.from(map['images']);
    } else if (map['images'] is String) {
      imageList = [map['images']];
    }

    List<String> sizeList = [];
    if (map['sizes'] is List) {
      sizeList = List<String>.from(map['sizes']);
    }

    List<Color> colorList = [];
    if (map['color'] is List) {
      colorList = (map['color'] as List).map((c) {
        if (c is int) return Color(c);
        return Colors.black;
      }).toList();
    }

    return Product(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      category: map['category'],
      description: map['descrition'],
      rate: map['rate'],
      images: imageList,
      sizes: sizeList,
      color: colorList,
    );
  }
}
