import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../models/user/response_get_user_model.dart';
import '../../models/user/user_model.dart';
import '../../utils/types/view_state_type.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel(this.context) {
    _setUser();
  }
  final BuildContext context;

  UserModel? _user;
  UserModel? get user => _user;

  ViewStateType _userState = ViewStateType.loading;
  ViewStateType get userState => _userState;

  void _changeUserState(ViewStateType state) {
    _userState = state;
    notifyListeners();
  }

  void _setUser() async {
    _changeUserState(ViewStateType.loading);

    try {
      final String data = await rootBundle.loadString(
        'assets/json/dummy_data_response_get_user.json',
      );

      ResponseGetUserModel result = ResponseGetUserModel.fromJson(
        jsonDecode(data),
      );

      _user = result.data;

      _changeUserState(ViewStateType.none);
    } catch (e) {
      _changeUserState(ViewStateType.error);
      rethrow;
    }
  }
}
