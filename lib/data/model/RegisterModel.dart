class RegisterModel {
  RegisterModel({
    required this.password,
    required this.confirmPassword,
    required this.name,
    required this.countryCode,
    required this.phone,
    required this.email,
  });

  String password;
  String confirmPassword;
  String name;
  String countryCode;
  String phone;
  String email;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        countryCode: json["country_code"],
        phone: json["phone"],
        email: json["email"],
        confirmPassword: json["password_confirm"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "country_code": countryCode,
        "phone": phone,
        "email": email,
        "password_confirm": confirmPassword,
        "password": password,
      };

      
}
