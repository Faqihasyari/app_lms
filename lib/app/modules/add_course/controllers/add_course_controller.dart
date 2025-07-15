import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddCourseController extends GetxController {
  RxBool isLoading = false.obs;
  final SupabaseClient client = Supabase.instance.client;
  final titleC = TextEditingController();
  final desc = TextEditingController();

  Future<void> addCourse() async {
    final userId = client.auth.currentUser?.id;

    if (userId == null) {
      Get.snackbar("Error", "User belum login atau token expired.");
      return;
    }

    final title = titleC.text.trim();
    final description = desc.text.trim();

    if (title.isEmpty || description.isEmpty) {
      Get.snackbar("Error", "Judul dan deskripsi wajib diisi.");
      return;
    }

    try {
      isLoading.value = true;

      await client.from('course').insert({
        'title': title,
        'description': description,
        'created_by': userId,
        'is_published': true,
      });

      Get.back(); // kembali ke halaman sebelumnya
      Get.snackbar("Sukses", "Kursus berhasil ditambahkan.");
    } catch (e) {
      Get.snackbar("Error", "Gagal menambahkan kursus: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
