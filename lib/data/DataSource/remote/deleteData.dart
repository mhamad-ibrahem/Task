import '../../../../Core/classes/Crud.dart';
import '../../../../Core/constant/ApiLinks.dart';

class DeleteData {
  Crud crud;
  DeleteData(this.crud);
//this class have the funcation that contain haider and body and link url for delete account
  deleteData(
    String token,
  ) async {
    var response = await crud.deleteData(AppLinks.deleteLink,
        {"Accept": "application/json", "Authorization": 'Bearer $token'});
    return response.fold((l) => l, (r) => r);
  }
}
