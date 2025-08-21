import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
              ),
            )
          ],
        ));
  }
}
