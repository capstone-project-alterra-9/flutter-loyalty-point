class ResponseCreateMidtransTransactionModel {
  ResponseCreateMidtransTransactionModel({
    required this.message,
    required this.data,
  });

  factory ResponseCreateMidtransTransactionModel.fromJson(
      Map<String, dynamic> json) {
    return ResponseCreateMidtransTransactionModel(
      message: json["message"],
      data: Data.fromJson(json["data"]),
    );
  }

  final String? message;
  final Data? data;
}

class Data {
  Data({required this.token, required this.directUrl});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json["token"],
      directUrl: json["directUrl"],
    );
  }

  final String? token;
  final String? directUrl;
}
