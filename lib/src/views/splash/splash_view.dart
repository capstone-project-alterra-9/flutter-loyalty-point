import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/view_models/splash/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    context.read<SplashViewModel>();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            "assets/images/logo_light_app.png",
            height: 58,
          ),
        ),
      ),
    );
  }
}
