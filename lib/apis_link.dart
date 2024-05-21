class ApiLink {
  //http://localhost/matgary_backend/test.php
  static const String server = 'http://192.168.1.3/matgary_backend';
  static const String test = '$server/test.php';

  //? database images
  static const String rootImage = 'http://192.168.1.6/matgary_backend/upload';
  static const String categoriesImg = '$rootImage/categories';
  static const String itemsImg = '$rootImage/items';

  //?  auth api links
  static const String login = '$server/delivery/auth/login.php';
  static const String vrefiyCode = '$server/delivery/auth/vrefiycode.php';
  static const String resendVrefiyCode =
      '$server/delivery/auth/resendvrefiycode.php';

  //? forget password
  static const String vrefiyCodePass =
      '$server/delivery/forgetpassword/vrefiycode.php';
  static const String checkEmail =
      '$server/delivery/forgetpassword/checkemail.php';
  static const String resetPass =
      '$server/delivery/forgetpassword/resetpassword.php';

  //? home page
  static const String home = '$server/home.php';

  //? user order
  static const String pendingOrder = '$server/delivery/order/pending.php';
  static const String acceptedOrder = '$server/delivery/order/accepted.php';
  static const String approveOrder = '$server/delivery/order/approve.php';
  static const String archiveOrder = '$server/delivery/order/archive.php';
  static const String detailsOrder = '$server/delivery/order/details.php';
  static const String doneOrder = '$server/delivery/order/done.php';

  //? notifications user data
  static const String getNotification = '$server/getnotify.php';
}
