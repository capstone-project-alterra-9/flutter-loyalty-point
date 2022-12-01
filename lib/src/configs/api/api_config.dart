import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/utils/types/request_method_type.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIConfig {
  final Dio _dio = Dio(BaseOptions(baseUrl: Urls.baseUrlApi));

  Future<Response> request({
    required RequestMethodType method,
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool withToken = false,
  }) async {
    final Map<String, String> headers = {};

    // add token to headers when need
    if (withToken) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      headers.addAll({"Authorization": 'Bearer $token'});
    }

    // add interceptors
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (e, handler) {
          if (e.response!.statusCode == 401) {
            // todo: add refresh token here!

            return;
          }

          // send other error responses
          handler.next(e);
        },
      ),
    );

    // do request to server
    Future<Response> response = _dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        method: method.name,
        headers: headers,
      ),
    );

    // return request response
    return response;
  }
}
