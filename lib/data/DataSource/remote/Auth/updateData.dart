import '../../../../Core/classes/Crud.dart';
import '../../../../Core/constant/ApiLinks.dart';

class UpdateData {
  Crud crud;
  UpdateData(this.crud);

  updateData(
    String name,
    String email,
    String phone,
    String countryCode,
  ) async {
    var response = await crud.postData(AppLinks.loginLink, {
      "name": name,
      'email': email,
      'phone': phone,
      "country_code": countryCode
    }, {});
    return response.fold((l) => l, (r) => r);
  }
}
