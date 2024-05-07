import 'dart:convert';

import 'package:doctor_app/app/utils/constants.dart';
import 'package:doctor_app/app/utils/memory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UsersController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullNameController = TextEditingController();
   var addressController = TextEditingController();
  var registerFormKey = GlobalKey<FormState>();
  String roleValue = 'user';
  @override
  void onInit() {
    super.onInit();
  }

  void onRegister() async {
    if (registerFormKey.currentState!.validate()) {
      try {
        var url = Uri.http(ipAddress, 'doctor_api/addUser');

        var response = await http.post(url, body: {
          'token': Memory.getToken(),
          'fullname': fullNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'address': addressController.text,
          'role': roleValue,
        });

        var result = jsonDecode(response.body);


        if (result['success']) {
          fullNameController.clear();
          emailController.clear();
          passwordController.clear();
          addressController.clear();
          // update();
          Get.back();
          showCustomSnackBar(
            message: result['message'],
            isSuccess: true,
          );
        } else {
          showCustomSnackBar(
            message: result['message'],
          );
        }
      } catch (e) {
        showCustomSnackBar(
          message: 'Something went wrong',
        );
      }
    }
  }
}