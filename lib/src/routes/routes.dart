import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/auth/login/login_view.dart';
import '../view/auth/register/register_view.dart';
import '../view/history/history_view.dart';
import '../view/home/home_view.dart';
import '../view/onboarding/onboarding_view.dart';
import '../view/reedem/reedem_view.dart';
import '../view/reedem_product_detail/reedem_product_detail_view.dart';
import '../view/splash/splash_view.dart';
import '../view/transaction_detail/transaction_detail_view.dart';
import '../view_model/auth/login/login_view_model.dart';
import '../view_model/auth/register/register_view_model.dart';
import '../view_model/history/history_view_model.dart';
import '../view_model/home/home_view_model.dart';
import '../view_model/onboarding/onboarding_view_model.dart';
import '../view_model/reedem/reedem_view_model.dart';
import '../view_model/reedem_product_detail/reedem_product_detail_view_model.dart';
import '../view_model/splash/splash_view_model.dart';
import '../view_model/transaction_detail/transaction_detail_view_model.dart';

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
              return ChangeNotifierProvider(
                create: (context) => LoginViewModel(context),
                child: LoginView(),
              );
            },
          );
        }

      // auth - register section
      case RegisterView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => RegisterViewModel(context),
                child: RegisterView(),
              );
            },
          );
        }

      // history section
      case HistoryView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => HistoryViewModel(context),
                child: HistoryView(),
              );
            },
          );
        }

      // home section
      case HomeView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => HomeViewModel(context),
                child: HomeView(),
              );
            },
          );
        }

      // onboarding section
      case OnboardingView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => OnboardingViewModel(context),
                child: OnboardingView(),
              );
            },
          );
        }

      // reedem section
      case ReedemView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => ReedemViewModel(context),
                child: ReedemView(),
              );
            },
          );
        }

      // reedem product detail section
      case ReedemProductDetailView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => ReedemProductDetailViewModel(context),
                child: ReedemProductDetailView(),
              );
            },
          );
        }

      // splash section
      case SplashView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => SplashViewModel(context),
                child: SplashView(),
              );
            },
          );
        }

      // transaction detail section
      case TransactionDetailView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => TransactionDetailViewModel(context),
                child: TransactionDetailView(),
              );
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
