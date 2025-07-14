import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeDosenController extends GetxController {
  RxString fullName = ''.obs;
  

  @override
  void onInit() {
    super.onInit();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    final email = Supabase.instance.client.auth.currentUser?.email;

    if (email != null) {
      final response = await Supabase.instance.client
          .from('profile')
          .select()
          .eq('email', email)
          .maybeSingle(); // hindari error kalau datanya kosong

      if (response != null && response['full_name'] != null) {
        fullName.value = response['full_name'];
      } else {
        print('Profile tidak ditemukan atau full_name kosong');
      }
    } else {
      print('Email user tidak ditemukan (null)');
    }
  }
}
