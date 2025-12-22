import 'package:get/get.dart';

import '../controllers/long_projects_controller.dart';

class LongProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LongProjectsController>(
      () => LongProjectsController(),
    );
  }
}
