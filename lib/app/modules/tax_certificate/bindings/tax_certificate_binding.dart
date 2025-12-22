import 'package:get/get.dart';

import '../controllers/tax_certificate_controller.dart';

class TaxCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaxCertificateController>(
      () => TaxCertificateController(),
    );
  }
}
