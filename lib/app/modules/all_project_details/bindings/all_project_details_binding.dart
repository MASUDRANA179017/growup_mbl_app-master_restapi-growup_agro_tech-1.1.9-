import 'package:get/get.dart';

import '../controllers/all_project_details_controller.dart';

class AllProjectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllProjectDetailsController>(
      () => AllProjectDetailsController(),
    );
  }
}
