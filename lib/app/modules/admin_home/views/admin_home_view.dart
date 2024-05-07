import 'package:doctor_app/app/modules/home/controllers/home_controller.dart';
import 'package:doctor_app/app/routes/app_pages.dart';
import 'package:doctor_app/app/utils/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(AdminHomeController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                Get.toNamed(Routes.NOTIFICATION);
              },
              icon: const Icon(Icons.notifications),
            )
          ],
        ),
        body: GetBuilder<AdminHomeController>(
          builder: (controller) {
            if (controller.statsResponse == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              padding: const EdgeInsets.all(10),
              child: Wrap(children: [
                StatsCard(
                  svg: 'assets/images/doctor2.svg',
                  title: 'Doctors',
                  value: controller.statsResponse!.stats?.noOfDoctors ?? '',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                Visibility(
                  visible: Memory.getRole() == 'admin',
                  child: StatsCard(
                    svg: 'assets/images/doctor2.svg',
                    title: 'No of Users',
                    value: controller.statsResponse!.stats?.totalUsers ?? '',
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                StatsCard(
                  svg: 'assets/images/doctor2.svg',
                  title: 'Appointments',
                  value:
                      controller.statsResponse!.stats?.totalAppointments ?? '',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                StatsCard(
                  svg: 'assets/images/doctor2.svg',
                  title: 'Total Monthly Income',
                  value:
                      "Rs.${controller.statsResponse!.stats?.totalMonthlyIncome}" ??
                          '',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                StatsCard(
                  svg: 'assets/images/doctor2.svg',
                  title: 'Total Income',
                  value: "Rs.${controller.statsResponse!.stats?.totalIncome}" ??
                      '',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ]),
            );
          },
        ));
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final String svg;
  const StatsCard({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
    required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: Get.width * 0.45,
        height: 250,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 158, 158, 158).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ]),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (SvgPicture.asset(
                svg,
                height: 50,
              )),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.arsenal(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
