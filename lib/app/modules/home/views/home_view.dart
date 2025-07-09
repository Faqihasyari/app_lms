import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    print("User di HomeView: $user");
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOMEVIEW'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(user?.email ?? 'Email tidak ditemukan'),
      ),
    );
  }
}
