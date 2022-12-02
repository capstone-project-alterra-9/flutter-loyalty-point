import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/utils/types/request_method_type.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class UsersAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<Response> getUser() async {
    try {
      Response response = await _apiConfig.request(
        method: RequestMethodType.get,
        path: Urls.getUserPathApi,
        withToken: true,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
