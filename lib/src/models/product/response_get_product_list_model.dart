class ResponseGetProductListModel {
  const ResponseGetProductListModel({
    required this.message,
    required this.data,
  });

  factory ResponseGetProductListModel.fromJson(Map<String, dynamic> json) {
    return ResponseGetProductListModel(
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<DataModel>.from(
              json["data"].map((x) => DataModel.fromJson(x)),
            ),
    );
  }

  final String message;
  final List<DataModel> data;
}

class DataModel {
  const DataModel({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.image,
    required this.stock,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["ID"],
      category: json["category"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
      stock: json["stock"],
    );
  }

  final int id;
  final String category;
  final String name;
  final int price;
  final String image;
  final int stock;
}
