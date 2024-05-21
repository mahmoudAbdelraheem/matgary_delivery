import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary_delivery/controller/home_controller.dart';
import 'package:matgary_delivery/core/constant/app_colors.dart';
import 'package:matgary_delivery/view/widget/home/custom_button_app_bar.dart';

class CustomButtomNavBar extends StatelessWidget {
  const CustomButtomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => BottomAppBar(
        color: AppColors.myBlue.withOpacity(0.5),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
              controller.pageList.length,
              (index) {
                return CustomButtonAppBar(
                  onPressed: () {
                    controller.changePage(index);
                  },
                  icon: controller.navBarData[index]['icon'],
                  title: controller.navBarData[index]['title'],
                  isActive: controller.pageIndex == index ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
