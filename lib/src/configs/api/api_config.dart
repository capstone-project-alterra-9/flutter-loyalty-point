import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/app.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';
import 'package:flutter_loyalty_point/src/views/auth/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIConfig {
  APIConfig() {
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          final String? token = prefs.getString('token');

          options.headers.addAll({"Authorization": 'Bearer $token'});

          return handler.next(options);
        },
        onError: (e, handler) {
          if (e.response!.statusCode == 401) {
            // todo: add refresh token here!
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
}
