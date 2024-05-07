import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: GetBuilder<NotificationController>(
        builder: (controller) {
          if (controller.notificationResponse == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.notificationResponse?.notifications?.isEmpty ?? true) {
            return const Center(
              child: Text('No notifications', style: TextStyle(fontSize: 20)),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.notificationResponse?.notifications?.length,
            itemBuilder: (context, index) {
              var formattedDate = DateFormat("yyyy-MM-dd hh:MM aa").format(
                  controller
                      .notificationResponse!.notifications![index].createdAt!);
              return ListTile(
                isThreeLine: true,
                title: Text(
                  controller
                          .notificationResponse?.notifications?[index].title ??
                      '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        controller.notificationResponse?.notifications?[index]
                                .description ??
                            '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                    Text(formattedDate,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 17,
                        )),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}