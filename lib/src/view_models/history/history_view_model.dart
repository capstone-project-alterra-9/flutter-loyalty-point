import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/services/api/transactions_api_service.dart';
import 'package:flutter_loyalty_point/src/views/history/history_view.dart';

import '../../models/transaction/response_get_transaction_list.dart';
import '../../models/transaction/transaction_model.dart';
import '../../utils/helper/args_transaction_detail_helper.dart';
import '../../utils/types/view_state_type.dart';
import '../../views/transaction_detail/transaction_detail_view.dart';

class HistoryViewModel extends ChangeNotifier {
  HistoryViewModel(this.context) {
    _initialize();
  }

  final BuildContext context;

  void _initialize() async {
    await _setTransactionList();
    await _setReedemList();
    // _getTransactionFromAPI();
  }

  List<TransactionModel> get transactionList => _transactionList;
  final List<TransactionModel> _transactionList = [];

  List<TransactionModel> get redeemList => _redeemList;
  final List<TransactionModel> _redeemList = [];

  ViewStateType get transactionListState => _transactionListState;
  ViewStateType _transactionListState = ViewStateType.loading;

  void _changeTransactionListState(ViewStateType state) {
    _transactionListState = state;
    notifyListeners();
  }

  Future<void> _setTransactionList() async {
    _changeTransactionListState(ViewStateType.loading);

    try {
      final ResponseGetTransactionListModel result =
          await TransactionsAPIService().getTransactionHistoryListFromAPI();

      transactionList.clear();
      transactionList.addAll(result.data);
      print("transaction: ${result.data}");

      _changeTransactionListState(ViewStateType.none);
    } catch (e) {
      _changeTransactionListState(ViewStateType.error);
      rethrow;
    }
  }

  Future<void> _setReedemList() async {
    _changeTransactionListState(ViewStateType.loading);

    try {
      final ResponseGetTransactionListModel result =
          await TransactionsAPIService().getReedemHistoryListFromAPI();

      redeemList.clear();
      redeemList.addAll(result.data);
      print("result: ${result.data}");

      _changeTransactionListState(ViewStateType.none);
      notifyListeners();
    } catch (e) {
      _changeTransactionListState(ViewStateType.error);
      rethrow;
    }
  }

  // Future<void> _getTransactionFromAPI() async {
  //   _changeTransactionListState(ViewStateType.loading);
  //   try {
  //     final result = await TransactionsAPIService().getTransactionHistoryList();
  //     _changeTransactionListState(ViewStateType.none);

  //     notifyListeners();
  //   } catch (e) {
  //     _changeTransactionListState(ViewStateType.error);
  //     rethrow;
  //   }
  // }

  //menuju halaman transaksi
  void toTransactionDetail(ArgsTransactionDetailHelper args) =>
      Navigator.pushNamed(
        context,
        TransactionDetailView.routeName,
        arguments: args,
      );

  void filter() {}
}
