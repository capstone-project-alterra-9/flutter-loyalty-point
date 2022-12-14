import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';

class DataRequestAddTransaction {
  const DataRequestAddTransaction({
    required this.purchaseType,
    required this.productId,
    required this.identifierNumber,
  });

  final PurchaseType purchaseType;
  final String productId;
  final String identifierNumber;

  Map<String, dynamic> toJson() {
    return {
      "paymentMethod": purchaseType.name,
      "productID": productId,
      "identifierNum": identifierNumber,
    };
  }
}
