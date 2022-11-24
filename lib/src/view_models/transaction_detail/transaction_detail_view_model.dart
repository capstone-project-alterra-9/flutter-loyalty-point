import 'package:flutter/material.dart';

import '../../utils/helper/args_transaction_detail_helper.dart';

class TransactionDetailViewModel extends ChangeNotifier {
  TransactionDetailViewModel(this.context, {required this.args});

  final BuildContext context;

  final ArgsTransactionDetailHelper args;
}
