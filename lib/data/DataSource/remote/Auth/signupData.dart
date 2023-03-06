import 'package:task/data/model/RegisterModel.dart';

import '../../../../Core/classes/Crud.dart';
import '../../../../Core/constant/ApiLinks.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(RegisterModel registerModel) async {
    var response =
        await crud.postData(AppLinks.signUpLink, registerModel.toJson(), {});
    return response.fold((l) => l, (r) => r);
  }
}
