import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/services/api/transactions_api_service.dart';

import '../../models/transaction/response_get_transaction_list.dart';
import '../../models/transaction/transaction_model.dart';
import '../../utils/helper/args_transaction_detail_helper.dart';
import '../../utils/types/view_state_type.dart';
import '../../views/transaction_detail/transaction_detail_view.dart';

class HistoryViewModel extends ChangeNotifier {
  HistoryViewModel() {
    initializeNewest();
  }

  Future<void> initializeNewest() async {
    await _setTransactionListNewest();
    await _setReedemListNewest();
    // _getTransactionFromAPI();
  }

  Future<void> initializeOldest() async {
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

  void _changeTransactionListState(ViewStateType state) {
    _transactionListState = state;
    notifyListeners();
  }

  Future<void> _setTransactionListNewest() async {
    _changeTransactionListState(ViewStateType.loading);

    try {
      final ResponseGetTransactionListModel result =
          await TransactionsAPIService().getTransactionHistoryListFromAPI();

      transactionList.clear();
      transactionList.addAll(result.data);
      transactionList.sort((a, b) => b.date!.compareTo(a.date!));
      _changeTransactionListState(ViewStateType.none);

      notifyListeners();
    } catch (e) {
      _changeTransactionListState(ViewStateType.error);
      rethrow;
    }
  }

  Future<void> _setTransactionListOldest() async {
    _changeTransactionListState(ViewStateType.loading);

    try {
      final ResponseGetTransactionListModel result =
          await TransactionsAPIService().getTransactionHistoryListFromAPI();

      transactionList.clear();
      transactionList.addAll(result.data);
      _changeTransactionListState(ViewStateType.none);
      notifyListeners();
    } catch (e) {
      _changeTransactionListState(ViewStateType.error);
      rethrow;
    }
  }

  Future<void> _setReedemListNewest() async {
    _changeTransactionListState(ViewStateType.loading);

    try {
      final ResponseGetTransactionListModel result =
          await TransactionsAPIService().getReedemHistoryListFromAPI();

      redeemList.clear();
      redeemList.addAll(result.data);
      redeemList.sort((a, b) => b.date!.compareTo(a.date!));

      _changeTransactionListState(ViewStateType.none);
      notifyListeners();
    } catch (e) {
      _changeTransactionListState(ViewStateType.error);
      rethrow;
    }
  }

  Future<void> _setReedemListOldest() async {
    _changeTransactionListState(ViewStateType.loading);
    try {
      final ResponseGetTransactionListModel result =
          await TransactionsAPIService().getReedemHistoryListFromAPI();

      redeemList.clear();
      redeemList.addAll(result.data);

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
