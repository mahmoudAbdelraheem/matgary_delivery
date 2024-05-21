import 'package:get/get.dart';

import 'core/constant/routes.dart';
import 'core/middleware/my_middleware.dart';
import 'view/screen/auth/forget_password/forget_password_screen.dart';
import 'view/screen/auth/forget_password/reset_password_screen.dart';
import 'view/screen/auth/forget_password/success_reset_password_screen.dart';
import 'view/screen/auth/forget_password/vrefiy_code_screen.dart';
import 'view/screen/auth/login_screen.dart';
import 'view/screen/auth/vrefiy_email_code_screen.dart';
import 'view/screen/choose_language_screen.dart';
import 'view/screen/home.dart';
import 'view/screen/on_boarding_screen.dart';
import 'view/screen/orders/archive_screen.dart';
import 'view/screen/orders/details_screen.dart';

List<GetPage<dynamic>> routes = [
  //! on boarding , choose language , auth screens
  GetPage(
    name: '/',
    page: () => const ChooseLanguageScreen(),
    middlewares: [MyMiddleWare()],
  ),
  // GetPage(
  //   name: '/',
  //   page: () => const TestView(),
  //   //middlewares: [MyMiddleWare()],
  // ),
  //! on borading screen
  GetPage(
    name: AppRoutes.onBoardingScreen,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: AppRoutes.loginScreen,
    page: () => const LoginScreen(),
  ),

  GetPage(
    name: AppRoutes.vrefiyEmailCodeScreen,
    page: () => const VrefiyEmailCodeScreen(),
  ),
  GetPage(
    name: AppRoutes.forgetPasswordScreen,
    page: () => const ForgetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.vrefiyCodeScreen,
    page: () => const VrefiyCodeScreen(),
  ),
  GetPage(
    name: AppRoutes.resetPasswordScreen,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.successResetPasswordScreen,
    page: () => const SuccessResetPasswordScreen(),
  ),
  //! home page
  GetPage(
    name: AppRoutes.homeScreen,
    page: () => const Home(),
  ),

  //! user setting screen
  // GetPage(
  //   name: AppRoutes.settingScreen,
  //   page: () => const SettingScreen(),
  // ),

  //! user archive order screen
  GetPage(
    name: AppRoutes.archiveScreen,
    page: () => const ArchiveScreen(),
  ),

  //! user order details  screen
  GetPage(
    name: AppRoutes.orderDetailsScreen,
    page: () => const OrderDetailsScreen(),
  ),
];
