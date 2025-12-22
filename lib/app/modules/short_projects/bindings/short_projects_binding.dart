import 'package:get/get.dart';

import '../controllers/short_projects_controller.dart';

class ShortProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShortProjectsController>(
      () => ShortProjectsController(),
    );
  }
}
