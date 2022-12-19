import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/models/transaction/data_request_create_midtrans_transaction_model.dart';
import 'package:flutter_loyalty_point/src/models/transaction/data_request_create_transaction_model.dart';
import 'package:flutter_loyalty_point/src/models/transaction/response_create_midtrans_transaction_model.dart';
import 'package:flutter_loyalty_point/src/models/transaction/response_create_transaction_model.dart';
import 'package:flutter_loyalty_point/src/models/transaction/response_get_transaction_list.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class TransactionsAPIService {
  final APIConfig _apiConfig = APIConfig();

  Future<ResponseGetTransactionListModel>
      getTransactionHistoryListFromAPI() async {
    try {
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

  Future<ResponseCreateTransactionModel> createTransaction({
    required DataRequestCreateTransactionModel data,
  }) async {
    try {
      Response response = await _apiConfig.dio.post(
        Urls.createTransactionPathApi,
        data: data.toJson(),
      );

      ResponseCreateTransactionModel result =
          ResponseCreateTransactionModel.fromJson(
        response.data,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseCreateMidtransTransactionModel> createMidtransTransaction({
    required DataRequestCreateMidtransTransactionModel data,
  }) async {
    try {
      Response response = await _apiConfig.dio.post(
        Urls.createMidtransTransactionPathApi,
        data: data.toJson(),
      );

      ResponseCreateMidtransTransactionModel result =
          ResponseCreateMidtransTransactionModel.fromJson(
        response.data,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
