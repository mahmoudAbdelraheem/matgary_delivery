import 'package:matgary_delivery/apis_link.dart';
import 'package:matgary_delivery/core/class/crud.dart';

class ArchiveOrderData {
  final CrudImp crudImp;

  ArchiveOrderData({required this.crudImp});

  //? get all archived orders
  getData({required String deliveryId}) async {
    var response =
        await crudImp.postData(ApiLink.archiveOrder, {'id': deliveryId});
    return response.fold((l) => l, (r) => r);
  }
}
//? 0 => pending approval , 
//? 1 => order approve and prepare, 
//? 2 => on delivery order , 
//? 3 => archive order and , 
//? 4 => canceld order ,