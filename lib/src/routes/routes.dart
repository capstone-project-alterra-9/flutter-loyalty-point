import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/views/home/bottomnav_view.dart';
import 'package:flutter_loyalty_point/src/views/profile/profile_view.dart';
import 'package:flutter_loyalty_point/src/views/qr/qr_view.dart';
import 'package:provider/provider.dart';

import '../views/auth/login/login_view.dart';
import '../views/auth/register/register_view.dart';
import '../views/history/history_view.dart';
import '../views/home/home_view.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/reedem/reedem_view.dart';
import '../views/reedem_product_detail/reedem_product_detail_view.dart';
import '../views/reedem_status/redeem_status_view.dart';
import '../views/splash/splash_view.dart';
import '../views/transaction_detail/transaction_detail_view.dart';
import '../view_models/auth/login/login_view_model.dart';
import '../view_models/auth/register/register_view_model.dart';
import '../view_models/history/history_view_model.dart';
import '../view_models/home/home_view_model.dart';
import '../view_models/onboarding/onboarding_view_model.dart';
import '../view_models/reedem/reedem_view_model.dart';
import '../view_models/reedem_product_detail/reedem_product_detail_view_model.dart';
import '../view_models/splash/splash_view_model.dart';
import '../view_models/transaction_detail/transaction_detail_view_model.dart';

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

      // bottom navigation section
      case BottomNavView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return BottomNavView();
            },
          );
        }

      // bottom navigation section
      case ProfileView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ProfileView();
            },
          );
        }

      // bottom navigation section
      case QrView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return QrView();
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

      // reedem status
      case RedeemStatusView.routeName:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => ReedemProductDetailViewModel(context),
                child: RedeemStatusView(),
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
