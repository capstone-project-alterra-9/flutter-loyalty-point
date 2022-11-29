import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/response_login_model.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this.context);

  final BuildContext context;

  void onSubmitLogin(DataRequestLoginModel data) async {
    final NavigatorState navigator = Navigator.of(context);

    try {
      // todo: change request after integration with api
      // do login request
      final String response = await rootBundle.loadString(
        'assets/json/dummy_data_response_login.json',
      );

      // change request response to model class
      final ResponseLoginModel result = ResponseLoginModel.fromJson(
        jsonDecode(response),
      );

      // save token to shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result.data.token);

      // navigate to home when login success
      navigator.pushNamed(HomeView.routeName);

      //
    } on DioError catch (e) {
      // showing error with snackbar
      if (e.response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          // todo: change value after integration with api
          const SnackBar(content: Text("error")),
        );
      }
    }
  }
}
