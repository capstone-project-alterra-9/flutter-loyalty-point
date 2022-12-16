class ResponseForgotPasswordModel {
  const ResponseForgotPasswordModel({
    required this.code,
    required this.message,
  });

  factory ResponseForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResponseForgotPasswordModel(
      code: json['code'],
      message: json['message'],
    );
  }

  final int? code;
  final String? message;
}
