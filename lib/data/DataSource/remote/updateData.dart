
import 'package:task/data/model/UpdateUserModel.dart';
import '../../../Core/classes/Crud.dart';
import '../../../Core/constant/ApiLinks.dart';

class UpdateData {
  Crud crud;
  UpdateData(this.crud);
//this class have the funcation that contain haider and body and link url for update user informaion
  updateData(
    UpdateUserModel model,
    String token,
  ) async {
    var response = await crud.postData(AppLinks.updateLink, model.toJson(),
        {"Accept": "application/json", "Authorization": 'Bearer $token'});
    return response.fold((l) => l, (r) => r);
  }
}
