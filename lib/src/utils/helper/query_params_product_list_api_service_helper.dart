import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';

class QueryParamsProductListApiServiceHelper {
  QueryParamsProductListApiServiceHelper({this.category});

  final CategoryProductType? category;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {};

    if (category != null) {
      params.addAll({"categories": category!.name});
    }

    return params;
  }
}
