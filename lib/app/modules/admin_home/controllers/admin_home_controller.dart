import 'package:doctor_app/app/models/stats.dart';
import 'package:doctor_app/app/utils/constants.dart';
import 'package:doctor_app/app/utils/memory.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminHomeController extends GetxController {
  StatsResponse? statsResponse;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getStats();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getStats() async {
    try {
      var url = Uri.http(ipAddress, 'doctor_api/getStats');

      var response = await http.post(url, body: {"token": Memory.getToken()});
      statsResponse = statsResponseFromJson(response.body);
      update();

      if (statsResponse?.success ?? false) {
        // showCustomSnackBar(
        //   message: specializationResponse?.message ?? '',
        //   isSuccess: true,
        // );
      } else {
        showCustomSnackBar(
          message: statsResponse?.message ?? '',
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