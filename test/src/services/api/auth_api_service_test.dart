import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_register_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/response_login_model.dart';
import 'package:flutter_loyalty_point/src/models/auth/response_register_model.dart';
import 'package:flutter_loyalty_point/src/services/api/auth_api_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'auth_api_service_test.mocks.dart';

@GenerateMocks([AuthAPIService])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final AuthAPIService authAPIService = MockAuthAPIService();

  group(
    "[REGISTER]",
    () {
      test(
        "Should be able to convert response to ResponseRegisterModel",
        () async {
          const DataRequestRegisterModel data = DataRequestRegisterModel(
            username: "Fernando",
            email: "fernando12@mail.com",
            password: "12345678",
          );

          when(
            authAPIService.register(data: data),
          ).thenAnswer(
            (realInvocation) async {
              final String json = await rootBundle.loadString(
                'assets/json/dummy_data_response_login.json',
              );

              return ResponseRegisterModel.fromJson(
                jsonDecode(json),
              );
            },
          );

          ResponseRegisterModel response = await authAPIService.register(
            data: data,
          );

          expect(response, isInstanceOf<ResponseRegisterModel>());
        },
      );
    },
  );

  group(
    "[LOGIN]",
    () {
      test(
        "Should be able to convert response to ResponseLoginModel",
        () async {
          const DataRequestLoginModel data = DataRequestLoginModel(
            email: "fernando12@mail.com",
            password: "12345678",
          );

          when(
            authAPIService.login(data: data),
          ).thenAnswer(
            (realInvocation) async {
              final String json = await rootBundle.loadString(
                'assets/json/dummy_data_response_register.json',
              );

              return ResponseLoginModel.fromJson(
                jsonDecode(json),
              );
            },
          );

          ResponseLoginModel response = await authAPIService.login(
            data: data,
          );

          expect(response, isInstanceOf<ResponseLoginModel>());
        },
      );
    },
  );
}
