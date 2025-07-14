import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_dosen_controller.dart';

class HomeDosenView extends GetView<HomeDosenController> {
  const HomeDosenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeDosenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeDosenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
