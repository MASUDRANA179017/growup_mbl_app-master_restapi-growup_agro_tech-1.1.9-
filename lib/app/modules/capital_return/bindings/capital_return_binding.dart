import 'package:get/get.dart';

import '../controllers/capital_return_controller.dart';

class CapitalReturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CapitalReturnController>(
      () => CapitalReturnController(),
    );
  }
}
