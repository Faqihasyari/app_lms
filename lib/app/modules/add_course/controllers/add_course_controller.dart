import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddCourseController extends GetxController {
  RxBool isLoading = false.obs;
  RxString profileId = ''.obs;
  final SupabaseClient client = Supabase.instance.client;
  final titleC = TextEditingController();
  final desc = TextEditingController();
  final ImagePicker picker = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<String?> uploadImage(File imageFile) async {
    final fileExt = imageFile.path.split('.').last;
    final fileName = 'course-${DateTime.now().millisecondsSinceEpoch}.$fileExt';

    final bytes = await imageFile.readAsBytes();

    final response = await client.storage
        .from('course-image')
        .uploadBinary('images/$fileName', bytes,
            fileOptions: FileOptions(
              contentType: 'image/$fileExt',
              upsert: true,
            ));

    final publicUrl =
        client.storage.from('course-image').getPublicUrl('images/$fileName');
    return publicUrl;
  }

  Future<void> addCourse() async {
    final userEmail = client.auth.currentUser?.email;

    if (userEmail == null) {
      Get.snackbar("Error", "User belum login atau token expired.");
      return;
    }

    // Ambil ID dari tabel profile berdasarkan email login
    final profile = await client
        .from('profile')
        .select('id')
        .eq('email', userEmail)
        .maybeSingle();

    if (profile == null) {
      Get.snackbar("Error", "Data profil tidak ditemukan.");
      return;
    }

    final profileId = profile['id']; // ← inilah yang akan jadi created_by

    final title = titleC.text.trim();
    final description = desc.text.trim();

    if (title.isEmpty || description.isEmpty) {
      Get.snackbar("Error", "Judul dan deskripsi wajib diisi.");
      return;
    }

    try {
      isLoading.value = true;

      String? imageUrl;
      if (selectedImage.value != null) {
        imageUrl = await uploadImage(selectedImage.value!);
      }

      await client.from('course').insert({
        'title': title,
        'description': description,
        'created_by': profileId,
        'is_published': true,
        'image_url': imageUrl,
      });

      Get.back();
    
      Get.snackbar("Sukses", "Kursus berhasil ditambahkan.");
    } catch (e) {
      Get.snackbar("Error", "Gagal menambahkan kursus: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
