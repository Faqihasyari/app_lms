import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_course_controller.dart';

class AddCourseView extends GetView<AddCourseController> {
  const AddCourseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddCourseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddCourseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
