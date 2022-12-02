import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';
import 'package:flutter_loyalty_point/src/views/onboarding/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel(this.context) {
    _initialize();
  }

  final BuildContext context;

  void _initialize() {
    _checkUser();
  }

  void _checkUser() async {
    NavigatorState navigator = Navigator.of(context);

    // get token and isNewUser value in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    // when token null, navigate to login
    if (token == null) {
      Timer(
        const Duration(seconds: 2),
        () => navigator.pushNamedAndRemoveUntil(
          OnboardingView.routeName,
          (route) => false,
        ),
      );

      return;
    }

    // when isNewUser and token not null, navigate to home
    Timer(
      const Duration(seconds: 2),
      () => navigator.pushNamedAndRemoveUntil(
        HomeView.routeName,
        (route) => false,
      ),
    );
  }
}
