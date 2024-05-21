import 'package:matgary_delivery/apis_link.dart';
import 'package:matgary_delivery/core/class/crud.dart';

class VrefiyEmailCodeData {
  final CrudImp crudImp;

  VrefiyEmailCodeData({required this.crudImp});

  postvrefiyCodeData({
    required String email,
    required String vrefiyCode,
  }) async {
    var response = await crudImp.postData(ApiLink.vrefiyCode, {
      'email': email,
      'vrefiycode': vrefiyCode,
    });
    return response.fold((failuer) => failuer, (correct) => correct);
  }

  resendVrefiyCode({
    required String email,
  }) async {
    var response = await crudImp.postData(ApiLink.resendVrefiyCode, {
      'email': email,
    });
    return response.fold((failuer) => failuer, (correct) => correct);
  }
}
