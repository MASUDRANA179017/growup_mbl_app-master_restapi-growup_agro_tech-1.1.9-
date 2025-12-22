import 'package:get/get.dart';

import '../controllers/my_login_controller.dart';

class MyLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyLoginController>(
      () => MyLoginController(),
    );
  }
}
