class ResponseGetProductModel {
  ResponseGetProductModel({required this.message, required this.data});

  factory ResponseGetProductModel.fromJson(Map<String, dynamic> json) {
    return ResponseGetProductModel(
      message: json["message"],
      data: DataModel.fromJson(json['data']),
    );
  }

  final String message;
  final DataModel data;
}

class DataModel {
  const DataModel({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["ID"],
      category: json["category"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      image: json["image"],
    );
  }

  final int id;
  final String category;
  final String name;
  final String description;
  final int price;
  final String image;
}
