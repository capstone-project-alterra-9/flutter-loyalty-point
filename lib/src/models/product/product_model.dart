class ProductModel {
  const ProductModel({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.image,
    this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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
  final int? stock;
}
