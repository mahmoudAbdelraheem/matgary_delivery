import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary_delivery/controller/orders/pending_controller.dart';
import 'package:matgary_delivery/core/class/handling_data_view.dart';
import 'package:matgary_delivery/view/widget/orders/custom_order_card_widget.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingControllerImp());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GetBuilder<PendingControllerImp>(
        builder: (controller) => HandlingDataView(
          myPressed: () {
            controller.onRefresh();
          },
          statuseRequest: controller.statuseRequest,
          child: ListView.builder(
            itemCount: controller.orders.length,
            itemBuilder: (_, index) {
              return CustomOrderCardWidget(
                order: controller.orders[index],
                onDetails: () {
                  controller.goToOrderDetails(controller.orders[index]);
                },
                onApprove: () {
                  controller.approveOrder(
                    controller.orders[index].orderUserId!,
                    controller.orders[index].orderId!,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
