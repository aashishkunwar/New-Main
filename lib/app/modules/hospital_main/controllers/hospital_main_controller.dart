import 'package:doctor_app/app/modules/admin_home/views/admin_home_view.dart';
import 'package:doctor_app/app/modules/appointments/views/appointments_view.dart';
import 'package:doctor_app/app/modules/doctors/views/doctors_view.dart';
import 'package:doctor_app/app/modules/hospital_home/views/hospital_home_view.dart';
import 'package:doctor_app/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HospitalMainController extends GetxController {
  //TODO: Implement HospitalMainController
  var currentIndex = 0.obs;
  List<Widget> screens = [
    // const HospitalHomeView(),
    AdminHomeView(),
    const AppointmentsView(),
    const DoctorsView(),
    const ProfileView(),
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
