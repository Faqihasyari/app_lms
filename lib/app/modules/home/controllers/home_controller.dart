import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  RxString fullName = ''.obs;
  var selectedTags = <String>[].obs;
  RxBool isLoading = false.obs;
  RxList<Map<String, dynamic>> courses = <Map<String, dynamic>>[].obs;
  final SupabaseClient client = Supabase.instance.client;
  final List<String> tags = ['UI/UX', 'Graphics Design', 'Figma'];

  void toggleTag(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserName();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      isLoading.value = true;

      final response = await client
          .from('course')
          .select(
              '*, profile(full_name)') // ambil full_name dari relasi profile
          .eq('is_published', true)
          .order('created_at', ascending: false);

      courses.assignAll(List<Map<String, dynamic>>.from(response));
    } catch (e) {
      Get.snackbar("Error", "Gagal memuat kursus: $e");
    } finally {
      isLoading.value = false;
    }
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
