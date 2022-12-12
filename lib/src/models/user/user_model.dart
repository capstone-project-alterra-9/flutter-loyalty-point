class UserModel {
  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.points,
    required this.costPoints,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["ID"],
      username: json["username"],
      email: json["email"],
      points: json["points"],
      costPoints: json["costPoints"],
    );
  }

  final String? id;
  final String? username;
  final String? email;
  final int? points;
  final int? costPoints;
}
