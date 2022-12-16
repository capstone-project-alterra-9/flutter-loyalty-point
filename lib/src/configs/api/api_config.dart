import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/app.dart';
import 'package:flutter_loyalty_point/src/models/auth/response_refresh_token_model.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';
import 'package:flutter_loyalty_point/src/views/auth/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIConfig {
  APIConfig() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          final String? token = prefs.getString('token');

          options.headers.addAll({"Authorization": 'Bearer $token'});

          return handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response!.statusCode == 401) {
            bool getNewToken = await _refreshToken();

            if (getNewToken) {
              return handler.resolve(await _retry(e.requestOptions));
            }

            MyApp.navigatorKey.currentState!.pushNamedAndRemoveUntil(
              LoginView.routeName,
              (route) => false,
            );

            return;
          }

          handler.next(e);
        },
      ),
    );
  }

  final Dio dio = Dio(BaseOptions(baseUrl: Urls.baseUrlApi));

  @Deprecated("already handled in the interceptors, planned to be removed!")
  Future<void> addToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    dio.options.headers.addAll({"Authorization": 'Bearer $token'});
  }

  Future<bool> _refreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final String? refreshToken = prefs.getString('refreshToken');

      Response response = await dio.post(
        Urls.refreshTokenPathApi,
        data: {"refreshToken": refreshToken},
      );

      ResponseRefreshTokenModel result = ResponseRefreshTokenModel.fromJson(
        response.data,
      );

      if (result.data?.token != null) {
        await prefs.setString('token', result.data!.token!);
      }

      return true;
    } on DioError {
      prefs.clear();

      return false;
    }
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    try {
      final options = Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      );

      return dio.request<dynamic>(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
    } on DioError {
      rethrow;
    }
  }
}
