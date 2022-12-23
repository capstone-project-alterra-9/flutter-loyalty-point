import 'product_model.dart';

class ResponseGetProductListModel {
  const ResponseGetProductListModel({
    required this.message,
    required this.data,
  });

  factory ResponseGetProductListModel.fromJson(Map<String, dynamic> json) {
    return ResponseGetProductListModel(
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<ProductModel>.from(
              json["data"].map((x) => ProductModel.fromJson(x)),
            ),
    );
  }

  final String? message;
  final List<ProductModel>? data;
}
