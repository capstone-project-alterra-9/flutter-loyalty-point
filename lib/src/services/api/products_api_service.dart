import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_list_model.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_model.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class ProductsAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<ResponseGetProductListModel> getProducts({
    required String path,
  }) async {
    try {
      Response response = await _apiConfig.dio.get(path);

      ResponseGetProductListModel result = ResponseGetProductListModel.fromJson(
        response.data,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseGetProductModel> getProductById({
    required String productId,
  }) async {
    try {
      Response response = await _apiConfig.dio.get(Urls.getProductByIdPathApi(
        productId,
      ));

      ResponseGetProductModel result = ResponseGetProductModel.fromJson(
        response.data,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
