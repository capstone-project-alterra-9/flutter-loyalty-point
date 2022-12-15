import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/user/response_get_user_model.dart';
import 'package:flutter_loyalty_point/src/services/api/users_api_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'users_api_service_test.mocks.dart';

@GenerateMocks([UsersAPIService])
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final UsersAPIService usersAPIService = MockUsersAPIService();

  group(
    "[GET USER]",
    () {
      test(
        "Should be able to convert response to ResponseGetUserModel",
        () async {
          when(
            usersAPIService.getUser(),
          ).thenAnswer(
            (realInvocation) async {
              final String json = await rootBundle.loadString(
                'assets/json/dummy_data_response_get_user.json',
              );

              return ResponseGetUserModel.fromJson(
                jsonDecode(json),
              );
            },
          );

          ResponseGetUserModel response = await usersAPIService.getUser();

          expect(response, isInstanceOf<ResponseGetUserModel>());
        },
      );
    },
  );
}
