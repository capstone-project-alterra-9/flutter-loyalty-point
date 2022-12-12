class TransactionModel {
  const TransactionModel(
      {required this.id,
      required this.category,
      required this.name,
      required this.price,
      required this.image,
      required this.serialNumber,
      required this.identifierNumber,
      required this.date,
      required this.status});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
        id: json["ID"],
        category: json["category"],
        name: json["productName"],
        price: json["price"],
        image: json["image"],
        serialNumber: json["serialNumber"],
        identifierNumber: json["identifierNum"],
        date: json["date"],
        status: json["status"]);
  }

  final String? id;
  final String? category;
  final String? name;
  final int? price;
  final String? image;
  final int? serialNumber;
  final String? identifierNumber;
  final String? date;
  final String? status;
}
