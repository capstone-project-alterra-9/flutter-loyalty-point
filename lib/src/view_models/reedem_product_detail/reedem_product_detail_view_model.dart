import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/product/product_model.dart';
import '../../models/product/response_get_product_model.dart';
import '../../utils/helper/args_reedem_product_detail_helper.dart';
import '../../utils/types/view_state_type.dart';

class ReedemProductDetailViewModel extends ChangeNotifier {
  ReedemProductDetailViewModel(this.context, {required this.args}) {
    _initialize();
  }

  final BuildContext context;

  final ArgsReedemProductDetailHelper args;

  void _initialize() {
    _setProduct();
  }

  ProductModel? get product => _product;
  ProductModel? _product;

  ViewStateType get productState => _productState;
  ViewStateType _productState = ViewStateType.loading;

  void _changeProductState(ViewStateType state) {
    _productState = state;
    notifyListeners();
  }

  void _setProduct() async {
    _changeProductState(ViewStateType.loading);

    try {
      final String data = await rootBundle.loadString(
        'assets/json/dummy_data_response_get_product.json',
      );

      ResponseGetProductModel result = ResponseGetProductModel.fromJson(
        jsonDecode(data),
      );

      _product = result.data;

      _changeProductState(ViewStateType.none);
    } catch (e) {
      _changeProductState(ViewStateType.error);
      rethrow;
    }
  }
}
