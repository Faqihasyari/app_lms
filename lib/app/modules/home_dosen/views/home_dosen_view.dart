import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_dosen_controller.dart';

class HomeDosenView extends GetView<HomeDosenController> {
  const HomeDosenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Obx(() => RichText(
              text: TextSpan(
                text: 'Welcome, ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: controller.fullName.value.isEmpty
                        ? '...'
                        : controller.fullName.value,
                    style: TextStyle(
                      color: Colors.blue.shade800,
                    ),
                  ),
                ],
              ),
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.grey.shade400),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.grey.shade400),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'HomeDosenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      backgroundColor: white,
    );
  }
}
