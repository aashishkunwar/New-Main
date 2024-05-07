import 'package:get/get.dart';

import '../modules/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin_home/views/admin_home_view.dart';
import '../modules/admin_main/bindings/admin_main_binding.dart';
import '../modules/admin_main/views/admin_main_view.dart';
import '../modules/appointments/bindings/appointments_binding.dart';
import '../modules/appointments/views/appointments_view.dart';
import '../modules/detail_category/bindings/detail_category_binding.dart';
import '../modules/detail_category/views/detail_category_view.dart';
import '../modules/doctor_detail/bindings/doctor_detail_binding.dart';
import '../modules/doctor_detail/views/doctor_detail_view.dart';
import '../modules/doctors/bindings/doctors_binding.dart';
import '../modules/doctors/views/doctors_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hospital_home/bindings/hospital_home_binding.dart';
import '../modules/hospital_home/views/hospital_home_view.dart';
import '../modules/hospital_main/bindings/hospital_main_binding.dart';
import '../modules/hospital_main/views/hospital_main_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register/views/register_view.dart';
import '../modules/specialities/bindings/specialities_binding.dart';
import '../modules/specialities/views/specialities_view.dart';
import '../modules/users/bindings/users_binding.dart';
import '../modules/users/views/users_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      children: [
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.APPOINTMENTS,
      page: () => const AppointmentsView(),
      binding: AppointmentsBinding(),
    ),
    GetPage(
      name: _Paths.HOSPITAL_MAIN,
      page: () => const HospitalMainView(),
      binding: HospitalMainBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_MAIN,
      page: () => const AdminMainView(),
      binding: AdminMainBinding(),
    ),
    GetPage(
      name: _Paths.SPECIALITIES,
      page: () => const SpecialitiesView(),
      binding: SpecialitiesBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_DETAIL,
      page: () => const DoctorDetailView(),
      binding: DoctorDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.HOSPITAL_HOME,
      page: () => const HospitalHomeView(),
      binding: HospitalHomeBinding(),
    ),
    GetPage(
      name: _Paths.DOCTORS,
      page: () => const DoctorsView(),
      binding: DoctorsBinding(),
    ),
    GetPage(
      name: _Paths.USERS,
      page: () => const UsersView(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CATEGORY,
      page: () => DetailCategoryView(),
      binding: DetailCategoryBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
