import 'package:matgary_delivery/apis_link.dart';
import 'package:matgary_delivery/core/class/crud.dart';

class ApproveOrderData {
  final CrudImp crudImp;

  ApproveOrderData({required this.crudImp});

  //? approve order
  approveData({
    required String orderId,
    required String userId,
    required String deliveryId,
  }) async {
    var response = await crudImp.postData(ApiLink.approveOrder, {
      'orderid': orderId,
      'userid': userId,
      'deliveryid': deliveryId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
//? 0 => pending approval ,
//? 1 => order approve and prepare,
//? 2 => on delivery order ,
//? 3 => archive order and ,
//? 4 => canceld order ,
