import 'package:flutter/material.dart';

import 'core/constant/app_colors.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myBlue,
        title: const Text('test data'),
      ),
      body: Container(),
    );
  }
}
