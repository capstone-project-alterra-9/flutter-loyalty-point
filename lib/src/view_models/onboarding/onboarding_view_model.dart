import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/views/auth/login/login_view.dart';
import 'package:flutter_loyalty_point/src/views/auth/register/register_view.dart';

class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel(this.context);

  final BuildContext context;

  void toLogin() => Navigator.pushNamedAndRemoveUntil(
        context,
        LoginView.routeName,
        (route) => false,
      );

  void toRegister() => Navigator.pushNamedAndRemoveUntil(
        context,
        RegisterView.routeName,
        (route) => false,
      );
}
