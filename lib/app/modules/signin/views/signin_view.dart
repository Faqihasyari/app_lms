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
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 35),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email Here',
                  labelStyle: GoogleFonts.plusJakartaSans(),
                  floatingLabelStyle: TextStyle(color: black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ring),
                    borderRadius: BorderRadius.circular(10), // Sudut membulat
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ring),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: GoogleFonts.plusJakartaSans(),
                  floatingLabelStyle: TextStyle(color: black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ring),
                    borderRadius: BorderRadius.circular(10), // Sudut membulat
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ring),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 55,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 37),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                      endIndent: 10, // jarak ke teks
                    ),
                  ),
                  Text(
                    'Or Sign in with',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 10, // jarak dari teks
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
