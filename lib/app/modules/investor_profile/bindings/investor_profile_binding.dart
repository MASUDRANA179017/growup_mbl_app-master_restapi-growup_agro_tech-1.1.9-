import 'package:get/get.dart';

import '../controllers/investor_profile_controller.dart';

class InvestorProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestorProfileController>(
      () => InvestorProfileController(),
    );
  }
}
