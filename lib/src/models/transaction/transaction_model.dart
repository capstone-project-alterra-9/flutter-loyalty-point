class TransactionModel {
  const TransactionModel({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.image,
    required this.serialNumber,
    required this.identifierNumber,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json["ID"],
      category: json["category"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
      serialNumber: json["serial_number"],
      identifierNumber: json["phone_number"],
    );
  }

  final int id;
  final String category;
  final String name;
  final int price;
  final String image;
  final String serialNumber;
  final String identifierNumber;
}
