class ResponseRefreshTokenModel {
  ResponseRefreshTokenModel({
    required this.message,
    required this.data,
  });

  factory ResponseRefreshTokenModel.fromJson(Map<String, dynamic> json) {
    return ResponseRefreshTokenModel(
      message: json['message'],
      data: DataModel.fromJson(json['data']),
    );
  }

  final String? message;
  final DataModel? data;
}

class DataModel {
  DataModel({required this.token});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      token: json['token'],
    );
  }

  final String? token;
}
