import 'package:get/get.dart';

import '../controllers/hospital_main_controller.dart';

class HospitalMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HospitalMainController>(
      () => HospitalMainController(),
    );
  }
}
