import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_overview_controller.dart';

class DetailOverviewView extends GetView<DetailOverviewController> {
  const DetailOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailOverviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailOverviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
