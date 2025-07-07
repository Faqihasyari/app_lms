import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  RxBool isHiddenconfirm = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confirmpassC = TextEditingController();

  SupabaseClient client = Supabase.instance.client;

  void signup () async {
    if (nameC.text.isNotEmpty && emailC.text.isNotEmpty && passC.text.isNotEmpty && confirmpassC.text.isNotEmpty) {
      
    }
  }
}
