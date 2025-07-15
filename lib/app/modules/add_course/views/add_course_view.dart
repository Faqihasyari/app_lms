import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_course_controller.dart';

class AddCourseView extends GetView<AddCourseController> {
  const AddCourseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Kursus")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleC,
              decoration: InputDecoration(labelText: "Judul Kursus"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.desc,
              decoration: InputDecoration(labelText: "Deskripsi"),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.addCourse(),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text("Simpan Kursus"),
                  )),
          ],
        ),
      ),
    );
  }
}
