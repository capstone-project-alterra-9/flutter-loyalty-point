class ResponseGetUserModel {
  const ResponseGetUserModel({required this.message, required this.data});

  factory ResponseGetUserModel.fromJson(Map<String, dynamic> json) {
    return ResponseGetUserModel(
      message: json["message"],
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
    required this.point,
    required this.status,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["ID"],
      username: json["username"],
      email: json["email"],
      point: json["point"],
      status: json["status"],
    );
  }

  final int id;
  final String username;
  final String email;
  final int point;
  final String status;
}
