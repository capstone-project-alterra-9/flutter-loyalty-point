import 'package:flutter_loyalty_point/src/utils/env/env.dart';

class Urls {
  static String baseUrl = Env.apiServerBaseUrl;
  static String baseUrlApi = "$baseUrl/api";

  // auth path api
  static const String registerPathApi = '/register';
  static const String loginPathApi = '/login';

  // product path api
  static String getProductPathApi(String id) => '/auth/products/$id';
  static const String getProductListPathApi = '/auth/products';

  // transaction path api
  static const String getTransactionHistoryListPathApi = '/history';
  static const String createTransactionPathApi = '/transactions';

  // users path api
  static const String getUserPathApi = '/auth/user/me';
}
