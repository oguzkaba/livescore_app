import 'package:get/get.dart';

import '../controllers/deneme_controller.dart';

class DenemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DenemeController>(
      () => DenemeController(),
    );
  }
}
