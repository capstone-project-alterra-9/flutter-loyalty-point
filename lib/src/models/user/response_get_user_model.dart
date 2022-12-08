import 'user_model.dart';

class ResponseGetUserModel {
  const ResponseGetUserModel({required this.message, required this.data});

  factory ResponseGetUserModel.fromJson(Map<String, dynamic> json) {
    return ResponseGetUserModel(
      message: json["message"],
      data: UserModel.fromJson(json['data']),
    );
  }

  final String? message;
  final UserModel? data;
}
