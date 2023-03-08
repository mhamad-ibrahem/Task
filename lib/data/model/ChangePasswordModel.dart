class ChangePasswordModel {
  ChangePasswordModel({
    required this.password,
    required this.confirmPassword,
    required this.oldPassword,
  });

  String password;
  String confirmPassword;
  String oldPassword;

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
        oldPassword: json["current_password"],
        confirmPassword: json["password_confirm"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "current_password": oldPassword,
        "password_confirm": confirmPassword,
        "password": password,
      };
}
