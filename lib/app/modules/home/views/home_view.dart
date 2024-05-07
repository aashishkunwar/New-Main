import 'package:doctor_app/app/components/doctor_card.dart';
import 'package:doctor_app/app/models/doctor.dart';
import 'package:doctor_app/app/routes/app_pages.dart';
import 'package:doctor_app/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(155, 179, 208, 228),
        title: const Text(
          'My doctor',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await showSearch(context: context, delegate: SearchView());
            },
            icon: const Icon(Icons.search),
                      ),
          IconButton(
            onPressed: () async {
              Get.toNamed(Routes.NOTIFICATION);
            },
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getSpecializations();
          await controller.getDoctors();
        },
        child: SingleChildScrollView(
          physics: const ScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              if (controller.specializationResponse == null ||
                  controller.doctorsResponse == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Specializations',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.specializationResponse
                                ?.specialization?.length ??
                            0,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL_CATEGORY,
                                arguments: controller.specializationResponse
                                    ?.specialization?[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: primaryColor.withOpacity(0.7),
                            ),
                            margin: const EdgeInsets.only(
                              right: 10,
                              top: 10,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                controller.specializationResponse
                                        ?.specialization?[index].title ??
                                    '',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Top Doctors',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.6,
                      ),
                      itemCount:
                          controller.doctorsResponse?.doctors?.length ?? 0,
                      itemBuilder: (context, index) {
                        return DoctorCard(
                            doctor:
                                controller.doctorsResponse!.doctors![index]);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var homeController = Get.find<HomeController>();
    List<Doctor> suggestions = [];
    // suggestions = query.isEmpty
    //     ? []
    //     : homeController.doctorsResponse?.doctors
    //             ?.where((doctor) =>
    //                 (doctor.name
    //                         ?.toLowerCase()
    //                         .contains(query.toLowerCase()) ??
    //                     false) ||
    //                 (doctor.hospitalName
    //                         ?.toLowerCase()
    //                         .contains(query.toLowerCase()) ??
    //                     false) ||
    //                 (doctor.title
    //                         ?.toLowerCase()
    //                         .contains(query.toLowerCase()) ??
    //                     false) ||
    //                 (doctor.consultationCharge
    //                         ?.toLowerCase()
    //                         .contains(query.toLowerCase()) ??
    //                     false))
    //             .toList() ??
    //         [];
    var newQuery = query.toLowerCase().trim();
    suggestions = homeController.doctorsResponse?.doctors
            ?.where(
              (doctor) =>
                  (doctor.name?.toLowerCase().contains(newQuery) ?? false) ||
                  (doctor.hospitalName?.toLowerCase().contains(newQuery) ??
                      false) ||
                  (doctor.title?.toLowerCase().contains(newQuery) ?? false) ||
                  (doctor.consultationCharge?.toLowerCase().contains(newQuery) ?? false),
            )
            .toList() ??
        [];
    return suggestions.isEmpty
        ? const Center(
            child: Text(
              'No Doctors found ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 250,
                  child: DoctorCard(doctor: suggestions[index]));
            },
          );
  }
}
