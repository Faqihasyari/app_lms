import 'package:app_lms/app/modules/splash/view/on_boarding_controller.dart';
import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatefulWidget {
   OnBoarding({super.key});
   final OnboardingController controller = Get.put(OnboardingController());
   final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/on_boarding/Isolation_Mode-1.png',
      'title': 'Welcome to Cybex IT Group\nwhere learning meets innovation!',
      'subtitle':
          'Empowering your journey through\ncutting-edge IT education and\nexpertise',
    },
    {
      'image': 'assets/images/on_boarding/Isolation_Mode.png',
      'title': 'Begin your learning journey and unlock a world of knowledge',
      'subtitle': 'Explore our comprehensive courses\ndesigned to transform your skills and\ncareer',
    },
    {
      'image': 'assets/images/on_boarding/Layer_1.png',
      'title': 'Dive into a seamless learning\nexperience with Cybex IT Group',
      'subtitle': 'Experience interactive learning with\nexpert-led courses and progress\ntracking',
    },
    {
      'image': 'assets/images/on_boarding/Frame.png',
      'title': 'Join a community of learners and\nembark on a learning adventure',
      'subtitle': 'Connect with like-minded individuals\nJoin us to learn, grow, and thrive\ntogether!',
    },
  ];
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: PageView.builder(
            controller: widget.controller.pageController,
            onPageChanged: widget.controller.onPageChanged,
            itemCount: widget.onboardingData.length,
            itemBuilder: (context, index) {
            
          },)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: btn,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(0, 57)),
              child: Text(
                "Continue",
                style: GoogleFonts.plusJakartaSans(color: white),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
