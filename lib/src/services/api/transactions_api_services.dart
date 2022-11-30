import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/configs/api/api_config.dart';
import 'package:flutter_loyalty_point/src/models/transaction/data_request_add_transaction.dart';
import 'package:flutter_loyalty_point/src/utils/types/request_method_type.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';

class TransactionsAPIServices {
  final APIConfig _apiConfig = APIConfig();

  Future<Response> getTransactionHistoryList() async {
    try {
      Response response = await _apiConfig.request(
        method: RequestMethodType.get,
        path: Urls.getTransactionHistoryListPathApi,
        withToken: true,
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
      Response response = await _apiConfig.request(
        method: RequestMethodType.post,
        path: Urls.createTransactionPathApi,
        data: data.toJson(),
        withToken: true,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
