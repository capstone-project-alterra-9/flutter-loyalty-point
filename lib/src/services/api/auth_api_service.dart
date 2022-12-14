import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_register_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/response_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/response_register_model.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class AuthAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<ResponseRegisterModel> register(
      {required DataRequestRegisterModel data}) async {
    try {
      Response response = await _apiConfig.dio.post(
        Urls.registerPathApi,
        data: data.toJson(),
      );

      final ResponseRegisterModel result = ResponseRegisterModel.fromJson(
        response.data,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseLoginModel> login({
    required DataRequestLoginModel data,
  }) async {
    try {
      Response response = await _apiConfig.dio.post(
        Urls.loginPathApi,
        data: data.toJson(),
      );

      final ResponseLoginModel result = ResponseLoginModel.fromJson(
        response.data,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
