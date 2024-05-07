import 'package:doctor_app/app/modules/admin_home/views/admin_home_view.dart';
import 'package:doctor_app/app/modules/profile/views/profile_view.dart';
import 'package:doctor_app/app/modules/specialities/views/specialities_view.dart';
import 'package:doctor_app/app/modules/users/views/users_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminMainController extends GetxController {
  List<Widget> screens = const [
    AdminHomeView(),
    SpecialitiesView(),
    UsersView(),
    ProfileView(),
  ];

  RxInt currentIndex = 0.obs;
}