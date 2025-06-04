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
                ElevatedButton(onPressed: () {}, child: Text('Sign in')),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign Up'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
