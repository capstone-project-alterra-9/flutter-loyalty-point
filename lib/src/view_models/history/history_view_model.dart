import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/services/api/transactions_api_service.dart';
import 'package:flutter_loyalty_point/src/views/history/history_view.dart';

import '../../models/transaction/response_get_transaction_list.dart';
import '../../models/transaction/transaction_model.dart';
import '../../utils/helper/args_transaction_detail_helper.dart';
import '../../utils/types/view_state_type.dart';
import '../../views/transaction_detail/transaction_detail_view.dart';

enum SortStatusState { newest, oldest }

class HistoryViewModel extends ChangeNotifier {
  HistoryViewModel() {
    if (sortStatusState == SortStatusState.newest) {
      _initializeNewest();
    } else {
      _initializeOldest();
    }
  }

  void _initializeNewest() async {
    await _setTransactionListNewest();
    await _setReedemListNewest();
    // _getTransactionFromAPI();
  }

  void _initializeOldest() async {
    await _setTransactionListOldest();
    await _setReedemListOldest();
    // _getTransactionFromAPI();
  }

  List<TransactionModel> get transactionList => _transactionList;
  final List<TransactionModel> _transactionList = [];

  List<TransactionModel> get redeemList => _redeemList;
  final List<TransactionModel> _redeemList = [];

  ViewStateType get transactionListState => _transactionListState;
  ViewStateType _transactionListState = ViewStateType.loading;

  SortStatusState _sortStatusState = SortStatusState.newest;
  SortStatusState get sortStatusState => _sortStatusState;

  void _changeTransactionListState(ViewStateType state) {
    _transactionListState = state;
    notifyListeners();
  }

  changeSortStatusState(SortStatusState s) {
    _sortStatusState = s;
    notifyListeners();
  }

  Future<void> _setTransactionListNewest() async {
    _changeTransactionListState(ViewStateType.loading);
    changeSortStatusState(SortStatusState.newest);

    try {
      final ResponseGetTransactionListModel result =
          await TransactionsAPIService().getTransactionHistoryListFromAPI();

      transactionList.clear();
      transactionList.addAll(result.data);
      transactionList.sort((a, b) => b.date!.compareTo(a.date!));
      print("transaction: ${result.data}");
      _changeTransactionListState(ViewStateType.none);

      notifyListeners();
    } catch (e) {
      _changeTransactionListState(ViewStateType.error);
      rethrow;
    }
  }

  Future<void> _setTransactionListOldest() async {
    _changeTransactionListState(ViewStateType.loading);
    changeSortStatusState(SortStatusState.oldest);

    try {
      final ResponseGetTransactionListModel result =
          await TransactionsAPIService().getTransactionHistoryListFromAPI();

      transactionList.clear();
      transactionList.addAll(result.data);
      print("transaction: ${result.data}");
      _changeTransactionListState(ViewStateType.none);
      notifyListeners();
    } catch (e) {
      _changeTransactionListState(ViewStateType.error);
      rethrow;
    }
  }

  Future<void> _setReedemListNewest() async {
    _changeTransactionListState(ViewStateType.loading);
    changeSortStatusState(SortStatusState.newest);

    try {
      final ResponseGetTransactionListModel result =
          await TransactionsAPIService().getReedemHistoryListFromAPI();

      redeemList.clear();
      redeemList.addAll(result.data);
      redeemList.sort((a, b) => b.date!.compareTo(a.date!));
      print("result: ${result.data}");

      _changeTransactionListState(ViewStateType.none);
      notifyListeners();
    } catch (e) {
      _changeTransactionListState(ViewStateType.error);
      rethrow;
    }
  }

  Future<void> _setReedemListOldest() async {
    _changeTransactionListState(ViewStateType.loading);
    changeSortStatusState(SortStatusState.oldest);

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

  //menuju halaman transaksi
  void toTransactionDetail(
          ArgsTransactionDetailHelper args, BuildContext context) =>
      Navigator.pushNamed(
        context,
        TransactionDetailView.routeName,
        arguments: args,
      );
}
