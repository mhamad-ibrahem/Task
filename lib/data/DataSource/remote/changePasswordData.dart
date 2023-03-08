import 'package:task/data/model/ChangePasswordModel.dart';
import '../../../../Core/classes/Crud.dart';
import '../../../../Core/constant/ApiLinks.dart';

class ChangePasswordData {
  Crud crud;
  ChangePasswordData(this.crud);
//this class have the funcation that contain haider and body and link url for change password
  changePasswordData(
    ChangePasswordModel model,
    String token,
  ) async {
    var response = await crud.postData(
        AppLinks.changePasswordLink,
        model.toJson(),
        {"Accept": "application/json", "Authorization": 'Bearer $token'});
    return response.fold((l) => l, (r) => r);
  }
}
