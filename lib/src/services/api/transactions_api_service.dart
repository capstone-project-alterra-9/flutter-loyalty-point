import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/models/transaction/data_request_add_transaction.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class TransactionsAPIService {
  final APIConfig _apiConfig = APIConfig(withToken: true);

  Future<Response> getTransactionHistoryList() async {
    try {
      Response response = await _apiConfig.dio.get(
        Urls.getTransactionHistoryListPathApi,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> createTransaction({
    required DataRequestAddTransaction data,
  }) async {
    try {
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
