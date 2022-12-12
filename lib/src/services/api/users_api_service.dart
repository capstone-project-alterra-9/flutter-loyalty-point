import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<Response> getUser() async {
    try {
      await _apiConfig.addToken();

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? id = prefs.getString('id');

      Response response = await _apiConfig.dio.get(
        Urls.getUserPathApi(id!),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
