import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_overview_controller.dart';

class DetailOverviewView extends GetView<DetailOverviewController> {
  final course = Get.arguments as Map<String, dynamic>;

  DetailOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.bookmark))],
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            final course = Get.arguments as Map<String, dynamic>;
            return Column(
              children: [
                Image.network(
                  course['image_url'] ?? '',
                )
              ],
            );
          },
        ));
  }
}
