import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary_delivery/controller/auth/forget_password/success_reset_pass_controller.dart';
import 'package:matgary_delivery/core/constant/app_colors.dart';
import 'package:matgary_delivery/core/constant/localizaion_keys.dart';
import 'package:matgary_delivery/core/shared/custom_app_botton.dart';
import 'package:matgary_delivery/view/widget/auth/custom_app_bar_widget.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPassControllerImp controller =
        Get.put(SuccessResetPassControllerImp());
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      appBar: const CustomAppBarWidget(title: 'Congratulations'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: AppColors.myBlue,
              size: 200,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomAppBotton(
                btnText: LocalizationKeys.signIn,
                btnColor: AppColors.myBlue,
                textColor: AppColors.myWhite,
                myPressed: () {
                  controller.goToLoginScreen();
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
