import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_course_controller.dart';

class AddCourseView extends GetView<AddCourseController> {
  const AddCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Kursus"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Form Tambah Kursus",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Judul Kursus
                  TextFormField(
                    controller: controller.titleC,
                    decoration: InputDecoration(
                      labelText: "Judul Kursus",
                      prefixIcon: Icon(Icons.title),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Deskripsi
                  TextFormField(
                    controller: controller.desc,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "Deskripsi",
                      prefixIcon: Icon(Icons.description),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Harga
                  TextFormField(
                    controller: controller.priceC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Harga Kursus (Rp)",
                      prefixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Jumlah Pertemuan
                  TextFormField(
                    controller: controller.lectureCountC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Jumlah Pertemuan",
                      prefixIcon: Icon(Icons.school),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Durasi Kursus (minggu)
                  TextFormField(
                    controller: controller.durationWeeksC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Durasi (Minggu)",
                      prefixIcon: Icon(Icons.timer),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Diskon (%)
                  TextFormField(
                    controller: controller.discountPercentC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Diskon %",
                      prefixIcon: Icon(Icons.percent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Checkbox Sertifikat
                  Obx(() => CheckboxListTile(
                        title: const Text("Kursus memberikan sertifikat"),
                        value: controller.hasCertificate.value,
                        onChanged: (val) {
                          if (val != null)
                            controller.hasCertificate.value = val;
                        },
                      )),
                  const SizedBox(height: 15),

                  // Input Skill (comma separated)
                  TextFormField(
                    controller: controller.skillsC,
                    decoration: InputDecoration(
                      labelText: "Skill yang Dipelajari (pisahkan dengan koma)",
                      prefixIcon: Icon(Icons.star),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Image Picker
                  Obx(() {
                    final file = controller.selectedImage.value;
                    return GestureDetector(
                      onTap: () => controller.pickImage(),
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                          image: file != null
                              ? DecorationImage(
                                  image: FileImage(file),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          color: file == null ? Colors.grey[100] : null,
                        ),
                        child: file == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.image,
                                      size: 50, color: Colors.grey),
                                  SizedBox(height: 8),
                                  Text("Tap untuk memilih gambar"),
                                ],
                              )
                            : null,
                      ),
                    );
                  }),
                  const SizedBox(height: 25),

                  // Tombol Simpan
                  Center(
                    child: Obx(() => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: controller.addCourse,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              icon: const Icon(Icons.save),
                              label: const Text(
                                "Simpan Kursus",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
