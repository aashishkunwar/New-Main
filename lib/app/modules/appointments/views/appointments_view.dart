import 'package:doctor_app/app/models/appointment.dart';
import 'package:doctor_app/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/appointments_controller.dart';

 class AppointmentsView extends GetView<AppointmentsController> {
  const AppointmentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AppointmentsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Appointments'),
          centerTitle: true,
        ),
        body: GetBuilder<AppointmentsController>(
          builder: (controller) {
            if (controller.appointmentResponse == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount:
                  controller.appointmentResponse?.appointments?.length ?? 0,
              itemBuilder: (context, index) {
                Appointment appointment =
                    controller.appointmentResponse!.appointments![index];
                var formattedDate =
                    DateFormat("yyyy-MM-dd hh:MM aa").format(appointment.date!);
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: ListTile(
                    leading: Image.network(
                      getImageUrl(appointment.avatar),
                      height: 200,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    isThreeLine: true,
                    title: Text(appointment.name ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(formattedDate),
                        Text('Rs.${appointment.amount}',
                            style: const  TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    trailing: Text(
                      appointment.status?.toUpperCase() ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: appointment.status == 'paid'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}