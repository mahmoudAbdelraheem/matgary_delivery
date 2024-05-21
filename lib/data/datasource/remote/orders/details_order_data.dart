import 'package:matgary_delivery/apis_link.dart';
import 'package:matgary_delivery/core/class/crud.dart';

class DetailsOrderData {
  final CrudImp crudImp;

  DetailsOrderData({required this.crudImp});

  //? get all pending orders
  getData({required String cartOrderId}) async {
    var response = await crudImp.postData(ApiLink.detailsOrder, {
      'id': cartOrderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
//? 0 => pending approval , 
//? 1 => order approve and prepare, 
//? 2 => on delivery order , 
//? 3 => archive order and , 
//? 4 => canceld order ,