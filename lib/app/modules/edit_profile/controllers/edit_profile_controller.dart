import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileController extends GetxController {
  final TextEditingController emailC = TextEditingController();
  final RxString avatarUrl = ''.obs;
  final supabase = Supabase.instance.client;

  final String fullName;
  EditProfileController(this.fullName);
  String get defaultAvatar =>
      'https://ui-avatars.com/api/?name=${Uri.encodeComponent(fullName)}&size=256';

  String? uploadedFilePath; // simpan path file yg diupload

  @override
  void onInit() {
    super.onInit();

    

    avatarUrl.value = defaultAvatar;

    final user = supabase.auth.currentUser;
    if (user != null) {
      emailC.text = user.email ?? '';
    }
  }

  // Fungsi saat avatar ditekan
  void onAvatarTap() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text("Tambahkan Foto"),
              onTap: () {
                Get.back(); // tutup bottom sheet
                pickImage(); // panggil fungsi pilih gambar
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text("Hapus Foto"),
              onTap: () {
                Get.back();
                deleteImage();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked == null) return;

      final file = File(picked.path);

      // buat nama file unik (pakai user id + timestamp)
      final userId = supabase.auth.currentUser?.id;
      final fileName = '$userId-${DateTime.now().millisecondsSinceEpoch}.jpg';

      // upload ke bucket profile-image
      await supabase.storage.from('profile-image').upload(
            fileName,
            file,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: true),
          );

      // ambil public URL dari file
      final publicUrl =
          supabase.storage.from('profile-image').getPublicUrl(fileName);

      avatarUrl.value = publicUrl;

      Get.snackbar('Success', 'Profile image updated');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// Hapus foto profil (dari storage)
  Future<void> deleteImage() async {
    try {
      if (uploadedFilePath != null) {
        await supabase.storage
            .from('profile-image')
            .remove([uploadedFilePath!]);
        uploadedFilePath = null;
      }

      avatarUrl.value = defaultAvatar; // reset ke default avatar

      Get.snackbar('Success', 'Profile image deleted');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    super.onClose();
  }
}
