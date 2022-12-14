class ResponseCreateTransactionModel {
  ResponseCreateTransactionModel({
    required this.message,
    required this.status,
  });

  factory ResponseCreateTransactionModel.fromJson(Map<String, dynamic> json) {
    return ResponseCreateTransactionModel(
      message: json["message"],
      status: json["data"]?["status"] == "success" ? true : false,
    );
  }

  final String? message;
  final bool? status;
}
