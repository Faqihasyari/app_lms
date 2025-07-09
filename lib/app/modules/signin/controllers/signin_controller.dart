import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  RxBool isHidden = true.obs;

  TextEditingController nameC = TextEditingController();
  TextEditingController passC = TextEditingController();
}
