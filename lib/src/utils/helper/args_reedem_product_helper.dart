import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';

class ArgsReedemProductHelper {
  ArgsReedemProductHelper({
    required CategoryProductType categoryProductType,
  }) {
    _categoryProductType = categoryProductType;
  }

  late final CategoryProductType _categoryProductType;

  String get categoryProductType {
    switch (_categoryProductType) {
      case CategoryProductType.pulsa:
        {
          return "pulsa";
        }

      case CategoryProductType.paketData:
        {
          return "paket data";
        }

      case CategoryProductType.eMoney:
        {
          return "e-money";
        }

      default:
        {
          return "";
        }
    }
  }
}
