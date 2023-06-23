import 'package:get/get.dart';

import '../controllers/statistical_controller.dart';

class StatisticalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticalController>(
      () => StatisticalController(),
    );
  }
}
