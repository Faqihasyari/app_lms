import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final String fullName = Get.arguments ?? '';
    final avatarUrl =
        'https://ui-avatars.com/api/?name=${Uri.encodeComponent(fullName)}&size=256';

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
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(avatarUrl),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
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
