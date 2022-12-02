class DataRequestLoginModel {
  const DataRequestLoginModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

  final String email;
  final String password;
}
