import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_overview_controller.dart';

class DetailOverviewView extends GetView<DetailOverviewController> {
  final course = Get.arguments as Map<String, dynamic>;

  DetailOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          ListView.builder(
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
          ),
          Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.bookmark,
                      color: black,
                    ),
                  ),
                ],
              ))
        ]));
  }
}
