import 'package:doctor_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/hospital_home_controller.dart';

class HospitalHomeView extends GetView<HospitalHomeController> {
  const HospitalHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HospitalHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HospitalHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
