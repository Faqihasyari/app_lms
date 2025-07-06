import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600, fontSize: 32),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Create an account to begin your Learning Journey',
                style: GoogleFonts.plusJakartaSans(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Full Name'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Your Name Here',
                      hintStyle: TextStyle(color: hint),
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
                ],
              ),
            ),
          ],
        ));
  }
}
