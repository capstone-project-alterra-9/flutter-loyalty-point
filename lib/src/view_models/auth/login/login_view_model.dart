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

  ViewStateType get loginListState => _loginListState;
  ViewStateType _loginListState = ViewStateType.none;

  void _changeLoginListState(ViewStateType state) {
    _loginListState = state;
    notifyListeners();
  }

  void submit(DataRequestLoginModel data) async {
    final NavigatorState navigator = Navigator.of(context);
    _changeLoginListState(ViewStateType.loading);

    try {
      // do request
      final Response response = await AuthAPIService().login(data: data);

      // change request response to model class
      final ResponseLoginModel result = ResponseLoginModel.fromJson(
        response.data,
      );

      // save token to shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result.data.token);
      await prefs.setString('refreshToken', result.data.refreshToken);
      await prefs.setBool('isNewUser', false);

      // navigate to home when login success
      navigator.pushNamedAndRemoveUntil(HomeView.routeName, (route) => false);

      _changeLoginListState(ViewStateType.none);
    } on DioError catch (e) {
      // showing error with snackbar
      if (e.response != null) {
        String message = ResponseErrorModel.fromJson(e.response!.data).message;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    }

    _changeLoginListState(ViewStateType.error);
  }
}
