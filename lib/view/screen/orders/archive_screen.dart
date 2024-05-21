import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary_delivery/controller/orders/archive_controller.dart';
import 'package:matgary_delivery/core/class/handling_data_view.dart';
import 'package:matgary_delivery/view/widget/orders/custom_order_card_widget.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text('Archive Orders')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<ArchiveControllerImp>(
          builder: (controller) => HandlingDataView(
            statuseRequest: controller.statuseRequest,
            myPressed: () {},
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.orders.length,
              itemBuilder: (context, index) => CustomOrderCardWidget(
                order: controller.orders[index],
                onDetails: () {
                  controller.goToOrderDetails(controller.orders[index]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
