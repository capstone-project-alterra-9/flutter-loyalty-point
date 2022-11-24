import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/product/product_model.dart';
import '../../models/product/response_get_product_list_model.dart';
import '../../utils/types/view_state_type.dart';

class ReedemViewModel extends ChangeNotifier {
  ReedemViewModel(this.context, {required this.categoryProduct}) {
    _initialize();
  }

  final BuildContext context;

  final String categoryProduct;

  void _initialize() {
    _setProductList();
  }

  List<ProductModel> get productList => _productList;
  final List<ProductModel> _productList = [];

  ViewStateType get productListState => _productListState;
  ViewStateType _productListState = ViewStateType.loading;

  void _changeProductListState(ViewStateType state) {
    _productListState = state;
    notifyListeners();
  }

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
      productList.addAll(result.data);

      _changeProductListState(ViewStateType.none);
    } catch (e) {
      _changeProductListState(ViewStateType.error);
      rethrow;
    }
  }
}
