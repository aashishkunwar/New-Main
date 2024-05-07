import 'package:doctor_app/app/utils/constants.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hospital_main_controller.dart';
import 'package:doctor_app/app/utils/memory.dart';
import 'package:doctor_app/app/routes/app_pages.dart';

class HospitalMainView extends GetView<HospitalMainController> {
  const HospitalMainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.screens[controller.currentIndex.value],
        bottomNavigationBar: SizedBox(
          height: 105,
          child: FloatingNavbar(
            backgroundColor: primaryColor,
            onTap: (int val) {
              controller.currentIndex.value = val;
            },
            currentIndex: controller.currentIndex.value,
            items: [
              FloatingNavbarItem(icon: Icons.home, title: 'Home'),
              FloatingNavbarItem(icon: Icons.list, title: 'Appointments'),
              FloatingNavbarItem(icon: Icons.people, title: 'Doctors'),
              FloatingNavbarItem(icon: Icons.person, title: 'Profile'),

            ],
          ),
        ),
      ),
    );
  }
}
