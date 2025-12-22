import 'package:get/get.dart';

import '../controllers/invoice_roi_controller.dart';

class InvoiceRoiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceRoiController>(
      () => InvoiceRoiController(),
    );
  }
}
