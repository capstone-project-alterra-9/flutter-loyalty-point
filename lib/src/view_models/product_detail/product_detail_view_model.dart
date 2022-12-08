import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/product/product_model.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_model.dart';
import 'package:flutter_loyalty_point/src/models/user/response_get_user_model.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_payment_helper.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_detail_helper.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_status_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/views/payment/payment_view.dart';
import 'package:flutter_loyalty_point/src/views/transaction_status/transaction_status_view.dart';

class ProductDetailViewModel extends ChangeNotifier {
  ProductDetailViewModel(this.context, {required this.args}) {
    _initialize();
  }

  final BuildContext context;

  final ArgsProductDetailHelper args;

  void _initialize() {
    _setProduct();
  }

  bool disabledCreateTransaction = true;

  ViewStateType _productState = ViewStateType.loading;
  ViewStateType get productState => _productState;
  void _changeProductState(ViewStateType state) {
    _productState = state;
    notifyListeners();
  }

  ProductModel? get product => _product;
  ProductModel? _product;
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

      _checkUserCanCreateTransaction();

      _changeProductState(ViewStateType.none);
    } catch (e) {
      _changeProductState(ViewStateType.error);
      rethrow;
    }
  }

  void _checkUserCanCreateTransaction() async {
    if (args.purchaseType == PurchaseType.buy) {
      disabledCreateTransaction = false;
      return;
    }

    try {
      final String data = await rootBundle.loadString(
        'assets/json/dummy_data_response_get_user.json',
      );

      ResponseGetUserModel result = ResponseGetUserModel.fromJson(
        jsonDecode(data),
      );

      if (result.data?.point != null && product?.price != null) {
        if (result.data!.point! >= product!.price!) {
          disabledCreateTransaction = false;
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  void createTransaction() {
    if (args.purchaseType == PurchaseType.redeem) {
      Navigator.pushNamed(
        context,
        TransactionStatusView.routeName,
        arguments: const ArgsTransactionStatusHelper(isSuccess: true),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      PaymentView.routeName,
      arguments: ArgsPaymentHelper(product: product!),
    );
  }
}
