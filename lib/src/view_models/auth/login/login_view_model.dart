import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/response_login_model.dart';
import 'package:flutter_loyalty_point/src/services/api/auth_api_service.dart';
import 'package:flutter_loyalty_point/src/utils/types/snack_bar_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';
import 'package:flutter_loyalty_point/src/views/widgets/snack_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this.context);

  final BuildContext context;

  ViewStateType _loginState = ViewStateType.none;
  ViewStateType get loginState => _loginState;
  void _changeLoginState(ViewStateType state) {
    _loginState = state;
    notifyListeners();
  }

  bool _obscureText = true;
  bool get obscureText => _obscureText;
  void changeObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void submit(DataRequestLoginModel data) async {
    final NavigatorState navigator = Navigator.of(context);
    _changeLoginState(ViewStateType.loading);

    try {
      final ResponseLoginModel response = await AuthAPIService().login(
        data: data,
      );

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (response.data?.token != null) {
        await prefs.setString('token', response.data!.token!);
      }

      if (response.data?.refreshToken != null) {
        await prefs.setString('refreshToken', response.data!.refreshToken!);
      }

      if (response.data?.id != null) {
        await prefs.setString('id', response.data!.id!);
      }

      navigator.pushNamedAndRemoveUntil(HomeView.routeName, (route) => false);

      _changeLoginState(ViewStateType.none);
    } on DioError {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBarWidget(
          title: "Login Failed",
          subtitle:
              "The email address or password you entered is incorrect or the account does not exist.",
          snackBarType: SnackBarType.error,
        ).build(context),
      );

      _changeLoginState(ViewStateType.error);
    }
  }
}
