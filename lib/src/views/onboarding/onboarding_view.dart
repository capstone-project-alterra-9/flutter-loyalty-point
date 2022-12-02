import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/view_models/onboarding/onboarding_view_model.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const String routeName = "/onboarding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background section
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/onboarding_background.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // gradient section
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0),
                ],
              ),
            ),
          ),

          // content section
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // jokomart logo
                  Image.asset(
                    "assets/images/jokomart_logo.png",
                    height: 74,
                  ),
                  const SizedBox(height: 20),

                  // text
                  const Text(
                    "Start paying for your purchases with the JokoMart\napplication and get rewards from The Points you\nhave collected",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // button login section
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<OnboardingViewModel>(context, listen: false)
                          .toLogin();
                    },
                    style: Styles.primaryButton.copyWith(
                      minimumSize: const MaterialStatePropertyAll(
                        Size.fromHeight(44),
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                  const SizedBox(height: 10),

                  // button register section
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<OnboardingViewModel>(context, listen: false)
                          .toRegister();
                    },
                    style: Styles.secondaryButton.copyWith(
                      minimumSize: const MaterialStatePropertyAll(
                        Size.fromHeight(44),
                      ),
                    ),
                    child: const Text("Register"),
                  ),

                  // end section
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
