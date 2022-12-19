class DataRequestCreateMidtransTransactionModel {
  DataRequestCreateMidtransTransactionModel({
    required this.productID,
    required this.userID,
  });

  final String productID;
  final String userID;

  Map<String, dynamic> toJson() {
    return {
      "ProductID": productID,
      "userID": userID,
    };
  }
}
