import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/local/payment_method_model.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_payment_helper.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_status_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/payment_method_type.dart';
import 'package:flutter_loyalty_point/src/views/transaction_status/transaction_status_view.dart';

class PaymentViewModel extends ChangeNotifier {
  PaymentViewModel(this.context, {required this.args});

  final BuildContext context;

  final ArgsPaymentHelper args;

  final List<PaymentMethodModel> paymentMethodList =
      PaymentMethodModel.paymentMethodList;

  bool get payButtonDisabled {
    if (paymentMethod == null) {
      return true;
    }

    return false;
  }

  PaymentMethodType? _paymentMethod;
  PaymentMethodType? get paymentMethod => _paymentMethod;
  set paymentMethod(PaymentMethodType? value) {
    _paymentMethod = value;
    notifyListeners();
  }

  void createTransaction() {
    Navigator.pushNamed(
      context,
      TransactionStatusView.routeName,
      arguments: const ArgsTransactionStatusHelper(isSuccess: true),
    );
    return;
  }
}
