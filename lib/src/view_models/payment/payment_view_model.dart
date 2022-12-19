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

  void handleDone() {
    Navigator.pushNamed(
      context,
      TransactionStatusView.routeName,
      arguments: const ArgsTransactionStatusHelper(
        isSuccess: true,
        purchaseType: PurchaseType.buy,
      ),
    );
    return;
  }
}
