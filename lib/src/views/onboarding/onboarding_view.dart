import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/view_models/onboarding/onboarding_view_model.dart';
import 'package:flutter_loyalty_point/src/views/auth/login/login_view.dart';
import 'package:flutter_loyalty_point/src/views/auth/register/register_view.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const String routeName = "/onboarding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // onboarding image section
            const Expanded(child: Text("Onboarding")),
            const SizedBox(height: 20, width: double.infinity),

            // button login section
            ElevatedButton(
              onPressed: () =>
                  Provider.of<OnboardingViewModel>(context, listen: false)
                      .toLogin(),
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),

            // button register section
            ElevatedButton(
              onPressed: () =>
                  Provider.of<OnboardingViewModel>(context, listen: false)
                      .toRegister(),
              child: const Text("Register"),
            ),
            const SizedBox(height: 20),

            // end section
          ],
        ),
      ),
    );
  }
}
