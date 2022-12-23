import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/utils/types/snack_bar_type.dart';
import 'package:flutter_loyalty_point/src/views/widgets/snack_bar_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../models/user/response_get_user_model.dart';
import '../../models/user/user_model.dart';
import '../../services/api/users_api_service.dart';
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

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBarWidget(
              title: "Service not available",
              subtitle:
                  "Sorry, the service you selected is currently under development",
              snackBarType: SnackBarType.warning)
          .build(context),
    );
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

  void toCustomerService() async {
    await launchUrlString(
      "https://wa.me/6288287112431",
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }
}
