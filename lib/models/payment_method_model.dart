class PaymentMethodModel {
  final String method;
  final String imageUrl;

  PaymentMethodModel({
    required this.method,
    required this.imageUrl,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      method: json['method'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'imageUrl': imageUrl,
    };
  }
}
