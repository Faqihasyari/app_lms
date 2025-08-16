import 'package:get/get.dart';

import '../modules/MyCourse/bindings/my_course_binding.dart';
import '../modules/MyCourse/views/my_course_view.dart';
import '../modules/add_course/bindings/add_course_binding.dart';
import '../modules/add_course/views/add_course_view.dart';
import '../modules/detail_overview/bindings/detail_overview_binding.dart';
import '../modules/detail_overview/views/detail_overview_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_dosen/bindings/home_dosen_binding.dart';
import '../modules/home_dosen/views/home_dosen_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/view/on_boarding_screen1.dart';
import '../modules/splash/view/on_boarding_screen2.dart';
import '../modules/splash/view/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING_SCREEN1,
      page: () => OnBoarding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING_SCREEN2,
      page: () => Boarding2(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => MainPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DOSEN,
      page: () => const HomeDosenView(),
      binding: HomeDosenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_COURSE,
      page: () => const AddCourseView(),
      binding: AddCourseBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_OVERVIEW,
      page: () => DetailOverviewView(),
      binding: DetailOverviewBinding(),
    ),
    GetPage(
      name: _Paths.MY_COURSE,
      page: () => const MyCourseView(),
      binding: MyCourseBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
