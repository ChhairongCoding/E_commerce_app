class Product {
  final String name;
  final double price;
  final String? category;
  final String? description;
  final String? rate;
  final List<String> images;

  Product({
    required this.name,
    required this.price,
    this.category,
    this.description,
    this.rate,
    required this.images,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    // Ensure images is always a list
    List<String> imageList = [];
    if (map['images'] is List) {
      imageList = List<String>.from(map['images']);
    } else if (map['images'] is String) {
      imageList = [map['images']];
    }

    return Product(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      category: map['category'],
      description: map['descrition'], // notice the typo preserved
      rate: map['rate'],
      images: imageList,
    );
  }
}
