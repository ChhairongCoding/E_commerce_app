class TrendingModel {
  final String image;

  TrendingModel({required this.image});

  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {'image': image};
  }
}
