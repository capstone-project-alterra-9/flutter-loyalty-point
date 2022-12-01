import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/view_models/onboarding/onboarding_view_model.dart';
import 'package:flutter_loyalty_point/src/views/auth/login/login_view.dart';
import 'package:flutter_loyalty_point/src/views/auth/register/register_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const String routeName = "/onboarding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/onboarding_background.png"),
                fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/jokomart_logo.png"),
                      ),
                    ),
                    width: 200,
                    height: 75,
                  ),
                  const SizedBox(height: 20, width: double.infinity),
                  Text(
                    "Start paying for your purchases with the JokoMart application and get rewards from The Points you have collected",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  // onboarding image section
                  const SizedBox(height: 20, width: double.infinity),
                  // button login section
                  ElevatedButton(
                    onPressed: () =>
                        Provider.of<OnboardingViewModel>(context, listen: false)
                            .toLogin(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(156, 194, 155, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // button register section
                  ElevatedButton(
                    onPressed: () =>
                        Provider.of<OnboardingViewModel>(context, listen: false)
                            .toRegister(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        side: BorderSide(
                          width: 0.5,
                          color: const Color.fromRGBO(156, 194, 155, 1),
                        )),
                    child: const Text("Register"),
                  ),
                  const SizedBox(height: 10),

                  // end section
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
