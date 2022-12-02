import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';

class ArgsReedemProductHelper {
  ArgsReedemProductHelper({
    required CategoryProductType categoryProductType,
    this.productId,
  }) {
    _categoryProductType = categoryProductType;
  }

  late final CategoryProductType _categoryProductType;
  int? productId;

  String get categoryProductType {
    switch (_categoryProductType) {
      case CategoryProductType.credits:
        {
          return "Credits";
        }

      case CategoryProductType.dataQuota:
        {
          return "Data Quota";
        }

      case CategoryProductType.eMoney:
        {
          return "E-Money";
        }

      default:
        {
          return "";
        }
    }
  }
}
