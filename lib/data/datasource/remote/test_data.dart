import 'package:matgary_delivery/apis_link.dart';
import 'package:matgary_delivery/core/class/crud.dart';

class TestData {
  final CrudImp crudImp;

  TestData({required this.crudImp});
  getData() async {
    var response = await crudImp.postData(ApiLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
