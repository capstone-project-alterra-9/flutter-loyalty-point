import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/utils/helper/query_params_product_list_api_service_helper.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class ProductsAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<Response> getProductList({
    required QueryParamsProductListApiServiceHelper queryParams,
  }) async {
    try {
      await _apiConfig.addToken();
      Response response = await _apiConfig.dio.get(
        Urls.getProductListPathApi,
        queryParameters: queryParams.toJson(),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getProduct({
    required String productId,
  }) async {
    try {
      await _apiConfig.addToken();
      Response response = await _apiConfig.dio.get(
        Urls.getProductPathApi(productId),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
