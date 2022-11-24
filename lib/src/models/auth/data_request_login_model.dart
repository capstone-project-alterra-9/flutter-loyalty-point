class DataRequestLoginModel {
  const DataRequestLoginModel({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }

  final String username;
  final String password;
}
