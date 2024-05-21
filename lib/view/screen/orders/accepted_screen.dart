import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary_delivery/controller/orders/accepted_controller.dart';
import 'package:matgary_delivery/core/class/handling_data_view.dart';
import 'package:matgary_delivery/view/widget/orders/custom_order_card_widget.dart';

class AcceptedScreen extends StatelessWidget {
  const AcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedControllerImp());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GetBuilder<AcceptedControllerImp>(
        builder: (controller) => RefreshIndicator(
          onRefresh: () {
            return controller.onRefresh();
          },
          child: HandlingDataView(
            statuseRequest: controller.statuseRequest,
            myPressed: () {
              controller.onRefresh();
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.orders.length,
              itemBuilder: (_, index) => CustomOrderCardWidget(
                order: controller.orders[index],
                isDone: true,
                onDetails: () {
                  controller.goToOrderDetails(controller.orders[index]);
                },
                onDone: () {
                  controller.doneOrder(
                    controller.orders[index].orderId!,
                    controller.orders[index].orderUserId!,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
