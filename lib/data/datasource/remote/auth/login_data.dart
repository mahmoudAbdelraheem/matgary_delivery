import 'package:matgary_delivery/apis_link.dart';
import 'package:matgary_delivery/core/class/crud.dart';

class LoginData {
  final CrudImp crudImp;

  LoginData({required this.crudImp});

  checkData({
    required String email,
    required String password,
  }) async {
    var response = await crudImp.postData(ApiLink.login, {
      'email': email,
      'password': password,
    });
    return response.fold((failuer) => failuer, (correct) => correct);
  }
}
