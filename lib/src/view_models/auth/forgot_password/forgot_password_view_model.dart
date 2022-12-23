import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_forgot_password_model.dart';
import 'package:flutter_loyalty_point/src/services/api/auth_api_service.dart';
import 'package:flutter_loyalty_point/src/utils/types/snack_bar_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/views/widgets/snack_bar_widget.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  ForgotPasswordViewModel(this.context);

  final BuildContext context;

  ViewStateType? _forgotPasswordState;
  ViewStateType? get forgotPasswordState => _forgotPasswordState;
  void _changeForgotPasswordState(ViewStateType state) {
    _forgotPasswordState = state;
    notifyListeners();
  }

  // handle button login
  void submit(DataRequestForgotPasswordModel data) async {
    _changeForgotPasswordState(ViewStateType.loading);

    try {
      await AuthAPIService().forgotPassword(data: data);

      _changeForgotPasswordState(ViewStateType.none);
    } on DioError {
      // showing error with snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBarWidget(
          title: "Forgot Password Request Failed",
          subtitle: "Make sure to enter a valid and registered email.",
          snackBarType: SnackBarType.error,
        ).build(context),
      );

      _changeForgotPasswordState(ViewStateType.error);
    }
  }
}
