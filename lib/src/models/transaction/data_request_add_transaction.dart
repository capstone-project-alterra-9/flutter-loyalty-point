class DataRequestAddTransaction {
  const DataRequestAddTransaction({
    required this.productId,
    required this.identifierNumber,
  });

  final int productId;
  final String identifierNumber;

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "phone_number": identifierNumber,
    };
  }
}
