import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  RxBool isHiddenconfirm = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confirmpassC = TextEditingController();

  SupabaseClient client = Supabase.instance.client;

  var selectedRole = 'Siswa'.obs;

  final List<String> roles = [
    'Siswa',
    'Dosen',
    'Admin',
  ];

  void signupSiswa() async {
    final name = nameC.text.trim();
    final email = emailC.text.trim();
    final password = passC.text;
    final confirmPassword = confirmpassC.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi.');
      return;
    }

    if (!email.endsWith('@gmail.com')) {
      Get.snackbar('Email Salah', 'Gunakan email Gmail yang valid.');
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar(
          'Password Tidak Cocok', 'Password dan konfirmasi tidak sama.');
      return;
    }

    try {
      isLoading.value = true;

      final authRes = await client.auth.signUp(
        email: email,
        password: password,
      );

      final user = authRes.user;

      if (user != null) {
        await client.from('profile').insert({
          'email': email,
          'full_name': name,
          'role': selectedRole.value,
        });

        Get.snackbar(
            'Berhasil', 'Akun berhasil dibuat. Silakan verifikasi email Anda.');
        // Arahkan ke halaman login, dll.
      } else {
        Get.snackbar('Gagal', 'Pendaftaran gagal, user tidak ditemukan.');
      }
    } catch (e) {
      Get.snackbar('Terjadi Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  
}
