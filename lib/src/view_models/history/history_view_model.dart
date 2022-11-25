import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/transaction/response_get_transaction_list.dart';
import '../../models/transaction/transaction_model.dart';
import '../../utils/types/view_state_type.dart';

class HistoryViewModel extends ChangeNotifier {
  HistoryViewModel(this.context) {
    _initialize();
  }

  final BuildContext context;

  void _initialize() {
    _setTransactionList();
  }

  List<TransactionModel> get transactionList => _transactionList;
  final List<TransactionModel> _transactionList = [];

  ViewStateType get transactionListState => _transactionListState;
  ViewStateType _transactionListState = ViewStateType.loading;

  void _changeTransactionListState(ViewStateType state) {
    _transactionListState = state;
    notifyListeners();
  }

  void _setTransactionList() async {
    _changeTransactionListState(ViewStateType.loading);

    try {
      final String data = await rootBundle.loadString(
        'assets/json/dummy_data_response_get_transaction_list.json',
      );

      ResponseGetTransactionListModel result =
          ResponseGetTransactionListModel.fromJson(
        jsonDecode(data),
      );

      transactionList.clear();
      transactionList.addAll(result.data);

      _changeTransactionListState(ViewStateType.none);
    } catch (e) {
      _changeTransactionListState(ViewStateType.error);
      rethrow;
    }
  }
}
