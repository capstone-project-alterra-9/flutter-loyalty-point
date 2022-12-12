import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/models/transaction/data_request_add_transaction.dart';
import 'package:flutter_loyalty_point/src/models/transaction/response_get_transaction_list.dart';
import 'package:flutter_loyalty_point/src/models/transaction/transaction_model.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class TransactionsAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<ResponseGetTransactionListModel>
      getTransactionHistoryListFromAPI() async {
    try {
      await _apiConfig.addToken();
      Response response = await _apiConfig.dio.get(
        Urls.transactionHistoryPath,
      );

      ResponseGetTransactionListModel transactionHistory =
          ResponseGetTransactionListModel.fromJson(response.data);

      return transactionHistory;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseGetTransactionListModel> getReedemHistoryListFromAPI() async {
    try {
      await _apiConfig.addToken();
      Response response = await _apiConfig.dio.get(
        Urls.redeemHistoryPath,
      );

      ResponseGetTransactionListModel reedemList =
          ResponseGetTransactionListModel.fromJson(response.data);

      return reedemList;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> createTransaction({
    required DataRequestAddTransaction data,
  }) async {
    try {
      await _apiConfig.addToken();
      Response response = await _apiConfig.dio.post(
        Urls.createTransactionPathApi,
        data: data.toJson(),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
