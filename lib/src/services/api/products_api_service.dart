import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';

class ProductsAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<Response> getProducts({required String path}) async {
    try {
      await _apiConfig.addToken();
      Response response = await _apiConfig.dio.get(path);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
