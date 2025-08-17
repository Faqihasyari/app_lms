import 'package:flutter/cupertino.dart';
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

  @override
  void onClose(){
    emailC.dispose();
    super.onClose();
  }
}
