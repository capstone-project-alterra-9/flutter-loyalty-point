import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_register_model.dart';
import 'package:flutter_loyalty_point/src/services/api/auth_api_service.dart';
import 'package:flutter_loyalty_point/src/utils/types/snack_bar_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/auth/login/login_view_model.dart';
import 'package:flutter_loyalty_point/src/views/widgets/snack_bar_widget.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel(this.context);

  final BuildContext context;

  ViewStateType _registerState = ViewStateType.none;
  ViewStateType get registerState => _registerState;
  void _changeRegisterState(ViewStateType state) {
    _registerState = state;
    notifyListeners();
  }

  bool _obscureText = true;
  bool get obscureText => _obscureText;
  void changeObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void submit(DataRequestRegisterModel data) async {
    final LoginViewModel login = LoginViewModel(context);
    _changeRegisterState(ViewStateType.loading);

    try {
      await AuthAPIService().register(data: data);

      login.submit(
        DataRequestLoginModel(
          email: data.email,
          password: data.password,
        ),
      );

      _changeRegisterState(ViewStateType.none);
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBarWidget(
          title: "Register Failed",
          subtitle:
              "Account already exists or make sure email and username cannot be the same",
          snackBarType: SnackBarType.error,
        ).build(context),
      );

      _changeRegisterState(ViewStateType.error);
    }
  }
}
