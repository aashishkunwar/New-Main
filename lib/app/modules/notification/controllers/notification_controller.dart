import 'package:doctor_app/app/models/notification.dart';
import 'package:doctor_app/app/utils/constants.dart';
import 'package:doctor_app/app/utils/memory.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  NotificationResponse? notificationResponse;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getNotification() async {
    try {
      var url = Uri.http(ipAddress, 'doctor_api/getNotifications');

      var response = await http.post(url, body: {"token": Memory.getToken()});
      notificationResponse = notificationResponseFromJson(response.body);
      update();

      if (notificationResponse?.success ?? false) {
        // showCustomSnackBar(
        //   message: specializationResponse?.message ?? '',
        //   isSuccess: true,
        // );
      } else {
        showCustomSnackBar(
          message: notificationResponse?.message ?? '',
        );
      }
    } catch (e) {
      print(e);
      showCustomSnackBar(
        message: 'Something went wrong',
      );
    }
  }

  void increment() => count.value++;
}