import 'transaction_model.dart';

class ResponseGetTransactionListModel {
  const ResponseGetTransactionListModel({
    required this.message,
    required this.data,
  });

  factory ResponseGetTransactionListModel.fromJson(Map<String, dynamic> json) {
    return ResponseGetTransactionListModel(
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<TransactionModel>.from(
              json["data"].map((x) => TransactionModel.fromJson(x)),
            ),
    );
  }

  final String message;
  final List<TransactionModel> data;
}
