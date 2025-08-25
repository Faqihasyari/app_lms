import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            pay.length,
                            (index) {
                              return Align(
                                alignment: Alignment(-1, 0),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 68,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      spacing: 5,
                                      children: [
                                        Icon(MdiIcons.plusCircle),
                                        Text(pay[index]),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ));
                    case 1:
                      return Column(
                        spacing: 20,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: btn.withOpacity(0.2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ring),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ring),
                                ),
                                hintText: 'Name On Card',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: btn.withOpacity(0.2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ring),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ring),
                                ),
                                hintText: 'Card Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: btn.withOpacity(0.2),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: ring),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: ring),
                                      ),
                                      hintText: 'CVC Number',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: btn.withOpacity(0.2),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: ring),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: ring),
                                      ),
                                      hintText: 'Expiry Date',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    case 2:
                      return Column(
                        children: [
                          Text("Transaction Completed!",
                              style: TextStyle(fontSize: 20)),
                        ],
                      );
                    default:
                      return Container();
                  }
                }),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: btn,
                          minimumSize: Size(Get.width * 0.3, 40),
                          foregroundColor: white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(5))),
                      onPressed: controller.previousStep,
                      child: const Text("Previous"),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: btn,
                          minimumSize: Size(Get.width * 0.3, 40),
                          foregroundColor: white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(5))),
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
