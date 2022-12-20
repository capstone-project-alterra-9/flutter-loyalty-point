import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_payment_helper.dart';

class PaymentViewModel extends ChangeNotifier {
  PaymentViewModel(this.context, {required this.args});

  final BuildContext context;

  final ArgsPaymentHelper args;

  InAppWebViewController? inAppWebViewController;
}
