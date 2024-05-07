import 'package:doctor_app/app/models/doctor.dart';
import 'package:doctor_app/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/doctor_detail_controller.dart';

class DoctorDetailView extends GetView<DoctorDetailController> {
  const DoctorDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var doctor = Get.arguments as Doctor?;
    return Scaffold(
        appBar: AppBar(
          title: Text(doctor?.name ?? ''),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: doctor?.id! ?? '',
              child: Image.network(
                getImageUrl(
                  doctor?.avatar,
                ),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
                margin: const EdgeInsets.all(5.0),
                // color: Color.fromARGB(170, 176, 217, 249),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Doctor Details:',
                            style: GoogleFonts.notoSansDisplay(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                decoration: TextDecoration.underline)),
                        Row(
                          children: [
                            Text("Doctor's Name: ",
                                style: GoogleFonts.almarai(
                                  fontSize: 25,
                                  // fontWeight: FontWeight.bold,
                                )),
                            Text(
                              doctor?.name ?? '',
                              style: GoogleFonts.encodeSans(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 4,
                                wordSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Specialization: ",
                                style: GoogleFonts.almarai(
                                  fontSize: 25,
                                  // fontWeight: FontWeight.bold,
                                )),
                            Text(
                              doctor?.title ?? '',
                              style: GoogleFonts.encodeSans(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 4,
                                wordSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Doctor's Fee: ",
                                style: GoogleFonts.almarai(
                                  fontSize: 25,
                                  // fontWeight: FontWeight.bold,
                                )),
                            Text(
                              doctor?.consultationCharge ?? '',
                              style: GoogleFonts.encodeSans(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 4,
                                wordSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Hospital's Name: ",
                                style: GoogleFonts.almarai(
                                  fontSize: 25,
                                  // fontWeight: FontWeight.bold,
                                )),
                            Text(
                              doctor?.hospitalName ?? '',
                              style: GoogleFonts.encodeSans(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 4,
                                wordSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Hospital's Address: ",
                                style: GoogleFonts.almarai(
                                  fontSize: 25,
                                  // fontWeight: FontWeight.bold,
                                )),
                            Text(
                              doctor?.hospitalAddress ?? '',
                              style: GoogleFonts.encodeSans(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 4,
                                wordSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Hospital's Email: ",
                                style: GoogleFonts.almarai(
                                  fontSize: 25,
                                  // fontWeight: FontWeight.bold,
                                )),
                            Text(
                              doctor?.hospitalEmail ?? '',
                              style: GoogleFonts.encodeSans(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 4,
                                wordSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ]),
                )),
          ),
        ]),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          height: 100,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(188, 87, 126, 147),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => MakeAppointmentPage(doctor: doctor!),
                        arguments: doctor);
                  },
                  child: Text(
                    'Book Appointment',
                    style: GoogleFonts.arsenal(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class MakeAppointmentPage extends StatelessWidget {
  final Doctor doctor;
  const MakeAppointmentPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DoctorDetailController());
    return Scaffold(
        appBar: AppBar(
          title: Text(doctor.name ?? ''),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    readOnly: true,
                    controller: controller.dateController,
                    decoration: InputDecoration(
                      labelText: 'Booking Date',
                      hintText: 'Select your booking date',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 30),
                            ),
                          );
                          if (date != null) {
                            controller.dateController.text =
                                date.toString().split(' ')[0];
                          }
                        },
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your booking date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: controller.timeController,
                    decoration: InputDecoration(
                      labelText: 'Booking Time',
                      hintText: 'Select your booking time',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time != null) {
                            controller.timeController.text =
                                '${time.hour}:${time.minute}';
                          }
                        },
                        icon: const Icon(Icons.timer),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your booking time';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    minLines: 5,
                    maxLines: 5,
                    maxLength: 5000,
                    keyboardType: TextInputType.text,
                    controller: controller.problemsController,
                    decoration: const InputDecoration(
                      labelText: 'Problems(optional)',
                      hintText: 'Enter your problems',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          height: 100,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 65, 116, 143),
                    elevation: 20,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                  ),
                  onPressed: controller.makeBooking,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/khaltiLogo.png',
                        width: 60,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Pay with Khalti',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
