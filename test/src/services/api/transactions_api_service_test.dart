import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/transaction/data_request_create_transaction_model.dart';
import 'package:flutter_loyalty_point/src/models/transaction/response_create_transaction_model.dart';
import 'package:flutter_loyalty_point/src/services/api/transactions_api_service.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'transactions_api_service_test.mocks.dart';

@GenerateMocks([TransactionsAPIService])
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final TransactionsAPIService transactionsAPIService =
      MockTransactionsAPIService();

  group(
    "[CREATE TRANSACTION (REDEEM)]",
    () {
      test(
        "Should be able to convert response to ResponseCreateTransactionModel",
        () async {
          const DataRequestCreateTransactionModel data =
              DataRequestCreateTransactionModel(
            purchaseType: PurchaseType.redeem,
            productId: "productId",
            identifierNumber: "identifierNumber",
          );

          when(
            transactionsAPIService.createTransaction(data: data),
          ).thenAnswer(
            (realInvocation) async {
              final String json = await rootBundle.loadString(
                'assets/json/dummy_data_response_create_transaction_model.json',
              );

              return ResponseCreateTransactionModel.fromJson(
                jsonDecode(json),
              );
            },
          );

          ResponseCreateTransactionModel response =
              await transactionsAPIService.createTransaction(data: data);

          expect(response, isInstanceOf<ResponseCreateTransactionModel>());
        },
      );
    },
  );
}
