import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';

class ArgsTransactionStatusHelper {
  const ArgsTransactionStatusHelper({
    required this.purchaseType,
    required this.isSuccess,
  });

  final bool isSuccess;
  final PurchaseType purchaseType;
}
