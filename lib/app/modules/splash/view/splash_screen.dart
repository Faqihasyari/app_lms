import 'dart:async';

import 'package:app_lms/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay selama 3 detik, lalu pindah ke halaman berikutnya
    Timer(Duration(seconds: 3), () {
      Get.offNamed(Routes.ON_BOARDING_SCREEN1);  // Ganti dengan rute tujuanmu
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo/logo1.png', // ganti dengan path logo kamu
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
