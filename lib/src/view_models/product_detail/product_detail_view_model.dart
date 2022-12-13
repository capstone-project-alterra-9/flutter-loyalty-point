import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/product/product_model.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_model.dart';
import 'package:flutter_loyalty_point/src/models/response_error_model.dart';
import 'package:flutter_loyalty_point/src/models/transaction/data_request_add_transaction.dart';
import 'package:flutter_loyalty_point/src/models/transaction/response_create_transaction_model.dart';
import 'package:flutter_loyalty_point/src/models/user/response_get_user_model.dart';
import 'package:flutter_loyalty_point/src/services/api/products_api_service.dart';
import 'package:flutter_loyalty_point/src/services/api/transactions_api_service.dart';
import 'package:flutter_loyalty_point/src/services/api/users_api_service.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_payment_helper.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_detail_helper.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_transaction_status_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';
import 'package:flutter_loyalty_point/src/views/payment/payment_view.dart';
import 'package:flutter_loyalty_point/src/views/transaction_status/transaction_status_view.dart';

class ProductDetailViewModel extends ChangeNotifier {
  ProductDetailViewModel(this.context, {required this.args}) {
    _initialize();
  }

  final BuildContext context;

  final ArgsProductDetailHelper args;

  void _initialize() async {
    await _setProduct();
    await _checkIsUserPointsEnough();
  }

  bool _createTransactionButtonDisabled = true;
  bool get createTransactionButtonDisabled {
    final int stock = product?.stock ?? 0;

    if (stock <= 0) {
      return true;
    }

    if (args.purchaseType == PurchaseType.buy) {
      return false;
    }

    return _createTransactionButtonDisabled;
  }

  ViewStateType _productState = ViewStateType.loading;
  ViewStateType get productState => _productState;
  void _changeProductState(ViewStateType state) {
    _productState = state;
    notifyListeners();
  }

  ProductModel? get product => _product;
  ProductModel? _product;
  Future<void> _setProduct() async {
    _changeProductState(ViewStateType.loading);

    try {
      final ResponseGetProductModel response =
          await ProductsAPIService().getProductById(
        productId: args.productId,
      );

      _product = response.data;

      _changeProductState(ViewStateType.none);
    } on DioError catch (e) {
      _changeProductState(ViewStateType.error);
      rethrow;
    }
  }

  ViewStateType _checkIsUserPointsEnoughState = ViewStateType.none;
  ViewStateType get checkIsUserPointsEnoughState =>
      _checkIsUserPointsEnoughState;
  void _changeCheckIsUserPointsEnoughState(ViewStateType state) {
    _checkIsUserPointsEnoughState = state;
    notifyListeners();
  }

  Future<void> _checkIsUserPointsEnough() async {
    _changeCheckIsUserPointsEnoughState(ViewStateType.loading);

    try {
      final ResponseGetUserModel response = await UsersAPIService().getUser();

      if (response.data?.points != null && product?.price != null) {
        if (response.data!.points! >= product!.price!) {
          _createTransactionButtonDisabled = false;
        }
      }

      _changeCheckIsUserPointsEnoughState(ViewStateType.none);
    } catch (e) {
      _changeCheckIsUserPointsEnoughState(ViewStateType.error);
      rethrow;
    }
  }

  ViewStateType _createTransactionState = ViewStateType.none;
  ViewStateType get createTransactionState => _createTransactionState;
  void _changeCreateTransactionState(ViewStateType state) {
    _createTransactionState = state;
    notifyListeners();
  }

  void createTransaction() async {
    final NavigatorState navigator = Navigator.of(context);
    _changeCreateTransactionState(ViewStateType.loading);

    try {
      if (args.purchaseType == PurchaseType.redeem) {
        final ResponseCreateTransactionModel response =
            await TransactionsAPIService().createTransaction(
          data: DataRequestAddTransaction(
            purchaseType: args.purchaseType,
            productId: args.productId,
            identifierNumber: args.identifierNumber,
          ),
        );

        navigator.pushNamed(
          TransactionStatusView.routeName,
          arguments: ArgsTransactionStatusHelper(
            isSuccess: response.status ?? false,
            purchaseType: args.purchaseType,
          ),
        );

        return;
      }

      navigator.pushNamed(
        PaymentView.routeName,
        arguments: ArgsPaymentHelper(product: product!),
      );

      _changeCreateTransactionState(ViewStateType.none);
    } on DioError catch (e) {
      if (e.response != null) {
        String message = ResponseErrorModel.fromJson(e.response!.data).message;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }

      Timer(
        const Duration(seconds: 2),
        () => navigator.pushNamedAndRemoveUntil(
          HomeView.routeName,
          (route) => false,
        ),
      );

      _changeCreateTransactionState(ViewStateType.error);
    }
  }
}
