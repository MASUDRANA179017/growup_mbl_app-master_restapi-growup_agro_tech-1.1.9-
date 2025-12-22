import 'package:get/get.dart';

import '../controllers/my_register_controller.dart';

class MyRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRegisterController>(
      () => MyRegisterController(),
    );
  }
}
