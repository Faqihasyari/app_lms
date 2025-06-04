import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Boarding2 extends StatelessWidget {
  const Boarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/on_boarding/Frame2.png')
          ],
        ),
      ),
    );
  }
}