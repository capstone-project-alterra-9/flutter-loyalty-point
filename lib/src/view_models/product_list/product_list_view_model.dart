import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/product/product_model.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_list_model.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_model.dart';
import 'package:flutter_loyalty_point/src/services/api/products_api_service.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_detail_helper.dart';
import 'package:flutter_loyalty_point/src/utils/helper/args_product_list_helper.dart';
import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';
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

  bool get nextButtonDisabled {
    if (args.productId != null) {
      int length = identifierNumber.length;

      switch (args.categoryProductType) {
        case CategoryProductType.credits:
          if (length >= 8 && length <= 12) return false;
          break;

        case CategoryProductType.dataQuota:
          if (length >= 8 && length <= 12) return false;
          break;

        case CategoryProductType.eMoney:
          if (length >= 10 && length <= 14) return false;
          break;

        default:
          if (length == 0) return false;
      }
    }

    return true;
  }

  String _identifierNumber = "";
  String get identifierNumber {
    if (args.categoryProductType == CategoryProductType.credits ||
        args.categoryProductType == CategoryProductType.dataQuota) {
      return "62$_identifierNumber";
    }

    return _identifierNumber;
  }

  set identifierNumber(String value) {
    _identifierNumber = value;
    notifyListeners();
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
      if (args.productId != null) {
        final ResponseGetProductModel response =
            await ProductsAPIService().getProductById(
          productId: args.productId!,
        );

        productList.addAll([response.data!]);
      } else {
        final ResponseGetProductListModel response =
            await ProductsAPIService().getProducts(
          path: Urls.getProductsByCategoryPathApi(args.categoryProductType),
        );

        productList.clear();
        if (response.data != null) {
          productList.addAll(response.data!);
        }
      }

      _changeProductListState(ViewStateType.none);
    } catch (e) {
      _changeProductListState(ViewStateType.error);
      rethrow;
    }
  }

  void tapProduct(String? productId) {
    args.productId = productId;
    notifyListeners();
  }

  void toReedemProductDetail() {
    Navigator.pushNamed(
      context,
      ProductDetailView.routeName,
      arguments: ArgsProductDetailHelper(
        productId: args.productId!,
        identifierNumber: identifierNumber,
        purchaseType: args.purchaseType,
      ),
    );
  }
}
