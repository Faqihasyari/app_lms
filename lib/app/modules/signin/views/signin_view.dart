import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign in',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please Sign in with your account',
              style: GoogleFonts.plusJakartaSans(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email'),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email Here',
                      labelStyle: GoogleFonts.plusJakartaSans(),
                      floatingLabelStyle: TextStyle(color: black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ring),
                        borderRadius:
                            BorderRadius.circular(10), // Sudut membulat
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ring),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Password'),
                  Obx(
                    () => TextField(
                      controller: controller.passC,
                      obscureText: controller.isHidden.value,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.isHidden.toggle();
                            },
                            icon: controller.isHidden.isTrue
                                ? Icon(Icons.remove_red_eye)
                                : Icon(Icons.remove_red_eye_outlined)),
                        labelStyle: GoogleFonts.plusJakartaSans(),
                        floatingLabelStyle: TextStyle(color: black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: ring),
                          borderRadius:
                              BorderRadius.circular(10), // Sudut membulat
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ring),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 53,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: btn,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {},
                  child: Text(
                    'SIGN IN',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
