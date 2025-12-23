import 'package:get/get.dart';

import '../controllers/propertie_details_controller.dart';

class PropertieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertiesDetailsController>(
      () => PropertiesDetailsController(),
    );
  }
}
