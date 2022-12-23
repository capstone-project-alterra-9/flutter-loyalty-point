import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/helper/args_transaction_detail_helper.dart';

class TransactionDetailViewModel extends ChangeNotifier {
  TransactionDetailViewModel(this.context, {required this.args});

  final BuildContext context;

  final ArgsTransactionDetailHelper args;

  void toCustomerService() async {
    await launchUrlString(
      "https://wa.me/6288287112431",
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }
}
