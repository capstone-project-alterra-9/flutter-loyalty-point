import 'package:flutter/material.dart';

import '../view/auth/login/login_view.dart';
import '../view/auth/register/register_view.dart';
import '../view/history/history_view.dart';
import '../view/home/home_view.dart';
import '../view/onboarding/onboarding_view.dart';
import '../view/reedem/reedem_view.dart';
import '../view/reedem_product_detail/reedem_product_detail_view.dart';
import '../view/splash/splash_view.dart';
import '../view/transaction_detail/transaction_detail_view.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    //
    // routing
    switch (settings.name) {

      // auth - login section
      case LoginView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return LoginView();
            },
          );
        }

      // auth - register section
      case RegisterView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return RegisterView();
            },
          );
        }

      // history section
      case HistoryView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return HistoryView();
            },
          );
        }

      // home section
      case HomeView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return HomeView();
            },
          );
        }

      // onboarding section
      case OnboardingView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return OnboardingView();
            },
          );
        }

      // reedem section
      case ReedemView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ReedemView();
            },
          );
        }

      // reedem product detail section
      case ReedemProductDetailView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ReedemProductDetailView();
            },
          );
        }

      // splash section
      case SplashView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return SplashView();
            },
          );
        }

      // transaction detail section
      case TransactionDetailView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return TransactionDetailView();
            },
          );
        }

      // default section
      default:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const Scaffold(
                body: Center(
                  child: Text("Not Found"),
                ),
              );
            },
          );
        }
    }
  }
}
