import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';

class ArgsProductListHelper {
  ArgsProductListHelper({
    required this.categoryProductType,
    this.productId,
    required this.purchaseType,
  });

  final CategoryProductType categoryProductType;
  String? productId;
  final PurchaseType purchaseType;
}
