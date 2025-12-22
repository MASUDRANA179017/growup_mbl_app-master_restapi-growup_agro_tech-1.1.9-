import 'package:get/get.dart';

import '../controllers/invoice_growup_controller.dart';

class InvoiceGrowupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceGrowupController>(
      () => InvoiceGrowupController(),
    );
  }
}
