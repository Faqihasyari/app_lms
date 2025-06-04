import 'package:app_lms/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  var currentPage = 0.obs;
  final int lastPage = 3; // Misalnya 4 slide (index 0 - 3)

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPageOrFinish() {
    if (currentPage.value == lastPage) {
      // Pindah halaman kalau di slide terakhir
      Get.offAllNamed(Routes
          .ON_BOARDING_SCREEN2); // atau Get.toNamed('/home') kalau pakai route biasa
    } else {
      // Lanjut ke slide berikutnya
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
