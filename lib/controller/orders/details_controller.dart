import 'package:get/get.dart';
import 'package:matgary_delivery/core/class/statuse_request.dart';
import 'package:matgary_delivery/data/models/orders/order_model.dart';
import 'package:matgary_delivery/data/models/orders/orders_details_model.dart';

import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/orders/details_order_data.dart';

abstract class OrderDetailsController extends GetxController {
  intializeData();
  getOrderDetails();
}

class OrderDetailsControllerImp extends OrderDetailsController {
  //? for pending order
  late OrdersModel order;
  //?
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final DetailsOrderData _detailsData = DetailsOrderData(crudImp: Get.find());
  List<OrdersDetailsModel> orderDetails = [];

  @override
  getOrderDetails() async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _detailsData.getData(cartOrderId: order.orderId!);
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        List detailsData = response['data'];
        orderDetails
            .addAll(detailsData.map((e) => OrdersDetailsModel.fromJson(e)));
      }
    }
    update();
  }

  @override
  intializeData() {
    order = Get.arguments['ordermodel'] as OrdersModel;
    getOrderDetails();
  }

  @override
  void onInit() async {
    await intializeData();
    super.onInit();
  }
}
