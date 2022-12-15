// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_loyalty_point/test/src/services/api/users_api_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_loyalty_point/src/models/user/response_get_user_model.dart'
    as _i2;
import 'package:flutter_loyalty_point/src/services/api/users_api_service.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponseGetUserModel_0 extends _i1.SmartFake
    implements _i2.ResponseGetUserModel {
  _FakeResponseGetUserModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UsersAPIService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsersAPIService extends _i1.Mock implements _i3.UsersAPIService {
  MockUsersAPIService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ResponseGetUserModel> getUser() => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue: _i4.Future<_i2.ResponseGetUserModel>.value(
            _FakeResponseGetUserModel_0(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.ResponseGetUserModel>);
}