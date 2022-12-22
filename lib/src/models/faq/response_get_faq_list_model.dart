import 'package:flutter_loyalty_point/src/models/faq/faq_model.dart';

class ResponseGetFAQListModel {
  const ResponseGetFAQListModel({
    required this.message,
    required this.data,
  });

  factory ResponseGetFAQListModel.fromJson(Map<String, dynamic> json) {
    return ResponseGetFAQListModel(
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<FaqModel>.from(
              json["data"].map((x) => FaqModel.fromJson(x)),
            ),
    );
  }

  final String? message;
  final List<FaqModel> data;
}
