import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

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
          Image.asset(
            'assets/images/on_boarding/Isolation_Mode-1.png',
          ),
          Text(
            'Welcome to Cybex IT Group\nwhere learning meets innovation!',
            style: GoogleFonts.plusJakartaSans(
                fontSize: 22, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Empowering your journey through\ncutting-edge IT education and\nexpertise',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}
