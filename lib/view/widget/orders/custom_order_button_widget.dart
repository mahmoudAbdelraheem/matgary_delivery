import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CustomOrderButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomOrderButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: AppColors.myBlue,
      textColor: AppColors.myWhite,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
