import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_register_model.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class AuthAPIService {
  final APIConfig _apiConfig = APIConfig(withToken: false);

  Future<Response> register({required DataRequestRegisterModel data}) async {
    try {
      Response response = await _apiConfig.dio.post(
        Urls.registerPathApi,
        data: data.toJson(),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> login({required DataRequestLoginModel data}) async {
    try {
      Response response = await _apiConfig.dio.post(
        Urls.loginPathApi,
        data: data.toJson(),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
