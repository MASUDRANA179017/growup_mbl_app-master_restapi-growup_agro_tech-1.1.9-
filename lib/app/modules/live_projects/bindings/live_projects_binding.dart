import 'package:get/get.dart';

import '../controllers/live_projects_controller.dart';

class LiveProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveProjectsController>(
      () => LiveProjectsController(),
    );
  }
}
