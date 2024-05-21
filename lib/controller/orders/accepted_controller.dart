import 'package:get/get.dart';
import 'package:matgary_delivery/core/class/statuse_request.dart';
import 'package:matgary_delivery/core/functions/handling_data.dart';
import 'package:matgary_delivery/core/services/my_services.dart';
import 'package:matgary_delivery/data/datasource/remote/orders/accepted_order_data.dart';
import 'package:matgary_delivery/data/models/orders/order_model.dart';

import '../../core/constant/routes.dart';

abstract class AcceptedController extends GetxController {
  //? get all delivery Accepted orders
  getAcceptedOrders();
  //? order is deliver successfuly
  doneOrder(String orderId, String userId);
  goToOrderDetails(OrdersModel model);
  //? refresh data
  onRefresh();
}

class AcceptedControllerImp extends AcceptedController {
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final MyServices _myServices = Get.find();
  final AcceptedOrderData _acceptedData =
      AcceptedOrderData(crudImp: Get.find());
  List<OrdersModel> orders = [];

  @override
  getAcceptedOrders() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _acceptedData.getData(
        deliveryId: _myServices.sharedPreferences.getString('id')!);
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
  doneOrder(String orderId, String userId) async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _acceptedData.doneData(
      orderId: orderId,
      userId: userId,
    );
    statuseRequest = handlingData(response);

    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        onRefresh();
        Get.snackbar('Done', 'Your Order Is Deliver Successfully.');
      } else {
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  goToOrderDetails(OrdersModel model) {
    Get.toNamed(AppRoutes.orderDetailsScreen, arguments: {
      'ordermodel': model,
    });
  }

  @override
  void onInit() {
    getAcceptedOrders();
    super.onInit();
  }

  @override
  onRefresh() async {
    orders.clear();
    await getAcceptedOrders();
  }
}
