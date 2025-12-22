import 'package:get/get.dart';

import '../controllers/invoice_recharge_controller.dart';

class InvoiceRechargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceRechargeController>(
      () => InvoiceRechargeController(),
    );
  }
}
