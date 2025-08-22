import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PaymentView'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 88,
                width: 352,
                decoration: BoxDecoration(
                  color: kolom.withOpacity(0.3),
                  border: Border.all(width: 1, color: ring),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: kolom,
                              child: Text(
                                '1',
                                style: GoogleFonts.plusJakartaSans(
                                    color: white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Text('Overview')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 1,
                              color: Colors.black,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: kolom,
                              child: Text(
                                '2',
                                style: GoogleFonts.plusJakartaSans(
                                    color: white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        Text('Payment Method')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: kolom,
                          child: Text(
                            '3',
                            style: GoogleFonts.plusJakartaSans(
                                color: white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Text('Confirmation')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
