class UserModel {
  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.point,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
