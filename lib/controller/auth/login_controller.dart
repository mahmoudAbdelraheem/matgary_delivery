import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary_delivery/core/class/statuse_request.dart';
import 'package:matgary_delivery/core/constant/routes.dart';
import 'package:matgary_delivery/core/functions/defualt_alert_dialog.dart';
import 'package:matgary_delivery/core/functions/handling_data.dart';
import 'package:matgary_delivery/core/services/my_services.dart';
import 'package:matgary_delivery/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LoginController extends GetxController {
  //? login and go to the home screen
  login();
  //? go to forget password screen
  goToforgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> loginFormState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isPasswordShow = true;

  final MyServices _myServices = Get.find();

  StatuseRequest statuseRequest = StatuseRequest.defualt;
  LoginData loginData = LoginData(crudImp: Get.find());

  tryAgain() {
    statuseRequest = StatuseRequest.defualt;
    update();
  }

//? for show password and change icon
  showPassword() {
    isPasswordShow = isPasswordShow == true ? false : true;
    update();
  }

  @override
  login() async {
    if (loginFormState.currentState!.validate()) {
      //? loading
      statuseRequest = StatuseRequest.loading;
      update(); //? update to refresh loading ui
      //? check user data
      var response = await loginData.checkData(
        email: email.text,
        password: password.text,
      );
      print("login response = $response");
      //? check response
      statuseRequest = handlingData(response);
      if (statuseRequest == StatuseRequest.success) {
        if (response['status'] == 'success') {
          if (response['data']['delivery_approve'] == '1') {
            //? save user data in cache
            _myServices.sharedPreferences
                .setString("id", response['data']['delivery_id']);
            String userId = _myServices.sharedPreferences.getString("id")!;
            _myServices.sharedPreferences
                .setString("name", response['data']['delivery_name']);
            _myServices.sharedPreferences
                .setString("email", response['data']['delivery_email']);
            _myServices.sharedPreferences
                .setString("phone", response['data']['delivery_phone']);
            _myServices.sharedPreferences.setString("step", '2');
            //? login success and go to home page
            //? end notification to all users that subscribe to topic users
            FirebaseMessaging.instance.subscribeToTopic('delivery');
            FirebaseMessaging.instance.subscribeToTopic('delivery$userId');
            Get.offAllNamed(AppRoutes.homeScreen);
          } else {
            Get.offNamed(
              AppRoutes.vrefiyEmailCodeScreen,
              arguments: {
                'email': email.text,
                'code': '1', //? to send new vreficiation code to user email
              },
            );
          }
        } else {
          defualtAlertDialog(
            'Warring',
            'Email Or Password Not Correct.',
          );
        }
      }
      update();
    }
  }

  @override
  goToforgetPassword() {
    Get.toNamed(AppRoutes.forgetPasswordScreen);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print('firebase token is = $token');
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
