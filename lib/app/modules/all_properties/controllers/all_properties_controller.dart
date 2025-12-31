import 'package:get/get.dart';
import 'package:growup_agro/app/data/providers/property_provider/property_provider.dart';

class AllPropertiesController extends GetxController {

  PropertyProvider _provider = PropertyProvider();
  // RxList<>
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchProperties() async {

  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
