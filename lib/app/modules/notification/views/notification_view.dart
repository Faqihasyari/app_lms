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
        margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
        width: Get.width * 0.8,
        height: Get.height * 0.1,
        decoration: BoxDecoration(
          color: kolom.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.done_rounded),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Transaction Successfully!',
                  style:
                      GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600),
                ),
                Text('Lorem ipsum dolor sit amet consectetur.', )
              ],
            ),
            Expanded(child: Text('5 mins ago'))
          ],
        ),
      ),
    );
