import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_register_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/response_register_model.dart';
import 'package:flutter_loyalty_point/src/view_models/auth/login/login_view_model.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel(this.context);

  final BuildContext context;

  void onSubmitRegister(DataRequestRegisterModel data) async {
    final LoginViewModel login = LoginViewModel(context);

    try {
      // todo: change request after integration with api
      // do login to server
      final String response = await rootBundle.loadString(
        'assets/json/dummy_data_response_register.json',
      );

      // change request response to model class
      ResponseRegisterModel.fromJson(jsonDecode(response));

      // because the response has no token, do login request
      login.onSubmitLogin(
        DataRequestLoginModel(
          username: data.username,
          password: data.password,
        ),
      );

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
