import 'package:doctor_app/app/components/doctor_card.dart';
import 'package:doctor_app/app/models/doctor.dart';
import 'package:doctor_app/app/models/specialization.dart';
import 'package:doctor_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_category_controller.dart';

class DetailCategoryView extends GetView<DetailCategoryController> {
  final Specialization specalization = Get.arguments;
  DetailCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeController>();
    List<Doctor> doctors = [];
    homeController.doctorsResponse?.doctors?.forEach((doctor) {
      if (doctor.specializationId == specalization.specializationId) {
        doctors.add(doctor);
      }
    });

    print(doctors);
    return Scaffold(
        appBar: AppBar(
          title: Text(specalization.title ?? ''),
          centerTitle: true,
        ),
        body: doctors.isEmpty
            ? const Center(
                child: Text(
                'No Doctors found for this category',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ))
            : ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 250,
                      child: DoctorCard(
                          showAnimation: false, doctor: doctors[index]));
                },
              ));
  }
}