
import 'package:task/data/model/LoginModel.dart';
import '../../../../Core/classes/Crud.dart';
import '../../../../Core/constant/ApiLinks.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
//this class have the funcation that contain haider and body and link url for login
  postData(LoginModel loginModel) async {
    var response = await crud.postData(AppLinks.loginLink, loginModel.toJson(),{});
    return response.fold((l) => l, (r) => r);
  }
}
