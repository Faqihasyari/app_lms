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
        body: SingleChildScrollView(
          child: Column(
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ring),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Email'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Your Email Here',
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ring),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Password'),
                    Obx(
                      () => TextField(
                        controller: controller.passC,
                        obscureText: controller.isHidden.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.isHidden.toggle();
                              },
                              icon: controller.isHidden.isTrue
                                  ? Icon(Icons.remove_red_eye)
                                  : Icon(Icons.remove_red_eye_outlined)),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: hint),
                          labelStyle: GoogleFonts.plusJakartaSans(),
                          floatingLabelStyle: TextStyle(color: black),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: ring),
                            borderRadius:
                                BorderRadius.circular(10), // Sudut membulat
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ring),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Confirm Password'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ring),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: SizedBox(
                        height: 53,
                        width: 350,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: btn,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {},
                            child: Text(
                              'SIGN UP',
                              style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: white),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 37),
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
                    Center(
                      child: SizedBox(
                        height: 53,
                        width: 350,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: ring, width: 1))),
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                    'assets/images/logo/google_icon.png'),
                                Text(
                                  'Sign In with Google',
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20, color: black),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
