import 'package:get/get.dart';

import '../controllers/specialities_controller.dart';

class SpecialitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecialitiesController>(
      () => SpecialitiesController(),
    );
  }
}
