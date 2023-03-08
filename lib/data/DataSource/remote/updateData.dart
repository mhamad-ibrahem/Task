
import 'package:task/data/model/UpdateUserModel.dart';
import '../../../Core/classes/Crud.dart';
import '../../../Core/constant/ApiLinks.dart';

class UpdateData {
  Crud crud;
  UpdateData(this.crud);

  updateData(
    UpdateUserModel model,
    String token,
  ) async {
    var response = await crud.postData(AppLinks.updateLink, model.toJson(),
        {"Accept": "application/json", "Authorization": 'Bearer $token'});
    return response.fold((l) => l, (r) => r);
  }
}
