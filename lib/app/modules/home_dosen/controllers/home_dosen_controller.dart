import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeDosenController extends GetxController {
  RxString fullName = ''.obs;
  RxBool isLoading = false.obs;
  // YA GITULAH

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

  Future<void> addCourse(String title, String desc) async {
  isLoading.value = true;
  final user = Supabase.instance.client.auth.currentUser;

  if (user == null) {
    Get.snackbar('Error', 'User belum login.');
    return;
  }

  try {
    await Supabase.instance.client.from('courses').insert({
      'title': title,
      'description': desc,
      'created_by': user.id, // masih uuid!
      'is_published': false,
    });

    Get.snackbar('Berhasil', 'Kursus berhasil ditambahkan.');
  } catch (e) {
    Get.snackbar('Error', 'Gagal menambah kursus: $e');
  } finally {
    isLoading.value = false;
  }
}

}
