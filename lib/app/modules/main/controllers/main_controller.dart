import 'package:doctor_app/app/modules/appointments/views/appointments_view.dart';
import 'package:doctor_app/app/modules/doctors/views/doctors_view.dart';
import 'package:doctor_app/app/modules/home/views/home_view.dart';
import 'package:doctor_app/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;
  List<Widget> screens = [
    HomeView(),
    AppointmentsView(),
    // DoctorsView(),
    ProfileView(),

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
