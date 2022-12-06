import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/response_login_model.dart';
import 'package:flutter_loyalty_point/src/models/response_error_model.dart';
import 'package:flutter_loyalty_point/src/services/api/auth_api_service.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this.context);

  final BuildContext context;

  // login view state
  ViewStateType _loginState = ViewStateType.none;
  ViewStateType get loginState => _loginState;
  void _changeLoginState(ViewStateType state) {
    _loginState = state;
    notifyListeners();
  }

  // obscure text password
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  void changeObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  // handle button submit (login)
  void submit(DataRequestLoginModel data) async {
    final NavigatorState navigator = Navigator.of(context);
    _changeLoginState(ViewStateType.loading);

    try {
      // do request
      final Response response = await AuthAPIService().login(data: data);

      // change request response to model class
      final ResponseLoginModel result = ResponseLoginModel.fromJson(
        response.data,
      );

      // save token to shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (result.data?.token != null) {
        await prefs.setString('token', result.data!.token!);
      }

      if (result.data?.refreshToken != null) {
        await prefs.setString('refreshToken', result.data!.refreshToken!);
      }

      // navigate to home when login success
      navigator.pushNamedAndRemoveUntil(HomeView.routeName, (route) => false);

      _changeLoginState(ViewStateType.none);
    } on DioError catch (e) {
      // showing error with snackbar
      if (e.response != null) {
        String message = ResponseErrorModel.fromJson(e.response!.data).message;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    }

    _changeLoginState(ViewStateType.error);
  }
}
