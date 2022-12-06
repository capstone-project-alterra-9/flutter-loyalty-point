import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/product/product_model.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_list_model.dart';
import 'package:flutter_loyalty_point/src/models/user/response_get_user_model.dart';
import 'package:flutter_loyalty_point/src/models/user/user_model.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_list_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/views/product_list/product_list_view.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this.context) {
    _initialize();
  }

  final BuildContext context;

  void _initialize() {
    _setUser();
    _setProductList();
    _setRedeemList();
  }

  ViewStateType _userState = ViewStateType.loading;
  ViewStateType get userState => _userState;
  void _changeUserState(ViewStateType state) {
    _userState = state;
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

  ViewStateType _productListState = ViewStateType.loading;
  ViewStateType get productListState => _productListState;
  void _changeProductListState(ViewStateType state) {
    _productListState = state;
    notifyListeners();
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

  ViewStateType _redeemListState = ViewStateType.loading;
  ViewStateType get redeemListState => _redeemListState;
  void _changeRedeemListState(ViewStateType state) {
    _redeemListState = state;
    notifyListeners();
  }

  final List<ProductModel> _redeemList = [];
  List<ProductModel> get redeemList => _redeemList;
  void _setRedeemList() async {
    _changeRedeemListState(ViewStateType.loading);

    try {
      final String data = await rootBundle.loadString(
        'assets/json/dummy_data_response_get_product_list.json',
      );

      ResponseGetProductListModel result = ResponseGetProductListModel.fromJson(
        jsonDecode(data),
      );

      redeemList.clear();
      if (result.data != null) {
        redeemList.addAll(result.data!);
      }

      _changeRedeemListState(ViewStateType.none);
    } catch (e) {
      _changeRedeemListState(ViewStateType.error);
      rethrow;
    }
  }

  void toProductList(ArgsProductListHelper args) => Navigator.pushNamed(
        context,
        ProductListView.routeName,
        arguments: args,
      );
}
