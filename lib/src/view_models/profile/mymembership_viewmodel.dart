import 'package:flutter/cupertino.dart';

import '../../models/user/response_get_user_model.dart';
import '../../models/user/user_model.dart';
import '../../services/api/users_api_service.dart';
import '../../utils/types/view_state_type.dart';

class MyMembershipViewModel extends ChangeNotifier {
  MyMembershipViewModel() {
    _setUser();
  }

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
      final ResponseGetUserModel response = await UsersAPIService().getUser();

      _user = response.data;

      _changeUserState(ViewStateType.none);
    } catch (e) {
      _changeUserState(ViewStateType.error);
      rethrow;
    }
  }
}
