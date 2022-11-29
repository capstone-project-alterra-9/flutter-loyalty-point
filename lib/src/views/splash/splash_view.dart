import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/view_models/splash/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    context.read<SplashViewModel>();
    return const Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
