import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/app.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';
import 'package:flutter_loyalty_point/src/views/auth/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIConfig {
  APIConfig({required bool withToken}) {
    initialize(withToken: withToken);
  }

  void initialize({required bool withToken}) async {
    if (withToken) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      dio.options.headers.addAll({"Authorization": 'Bearer $token'});
    }

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (e, handler) {
          if (e.response!.statusCode == 401) {
            // todo: add refresh token here!
            MyApp.navigatorKey.currentState!.pushNamedAndRemoveUntil(
              LoginView.routeName,
              (route) => false,
            );

            return;
          }

          // send other error responses
          handler.next(e);
        },
      ),
    );
  }

  final Dio dio = Dio(BaseOptions(baseUrl: Urls.baseUrlApi));
}
