import 'dart:convert';

UserResponeModel userModelFromJson(String str) => UserResponeModel.fromJson(json.decode(str));

String userModelToJson(UserResponeModel data) => json.encode(data.toJson());

class UserResponeModel {
  UserResponeModel({
    required this.password,
    required this.confirmPassword,
    required this.id,
    required this.name,
    required this.countryCode,
    required this.phone,
    required this.email,
    required this.token,
    required this.tokenExpiry,
  });

  String id;
  String password;
  String confirmPassword;
  String name;
  String countryCode;
  String phone;
  String email;
  String token;
  DateTime tokenExpiry;

  factory UserResponeModel.fromJson(Map<String, dynamic> json) => UserResponeModel(
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        phone: json["phone"],
        email: json["email"],
        token: json["token"],
        confirmPassword: json["password_confirm"],
        password: json["password"],
        tokenExpiry: DateTime.parse(json["token_expiry"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_code": countryCode,
        "phone": phone,
        "email": email,
        "token": token,
        "password_confirm": confirmPassword,
        "password": password,
        "token_expiry": tokenExpiry.toIso8601String(),
      };
}
