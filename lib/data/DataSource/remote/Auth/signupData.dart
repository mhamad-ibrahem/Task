import 'package:task/data/model/RegisterModel.dart';

import '../../../../Core/classes/Crud.dart';
import '../../../../Core/constant/ApiLinks.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
//this class have the funcation that contain haider and body and link url for register
  postData(RegisterModel registerModel) async {
    var response =
        await crud.postData(AppLinks.signUpLink, registerModel.toJson(), {});
    return response.fold((l) => l, (r) => r);
  }
}
