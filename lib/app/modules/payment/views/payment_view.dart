import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  PaymentView({super.key});
  final List<String> steps = ["Overview", "Payment Method", "Confirmation"];
  final List<String> pay = ["EasyPaisa", "Add Credit Card", "JazzCash"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: kolom.withOpacity(0.3),
                    border: Border.all(width: 1, color: ring),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(steps.length, (index) {
                          bool isActive = controller.currentStep.value == index;

                          return Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor:
                                    isActive ? Colors.blue : Colors.black,
                                child: Text(
                                  "${index + 1}",
                                  style: GoogleFonts.plusJakartaSans(
                                      color: Colors.white),
                                ),
                              ),
                              if (index < steps.length - 1)
                                Container(
                                  width: 65,
                                  height: 2,
                                  color: Colors.grey,
                                )
                            ],
                          );
                        }),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(steps.length, (index) {
                          bool isActive = controller.currentStep.value == index;
                          return SizedBox(
                            width: 115,
                            child: Text(
                              steps[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                fontWeight: isActive
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isActive ? Colors.blue : Colors.black,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    'Select Payment Method',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() {
                  switch (controller.currentStep.value) {
                    case 0:
                      return Column(
                          children: List.generate(
                        pay.length,
                        (index) {
                          return Container(
                            child: Text('asd'),
                          );
                        },
                      ));
                    case 1:
                      return Text("Ini halaman Payment Method",
                          style: TextStyle(fontSize: 20));
                    case 2:
                      return Text("Ini halaman Confirmation",
                          style: TextStyle(fontSize: 20));
                    default:
                      return Container();
                  }
                }),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: controller.previousStep,
                      child: const Text("Previous"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: controller.nextStep,
                      child: const Text("Next"),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
