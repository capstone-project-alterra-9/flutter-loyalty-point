import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/routes.dart';
import 'views/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashView.routeName,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Styles.colorBlack500,
        ),
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
