class LoginModel {
  String email;
  String password;
  LoginModel({
    required this.password,
    required this.email,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
      );
  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
