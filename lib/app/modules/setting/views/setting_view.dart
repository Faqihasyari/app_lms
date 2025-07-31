import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    final data = Get.arguments as Map<String, dynamic>? ?? {};
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Setting',
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, color: btn),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: Colors.grey.shade400),
            ),
          ],
        ),
        body: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Obx(
                  () {
                    final fullName = data['full_name'] ?? 'User';
                    final avatarUrl =
                        'https://ui-avatars.com/api/?name=${Uri.encodeComponent(fullName)}&size=256';
                    return CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(avatarUrl),
                    );
                  },
                )),
          ],
        ));
  }
}
