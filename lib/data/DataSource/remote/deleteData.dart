import '../../../../Core/classes/Crud.dart';
import '../../../../Core/constant/ApiLinks.dart';

class DeleteData {
  Crud crud;
  DeleteData(this.crud);

  deleteData(
    String token,
  ) async {
    var response = await crud.deleteData(AppLinks.deleteLink,
        {"Accept": "application/json", "Authorization": 'Bearer $token'});
    return response.fold((l) => l, (r) => r);
  }
}
