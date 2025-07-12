import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600, fontSize: 32),
              ),
              Text(
                'Create an account to begin your Learning Journey',
                style: GoogleFonts.plusJakartaSans(fontSize: 15),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: controller.roles.map((role) {
                        final isSelected =
                            controller.selectedRole.value == role;
                        return GestureDetector(
                          onTap: () {
                            controller.selectedRole.value = role;
                          },
                          child: Column(
                            children: [
                              Text(
                                role,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color:
                                      isSelected ? Colors.blue : Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                height: 2,
                                width: 40,
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.transparent,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full Name'),
                    TextField(
                      controller: controller.nameC,
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
                      controller: controller.emailC,
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
                    Obx(
                      () => TextField(
                        controller: controller.confirmpassC,
                        obscureText: controller.isHiddenconfirm.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.isHiddenconfirm.toggle();
                              },
                              icon: controller.isHiddenconfirm.isTrue
                                  ? Icon(Icons.remove_red_eye)
                                  : Icon(Icons.remove_red_eye_outlined)),
                          hintText: 'Confirm Password',
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
                            onPressed: () {
                              controller.signupSiswa();
                            },
                            child: Text(
                              controller.isLoading.isFalse
                                  ? 'SIGNUP'
                                  : 'LOADING...',
                              style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: white),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
