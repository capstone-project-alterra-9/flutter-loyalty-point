import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';

class ArgsProductDetailHelper {
  const ArgsProductDetailHelper({
    required this.productId,
    required this.identifierNumber,
    required this.purchaseType,
  });

  final String productId;
  final String identifierNumber;
  final PurchaseType purchaseType;
}
