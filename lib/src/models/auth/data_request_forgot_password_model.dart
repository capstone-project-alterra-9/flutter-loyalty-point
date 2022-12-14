class DataRequestForgotPasswordModel {
  const DataRequestForgotPasswordModel({required this.email});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }

  final String email;
}
