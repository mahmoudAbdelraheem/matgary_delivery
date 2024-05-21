import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary_delivery/controller/home_controller.dart';
import 'package:matgary_delivery/core/constant/app_colors.dart';
import 'package:matgary_delivery/view/widget/home/custom_buttom_nav_bar.dart';
import '../../core/functions/exit_app_alert.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.myWhite,
        appBar: AppBar(
          title: const Text('Matgary Orders'),
        ),
        //? custom buttom navegation bar
        bottomNavigationBar: const CustomButtomNavBar(),
        //? selected page
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if (didPop) {
              return;
            } else {
              exitAppAlert();
            }
          },
          child: controller.pageList.elementAt(controller.pageIndex),
        ),
      ),
    );
  }
}
