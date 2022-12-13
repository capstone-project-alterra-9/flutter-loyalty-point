import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/models/user/response_get_user_model.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<ResponseGetUserModel> getUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? id = prefs.getString('id');

      Response response = await _apiConfig.dio.get(
        Urls.getUserPathApi(id!),
      );

      ResponseGetUserModel result = ResponseGetUserModel.fromJson(
        response.data,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
