import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await Supabase.initialize(
      url: 'https://yhjstzxdvwzdzgcofwrz.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InloanN0enhkdnd6ZHpnY29md3J6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDkxOTQyNTUsImV4cCI6MjA2NDc3MDI1NX0.qT0sHDfloxD3Kep25K0Nqc8Ms--0Qms3FSSqQT33Onc');
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
