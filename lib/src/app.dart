import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      initialRoute: SplashView.routeName,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Styles.colorBlack400,
          ),
        ),
        backgroundColor: Styles.colorBackground,
        scaffoldBackgroundColor: Styles.colorBackground,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Styles.colorWhite,
          foregroundColor: Styles.colorBlack400,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Styles.colorBlack400,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Styles.colorBlack500,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Styles.colorBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
        ),
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
