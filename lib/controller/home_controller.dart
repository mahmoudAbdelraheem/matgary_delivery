import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary_delivery/view/screen/orders/accepted_screen.dart';
import 'package:matgary_delivery/view/screen/orders/pending_screen.dart';

abstract class HomeController extends GetxController {
  changePage(int index);
}

class HomeControllerImp extends HomeController {
  //? current page index
  int pageIndex = 0;

  //? nav bar botton and title
  final List navBarData = [
    {
      'title': "Pending",
      'icon': Icons.assessment_outlined,
    },
    {
      'title': "Accepted",
      'icon': Icons.checklist_rtl_sharp,
    },
    {
      'title': "Setting",
      'icon': Icons.settings_outlined,
    },
  ];
  //? list for button bar screen
  List<Widget> pageList = [
    const PendingScreen(),
    const AcceptedScreen(),
    const Center(child: Text('Setting')),
    //? setting page
  ];

  @override
  changePage(int index) {
    pageIndex = index;
    update();
  }
}
