class RegisterModel {
  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
  });

  String name;
  String email;
  String password;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
