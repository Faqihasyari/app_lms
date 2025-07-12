import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  RxString fullName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId != null) {
      final response = await Supabase.instance.client
          .from('profile')
          .select()
          .eq('id', userId)
          .maybeSingle(); // pakai maybeSingle untuk menghindari error

      if (response != null && response['full_name'] != null) {
        fullName.value = response['full_name'];
      }
    }
  }
}
