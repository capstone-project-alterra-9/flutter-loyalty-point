import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_payment_helper.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_status_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';
import 'package:flutter_loyalty_point/src/views/transaction_status/transaction_status_view.dart';

class PaymentViewModel extends ChangeNotifier {
  PaymentViewModel(this.context, {required this.args});

  final BuildContext context;

  final ArgsPaymentHelper args;

  InAppWebViewController? inAppWebViewController;

  void checkTransactionStatus() async {
    NavigatorState navigator = Navigator.of(context);
    bool isSuccess = await _isSuccess();

    if (isSuccess) {
      Timer(
        const Duration(seconds: 1),
        () => navigator.pushNamed(
          TransactionStatusView.routeName,
          arguments: const ArgsTransactionStatusHelper(
            purchaseType: PurchaseType.buy,
            isSuccess: true,
          ),
        ),
      );
    }
  }

  Future<bool> handleBack() async {
    NavigatorState navigator = Navigator.of(context);

    bool canGoBack = await inAppWebViewController!.canGoBack();
    bool isSuccess = await _isSuccess();

    if (canGoBack && !isSuccess) {
      inAppWebViewController!.goBack();
      return false;
    } else {
      navigator.pop;
      return true;
    }
  }

  Future<bool> _isSuccess() async {
    String? html = await inAppWebViewController!.getHtml();
    bool paymentSuccessful = html!.toLowerCase().contains("payment successful");
    bool paymentVerified =
        html.toLowerCase().contains("transaction successfully verified");

    if (paymentSuccessful || paymentVerified) {
      return true;
    } else {
      return false;
    }
  }
}
