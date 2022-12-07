class ResponseLoginModel {
  const ResponseLoginModel({required this.message, required this.data});

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) {
    return ResponseLoginModel(
      message: json['message'],
      data: DataModel.fromJson(json['data']),
    );
  }

  final String? message;
  final DataModel? data;
}

class DataModel {
  const DataModel({
    required this.username,
    required this.email,
    required this.password,
    required this.token,
    required this.refreshToken,
    required this.account,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
      refreshToken: json['refreshToken'],
      account: json['account'],
    );
  }

  final String? username;
  final String? email;
  final String? password;
  final String? token;
  final String? refreshToken;
  final String? account;
}
