import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/utils/helper/query_params_product_list_api_service_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/request_method_type.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class ProductsAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<Response> getProductList({
    required QueryParamsProductListApiServiceHelper queryParams,
  }) async {
    try {
      Response response = await _apiConfig.request(
        method: RequestMethodType.get,
        path: Urls.getProductListPathApi,
        queryParameters: queryParams.toJson(),
        withToken: true,
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
      Response response = await _apiConfig.request(
        method: RequestMethodType.get,
        path: Urls.getProductPathApi(productId),
        withToken: true,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
