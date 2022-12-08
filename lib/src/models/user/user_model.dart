class UserModel {
  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.point,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["ID"],
      username: json["username"],
      email: json["email"],
      point: json["point"],
    );
  }

  final String? id;
  final String? username;
  final String? email;
  final int? point;
}
