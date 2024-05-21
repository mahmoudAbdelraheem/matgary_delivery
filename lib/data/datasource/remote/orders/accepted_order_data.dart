import 'package:matgary_delivery/apis_link.dart';
import 'package:matgary_delivery/core/class/crud.dart';

class AcceptedOrderData {
  final CrudImp crudImp;

  AcceptedOrderData({required this.crudImp});

  //? get all accepted orders
  getData({required String deliveryId}) async {
    var response =
        await crudImp.postData(ApiLink.acceptedOrder, {'id': deliveryId});
    return response.fold((l) => l, (r) => r);
  }

  doneData({required String orderId, required String userId}) async {
    var response = await crudImp.postData(ApiLink.doneOrder, {
      'orderid': orderId,
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
//? 0 => pending approval , 
//? 1 => order approve and prepare, 
//? 2 => on delivery order , 
//? 3 => archive order and , 
//? 4 => canceld order ,