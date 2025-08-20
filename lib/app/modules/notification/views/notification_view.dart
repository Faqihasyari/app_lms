import 'package:app_lms/app/routes/app_pages.dart';
import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.NOTIFICATION);
              },
              icon: Icon(Icons.settings, color: Colors.grey.shade400),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: btn),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: containers(),
        ));
  }
}

List<Widget> containers() => List.generate(
      4,
      (index) => Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
        width: Get.width * 0.8,
        height: Get.height * 0.12,
        decoration: BoxDecoration(
            color: kolom.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ring, style: BorderStyle.solid)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(Icons.done_rounded),
              SizedBox(
                width: 10,
              ),
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Transaction Successfully!',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    spacing: 70,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet consectetur.',
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '5 mins ago',
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
