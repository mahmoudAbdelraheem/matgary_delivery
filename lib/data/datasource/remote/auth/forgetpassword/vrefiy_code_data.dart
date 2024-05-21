import 'package:matgary_delivery/apis_link.dart';
import 'package:matgary_delivery/core/class/crud.dart';

class VrefiyPassCodeData {
  final CrudImp crudImp;
  VrefiyPassCodeData({required this.crudImp});

  checkData({required String email, required String vrefiyCode}) async {
    var response = await crudImp.postData(ApiLink.vrefiyCodePass, {
      'email': email,
      'vrefiycode': vrefiyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
