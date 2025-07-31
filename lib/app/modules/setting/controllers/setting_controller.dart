import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingController extends GetxController {
  SupabaseClient supa = Supabase.instance.client;

  void logout() async {
    try{
      await supa.auth.signOut();
      Get.offAllNamed('/login');
    } catch (e) {
      print(e);
      Get.snackbar("Terjadi Kesalahan", "Tidak bisa logout");
    }
  }
}
