import 'package:doctor_app/app/models/doctor.dart';
import 'package:doctor_app/app/routes/app_pages.dart';
import 'package:doctor_app/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final bool showAnimation;
  const DoctorCard(
      {super.key, required this.doctor, this.showAnimation = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 158, 158, 158).withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ]),
      child: Row(
        children: [
          Expanded(
            child: showAnimation
                ? Hero(
                    tag: doctor.id!,
                    child: Image.network(
                      getImageUrl(doctor.avatar),
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  )
                : Image.network(
                    getImageUrl(doctor.avatar),
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name ?? '',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(doctor.title ?? '', style: TextStyle(fontSize: 16)),
                Text(doctor.hospitalName ?? '', style: TextStyle(fontSize: 16)),
                Text(doctor.hospitalAddress ?? ''),
                Text(doctor.hospitalEmail ?? ''),
                Text(
                  "Fees: Rs.${doctor.consultationCharge}" ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //view doctor button
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.DOCTOR_DETAIL, arguments: doctor);
                  },
                  child: Text('View Doctor'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor:
                        Color.fromARGB(208, 92, 117, 143), // text color
                    elevation: 5, // button's elevation when it's pressed
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
