class ResponseErrorModel {
  const ResponseErrorModel({required this.message, required this.errors});

  factory ResponseErrorModel.fromJson(Map<String, dynamic> json) {
    return ResponseErrorModel(
      message: json['message'],
      errors: json['errors'],
    );
  }

  final String message;
  final String errors;
}
