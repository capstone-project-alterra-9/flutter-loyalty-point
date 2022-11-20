import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'views/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashView.routeName,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
