import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../models/user/response_get_user_model.dart';
import '../../models/user/user_model.dart';
import '../../services/api/users_api_service.dart';
import '../../utils/types/view_state_type.dart';
import 'package:flutter/material.dart';

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
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Styles.colorBlack400),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HeroIcon(
            HeroIcons.informationCircle,
            style: HeroIconStyle.solid,
            color: Color(0xffEE9D2B),
            size: 20,
          ),
          const SizedBox(
            width: 12,
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Service not available",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Styles.colorBlack300),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Sorry, the service you selected is currently under development",
                  style: GoogleFonts.poppins(
                      fontSize: 10, color: Styles.colorBlack300),
                ),
              ],
            ),
          ),
          InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.close,
                  size: 13,
                ),
              )),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 252, 240),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
