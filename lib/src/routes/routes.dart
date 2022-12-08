import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_status_helper.dart';
import 'package:flutter_loyalty_point/src/view_models/transaction_status/transaction_status_view_model.dart';
import 'package:flutter_loyalty_point/src/views/profile/profile_view.dart';
import 'package:flutter_loyalty_point/src/views/qr/qr_view.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_detail_helper.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_list_helper.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_detail_helper.dart';
import 'package:provider/provider.dart';

import '../views/auth/login/login_view.dart';
import '../views/auth/register/register_view.dart';
import '../views/history/history_view.dart';
import '../views/home/home_view.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/product_list/product_list_view.dart';
import '../views/product_detail/product_detail_view.dart';
import '../views/transaction_status/transaction_status_view.dart';
import '../views/splash/splash_view.dart';
import '../views/transaction_detail/transaction_detail_view.dart';
import '../view_models/auth/login/login_view_model.dart';
import '../view_models/auth/register/register_view_model.dart';
import '../view_models/history/history_view_model.dart';
import '../view_models/home/home_view_model.dart';
import '../view_models/onboarding/onboarding_view_model.dart';
import '../view_models/product_list/product_list_view_model.dart';
import '../view_models/product_detail/product_detail_view_model.dart';
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
                child: const LoginView(),
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
                child: const RegisterView(),
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
                child: const HomeView(),
              );
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
                child: const OnboardingView(),
              );
            },
          );
        }

      // product list section
      case ProductListView.routeName:
        {
          ArgsProductListHelper args =
              settings.arguments as ArgsProductListHelper;

          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => ProductListViewModel(
                  context,
                  args: args,
                ),
                child: const ProductListView(),
              );
            },
          );
        }

      // reedem product detail section
      case ProductDetailView.routeName:
        {
          ArgsProductDetailHelper args =
              settings.arguments as ArgsProductDetailHelper;

          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => ProductDetailViewModel(
                  context,
                  args: args,
                ),
                child: const ProductDetailView(),
              );
            },
          );
        }

      // reedem status
      case TransactionStatusView.routeName:
        {
          ArgsTransactionStatusHelper args =
              settings.arguments as ArgsTransactionStatusHelper;

          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => TransactionStatusViewModel(
                  context,
                  args: args,
                ),
                child: const TransactionStatusView(),
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
                child: const SplashView(),
              );
            },
          );
        }

      // transaction detail section
      case TransactionDetailView.routeName:
        {
          ArgsTransactionDetailHelper args =
              settings.arguments as ArgsTransactionDetailHelper;

          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChangeNotifierProvider(
                create: (context) => TransactionDetailViewModel(
                  context,
                  args: args,
                ),
                child: const TransactionDetailView(),
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
