class Urls {
  static const String baseUrl = "";
  static const String baseUrlApi = "$baseUrl/api";

  // auth path api
  static const String registerPathApi = '/register';
  static const String loginPathApi = '/login';

  // product path api
  static String getProductPathApi(String id) => '/products/$id';
  static const String getProductListPathApi = '/products';

  // transaction path api
  static const String getTransactionHistoryListPathApi = '/history';
  static const String createTransactionPathApi = '/transactions';
}
