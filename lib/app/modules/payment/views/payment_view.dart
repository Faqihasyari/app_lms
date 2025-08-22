import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  PaymentView({super.key});
  final List<String> steps = ["Overview", "Payment Method", "Confirmation"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(steps.length, (index) {
                bool isActive = controller.currentStep.value == index;

                return Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: isActive ? Colors.blue : Colors.black,
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    if (index < steps.length - 1)
                      Container(
                        width: 40,
                        height: 2,
                        color: Colors.grey,
                      )
                  ],
                );
              }),
            ),
            const SizedBox(height: 10),
            // label teks di bawah step
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(steps.length, (index) {
                bool isActive = controller.currentStep.value == index;
                return SizedBox(
                  width: 90,
                  child: Text(
                    steps[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                      color: isActive ? Colors.blue : Colors.black,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            // Tombol kontrol step
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
        );
      }),
    );
  }
}
