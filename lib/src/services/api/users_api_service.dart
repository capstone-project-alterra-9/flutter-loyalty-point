import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class UsersAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<Response> getUser() async {
    try {
      await _apiConfig.addToken();
      Response response = await _apiConfig.dio.get(
        Urls.getUserPathApi,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
