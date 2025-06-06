import 'package:app_lms/app/routes/app_pages.dart';
import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Boarding2 extends StatelessWidget {
  const Boarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/on_boarding/Frame2.png',
              width: Get.width * 0.8,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Join Cybex IT Group to Kick Start\nYour Lesson',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Join and Learn from our Top Instructors!',
              style: GoogleFonts.plusJakartaSans(fontSize: 16),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 190,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.SIGNIN);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btn,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: white),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                SizedBox(
                  height: 60,
                  width: 190,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: side, width: 1)),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: black),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
