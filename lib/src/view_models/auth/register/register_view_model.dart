import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_register_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/response_register_model.dart';
import 'package:flutter_loyalty_point/src/models/response_error_model.dart';
import 'package:flutter_loyalty_point/src/services/api/auth_api_service.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/auth/login/login_view_model.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel(this.context);

  final BuildContext context;

  ViewStateType get loginListState => _registerListState;
  ViewStateType _registerListState = ViewStateType.none;

  void _changeRegisterListState(ViewStateType state) {
    _registerListState = state;
    notifyListeners();
  }

  void submit(DataRequestRegisterModel data) async {
    final LoginViewModel login = LoginViewModel(context);
    _changeRegisterListState(ViewStateType.loading);

    try {
      // do request
      final Response response = await AuthAPIService().register(data: data);

      // change request response to model class
      ResponseRegisterModel.fromJson(response.data);

      // because the response has no token, do login request
      login.submit(
        DataRequestLoginModel(
          email: data.email,
          password: data.password,
        ),
      );

      _changeRegisterListState(ViewStateType.none);
    } on DioError catch (e) {
      // showing error with snackbar
      if (e.response != null) {
        String message = ResponseErrorModel.fromJson(e.response!.data).message;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }

      _changeRegisterListState(ViewStateType.error);
    }
  }
}
