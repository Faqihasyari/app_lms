import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final String fullName = Get.arguments ?? '';

    final TextEditingController nameController =
        TextEditingController(text: fullName);
    return Scaffold(
        appBar: AppBar(
          title: const Text('EditProfileView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: controller.onAvatarTap,
                  child: Obx(() {
                    return CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.currentAvatar,
                    );
                  }),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                readOnly: true,
                controller: controller.emailC,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ));
  }
}
