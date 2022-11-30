import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/views/home/bottomnav_view.dart';

import 'routes/routes.dart';
import 'views/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: BottomNavView.routeName,
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
