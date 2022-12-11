class ProductModel {
  const ProductModel({
    required this.id,
    required this.category,
    required this.redeem,
    required this.buy,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["ID"],
      category: json["category"],
      redeem: json["redeem"],
      buy: json["buy"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      image: json["image"],
      stock: json["stock"],
    );
  }

  final String? id;
  final String? category;
  final bool? redeem;
  final bool? buy;
  final String? name;
  final String? description;
  final int? price;
  final String? image;
  final int? stock;
}
