import 'package:app_lms/app/modules/splash/view/on_boarding_screen1.dart';
import 'package:get/get.dart';
import '../modules/home/views/home_view.dart';
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
      page: () =>  OnBoarding(),
    ),
  ];
}
