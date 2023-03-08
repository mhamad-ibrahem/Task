class UpdateUserModel {
  UpdateUserModel({
    required this.name,
    required this.countryCode,
    required this.phone,
    required this.email,
  });
  String name;
  String countryCode;
  String phone;
  String email;

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
        name: json["name"],
        countryCode: json["country_code"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "country_code": countryCode,
        "phone": phone,
        "email": email,
      };

      
}
