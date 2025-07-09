import 'package:app_lms/app/modules/home/views/home_view.dart';
import 'package:app_lms/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninController extends GetxController {
  RxBool isHidden = true.obs;
  RxBool isLoading = false.obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  SupabaseClient client = Supabase.instance.client;

  void signinUser(BuildContext context) async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        AuthResponse res = await client.auth.signInWithPassword(
          email: emailC.text,
          password: passC.text,
        );

        final user = res.user;

        if (user != null) {
          final verified = user.emailConfirmedAt;
          print('user: $user');
          print('emailConfirmedAt: ${user.emailConfirmedAt}');

          if (verified != null) {
            // Email sudah diverifikasi
            Get.snackbar("Berhasil", "Login Telah Berhasil");
            Navigator.pushReplacement(
  // ignore: use_build_context_synchronously
  context,
  MaterialPageRoute(builder: (context) => HomeView()),
);
          } else {
            await client.auth.signOut();
            Get.snackbar("Email Belum Diverifikasi",
                "Silakan verifikasi email terlebih dahulu.");
          }
        } else {
          Get.snackbar("Gagal", "Login gagal, user tidak ditemukan.");
        }
      } on AuthException catch (e) {
        Get.snackbar("Gagal", e.message);
      } catch (e) {
        Get.snackbar("Error", "Gagal login: ${e.toString()}");
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Email dan password belum diisi");
    }
  }
}
