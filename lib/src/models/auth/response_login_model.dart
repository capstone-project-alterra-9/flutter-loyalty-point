class ResponseLoginModel {
  const ResponseLoginModel({required this.message, required this.data});

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) {
    return ResponseLoginModel(
      message: json['message'],
      data: DataModel.fromJson(json['data']),
    );
  }

  final String message;
  final DataModel data;
}

class DataModel {
  const DataModel({
    required this.username,
    required this.password,
    required this.token,
    required this.account,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      username: json['username'],
      password: json['password'],
      token: json['token'],
      account: json['account'],
    );
  }

  final String username;
  final String password;
  final String token;
  final String account;
}
