import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/product/product_model.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_list_model.dart';
import 'package:flutter_loyalty_point/src/models/user/response_get_user_model.dart';
import 'package:flutter_loyalty_point/src/models/user/user_model.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_reedem_product_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/views/history/history_view.dart';
import 'package:flutter_loyalty_point/src/views/reedem/reedem_view.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this.context) {
    _initialize();
  }

  final BuildContext context;

  void _initialize() {
    _setUser();
    _setProductList();
  }

  ViewStateType _userState = ViewStateType.loading;
  ViewStateType get userState => _userState;
  void _changeUserState(ViewStateType state) {
    _userState = state;
    notifyListeners();
  }

  ViewStateType _productListState = ViewStateType.loading;
  ViewStateType get productListState => _productListState;
  void _changeProductListState(ViewStateType state) {
    _productListState = state;
    notifyListeners();
  }

  UserModel? _user;
  UserModel? get user => _user;
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

  final List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;
  void _setProductList() async {
    _changeProductListState(ViewStateType.loading);

    try {
      final String data = await rootBundle.loadString(
        'assets/json/dummy_data_response_get_product_list.json',
      );

      ResponseGetProductListModel result = ResponseGetProductListModel.fromJson(
        jsonDecode(data),
      );

      productList.clear();
      if (result.data != null) {
        productList.addAll(result.data!);
      }

      _changeProductListState(ViewStateType.none);
    } catch (e) {
      _changeProductListState(ViewStateType.error);
      rethrow;
    }
  }

  void toReedem(ArgsReedemProductHelper args) => Navigator.pushNamed(
        context,
        ReedemView.routeName,
        arguments: args,
      );

  void toHistory() => Navigator.pushNamed(context, HistoryView.routeName);

  void toReedemProduct(ArgsReedemProductHelper args) => Navigator.pushNamed(
        context,
        ReedemView.routeName,
        arguments: args,
      );
}
