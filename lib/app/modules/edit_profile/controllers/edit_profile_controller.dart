import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileController extends GetxController {
  final TextEditingController emailC = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    final user = Supabase.instance.client.auth.currentUser;
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

  void pickImage() {
    // TODO: implementasi ambil foto dari gallery/camera
    print("Ambil foto baru...");
  }

  void deleteImage() {
    // TODO: implementasi hapus foto profil
    print("Foto profil dihapus.");
  }

  @override
  void onClose() {
    emailC.dispose();
    super.onClose();
  }
}
