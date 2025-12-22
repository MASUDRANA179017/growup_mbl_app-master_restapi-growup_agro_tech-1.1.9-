import 'package:get/get.dart';

import '../controllers/project_certificate_controller.dart';

class ProjectCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectCertificateController>(
      () => ProjectCertificateController(),
    );
  }
}
