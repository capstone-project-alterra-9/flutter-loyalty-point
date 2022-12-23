import 'product_model.dart';

class ResponseGetProductModel {
  ResponseGetProductModel({required this.message, required this.data});

  factory ResponseGetProductModel.fromJson(Map<String, dynamic> json) {
    return ResponseGetProductModel(
      message: json["message"],
      data: ProductModel.fromJson(json['data']),
    );
  }

  final String? message;
  final ProductModel? data;
}
