
import 'package:task/data/model/LoginModel.dart';
import '../../../../Core/classes/Crud.dart';
import '../../../../Core/constant/ApiLinks.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(LoginModel loginModel) async {
    var response = await crud.postData(AppLinks.loginLink, loginModel.toJson(),{});
    return response.fold((l) => l, (r) => r);
  }
}
