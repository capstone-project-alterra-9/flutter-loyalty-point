import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/product/product_model.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_list_model.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_detail_helper.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_list_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/views/product_detail/product_detail_view.dart';

class ProductListViewModel extends ChangeNotifier {
  ProductListViewModel(this.context, {required this.args}) {
    _initialize();
  }

  final BuildContext context;

  final ArgsProductListHelper args;

  void _initialize() {
    _setProductList();
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

  void tapProduct(String productId) {
    args.productId = productId;

    notifyListeners();
  }

  void toReedemProductDetail(ArgsProductDetailHelper args) =>
      Navigator.pushNamed(
        context,
        ProductDetailView.routeName,
        arguments: args,
      );
}
