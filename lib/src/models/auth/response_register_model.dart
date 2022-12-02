class ResponseRegisterModel {
  const ResponseRegisterModel({required this.message, required this.data});

  factory ResponseRegisterModel.fromJson(Map<String, dynamic> json) {
    return ResponseRegisterModel(
      message: json['message'],
      data: DataModel.fromJson(json['data']),
    );
  }

  final String message;
  final DataModel data;
}

class DataModel {
  const DataModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['ID'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  final String id;
  final String username;
  final String email;
  final String password;
}
