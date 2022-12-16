import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_list_model.dart';
import 'package:flutter_loyalty_point/src/models/product/response_get_product_model.dart';
import 'package:flutter_loyalty_point/src/services/api/products_api_service.dart';
import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'products_api_service_test.mocks.dart';

@GenerateMocks([ProductsAPIService])
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final ProductsAPIService productsAPIService = MockProductsAPIService();

  group(
    "[GET PRODUCT LIST]",
    () {
      test(
        "Should be able to convert response to ResponseGetProductListModel",
        () async {
          when(
            productsAPIService.getProducts(
              path: Urls.getProductsByCategoryPathApi(
                CategoryProductType.credits,
              ),
            ),
          ).thenAnswer(
            (realInvocation) async {
              final String json = await rootBundle.loadString(
                'assets/json/dummy_data_response_get_product_list.json',
              );

              return ResponseGetProductListModel.fromJson(
                jsonDecode(json),
              );
            },
          );

          ResponseGetProductListModel response =
              await productsAPIService.getProducts(
            path: Urls.getProductsByCategoryPathApi(
              CategoryProductType.credits,
            ),
          );

          expect(response, isInstanceOf<ResponseGetProductListModel>());
        },
      );
    },
  );

  group(
    "[GET PRODUCT]",
    () {
      test(
        "Should be able to convert response to ResponseGetProductModel",
        () async {
          when(
            productsAPIService.getProductById(productId: "id"),
          ).thenAnswer(
            (realInvocation) async {
              final String json = await rootBundle.loadString(
                'assets/json/dummy_data_response_get_product.json',
              );

              return ResponseGetProductModel.fromJson(
                jsonDecode(json),
              );
            },
          );

          ResponseGetProductModel response =
              await productsAPIService.getProductById(productId: "id");

          expect(response, isInstanceOf<ResponseGetProductModel>());
        },
      );
    },
  );
}
