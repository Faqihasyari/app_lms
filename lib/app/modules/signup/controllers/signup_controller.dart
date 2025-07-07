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

  @override
  void onInit() {
    super.onInit();

    Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      final session = data.session;
      final event = data.event;

      if (event == AuthChangeEvent.signedIn && session != null) {
        final user = session.user;

        if (user != null) {
          // Gunakan user.id, bukan user.email, untuk mengecek profil
          final existingProfile = await client
              .from('profile')
              .select()
              .eq('id', user.id) // PENTING: Gunakan user.id
              .maybeSingle();

          if (existingProfile == null) {
            // Pastikan full_name dari userMetadata tersedia
            String fullName = user.userMetadata?['full_name'] ??
                user.userMetadata?['name'] ??
                'Pengguna Baru';

            await client.from('profile').insert({
              'id': user.id, // PENTING: Sertakan user.id
              'email': user.email,
              'full_name': fullName,
              'role':
                  'Siswa', // Set role default untuk Google Sign-up jika tidak ada pilihan role saat Google Sign-in
            });
            Get.snackbar(
                'Sukses', 'Profil berhasil dibuat untuk pengguna Google.');
          }
          // Di sini Anda bisa mengarahkan ke halaman utama setelah login/signup
          // Get.offAll(() => HomePage()); // Ganti HomePage dengan halaman tujuan Anda
        }
      }
    });
  }

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

  Future<void> signInWithGoogle() async {
    try {
      await Supabase.instance.client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'io.supabase.flutter://login-callback/',
      );
    } catch (e) {
      Get.snackbar('Gagal', e.toString());
    }
  }
}
