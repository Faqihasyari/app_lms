import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  var currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 3) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: navigasi ke halaman utama
      print("Onboarding selesai");
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}
