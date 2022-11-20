class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.namaUser,
    required this.totalPoin,
  });

  String id;
  String username;
  String email;
  String namaUser;
  String totalPoin;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        namaUser: json["nama_user"],
        totalPoin: json["total_poin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "nama_user": namaUser,
        "total_poin": totalPoin,
      };
}

// {
//         "id":"",
//         "username":"",
//         "email":"",
//         "nama_user":"",
//         "total_poin":""
// }
