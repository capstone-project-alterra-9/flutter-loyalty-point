import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_status_helper.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';

class TransactionStatusViewModel extends ChangeNotifier {
  TransactionStatusViewModel(this.context, {required this.args}) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        HomeView.routeName,
        (route) => false,
      ),
    );
  }

  final BuildContext context;

  final ArgsTransactionStatusHelper args;
}
