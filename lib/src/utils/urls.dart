import 'package:flutter_loyalty_point/src/utils/env/env.dart';
import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';

class Urls {
  static String baseUrl = Env.apiServerBaseUrl;
  static String baseUrlApi = "$baseUrl/api";

  // auth path api
  static const String registerPathApi = '/register';
  static const String loginPathApi = '/login';
  static const String refreshTokenPathApi = '/refresh-token';

  // product path api
  static String getProductByIdPathApi(String id) => '/auth/products/$id';
  static String getProductsByPurchasePathApi(PurchaseType purchase) =>
      '/auth/products/method/${purchase.toPath()}';
  static String getProductsByCategoryPathApi(CategoryProductType category) =>
      '/auth/products/category/${category.toPath()}';

  // transaction path api
  static const String getTransactionHistoryListPathApi = '/history';
  static const String createTransactionPathApi = '/auth/transactions';

  // transaction history api
  static const String redeemHistoryPath = '/auth/history/method/redeem';
  static const String transactionHistoryPath = '/auth/history/method/buy';

  // users path api
  static String getUserPathApi(String id) => '/users/$id';
}
