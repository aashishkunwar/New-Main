import 'package:doctor_app/app/models/user.dart';
import 'package:doctor_app/app/utils/constants.dart';
import 'package:doctor_app/app/utils/memory.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  UserResponse? userResponse;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getAppointments();
  }

  void getAppointments() async {
    try {
      Uri url = Uri.http(ipAddress, 'doctor_api/getMyDetails');

      var response = await http.post(url, body: {"token": Memory.getToken()});

      // print(response.body);

      var result = userResponseFromJson(response.body);

      if (result.success ?? false) {
        userResponse = result;
        update();
      } else {
        showCustomSnackBar(
          message: result.message ?? '',
        );
      }
    } catch (e) {
      showCustomSnackBar(
        message: e.toString(),
      );
    }
  }
}