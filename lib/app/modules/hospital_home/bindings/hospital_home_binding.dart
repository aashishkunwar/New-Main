import 'package:get/get.dart';

import '../controllers/hospital_home_controller.dart';

class HospitalHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HospitalHomeController>(
      () => HospitalHomeController(),
    );
  }
}
