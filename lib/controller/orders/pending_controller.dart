import 'package:get/get.dart';
import 'package:matgary_delivery/core/class/statuse_request.dart';
import 'package:matgary_delivery/core/constant/routes.dart';
import 'package:matgary_delivery/core/functions/handling_data.dart';
import 'package:matgary_delivery/core/services/my_services.dart';
import 'package:matgary_delivery/data/datasource/remote/orders/approve_order_data.dart';
import 'package:matgary_delivery/data/datasource/remote/orders/pending_order_data.dart';
import 'package:matgary_delivery/data/models/orders/order_model.dart';

abstract class PendingController extends GetxController {
  //? get all user pending orders
  getPendingOrders();
  //? refresh orders data when send notification and user in pending order
  onRefresh();
  //? go to details screen
  goToOrderDetails(OrdersModel model);
  //? approve on user Order
  approveOrder(String userId, String orderId);
}

class PendingControllerImp extends PendingController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final MyServices _myServices = Get.find();
  final PendingOrderData _pendingData = PendingOrderData(crudImp: Get.find());
  final ApproveOrderData _approveData = ApproveOrderData(crudImp: Get.find());
  List<OrdersModel> orders = [];

  @override
  getPendingOrders() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _pendingData.getData();
    statuseRequest = handlingData(response);

    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        orders.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
        orders = orders.reversed.toList();
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  approveOrder(String userId, String orderId) async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _approveData.approveData(
      deliveryId: _myServices.sharedPreferences.getString('id')!,
      orderId: orderId,
      userId: userId,
    );
    statuseRequest = handlingData(response);

    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        orders.removeWhere((order) => order.orderId! == orderId);
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  onRefresh() async {
    orders.clear();
    await getPendingOrders();
  }

  @override
  goToOrderDetails(OrdersModel model) {
    Get.toNamed(AppRoutes.orderDetailsScreen, arguments: {
      'ordermodel': model,
    });
  }

  @override
  void onInit() {
    getPendingOrders();
    super.onInit();
  }
}
