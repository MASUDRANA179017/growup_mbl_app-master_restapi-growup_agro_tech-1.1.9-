import 'package:get/get.dart';

import '../controllers/investment_history_controller.dart';

class InvestmentHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestmentHistoryController>(
      () => InvestmentHistoryController(),
    );
  }
}
