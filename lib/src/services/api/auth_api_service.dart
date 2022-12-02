import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_register_model.dart';
import 'package:flutter_loyalty_point/src/utils/types/request_method_type.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class AuthAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<Response> register({required DataRequestRegisterModel data}) async {
    Response response = await _apiConfig.request(
      method: RequestMethodType.post,
      path: Urls.registerPathApi,
      data: data.toJson(),
    );

    return response;
  }

  Future<Response> login({required DataRequestLoginModel data}) async {
    Response response = await _apiConfig.request(
      method: RequestMethodType.post,
      path: Urls.loginPathApi,
      data: data.toJson(),
    );

    return response;
  }
}
