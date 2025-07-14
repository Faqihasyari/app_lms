import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final user = Supabase.instance.client.auth.currentUser;
    print("User di HomeView: $user");
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Obx(() => RichText(
              text: TextSpan(
                text: 'Welcome, ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: controller.fullName.value.isEmpty
                        ? '...'
                        : controller.fullName.value,
                    style: TextStyle(
                      color: Colors.blue.shade800,
                    ),
                  ),
                ],
              ),
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.grey.shade400),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.grey.shade400),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  hintText: 'Search Here',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  fillColor: white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ring, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ring, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: ring, width: 1))),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wrap(
                  spacing: 15,
                  children: controller.tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: controller.selectedTags.contains(tag),
                      selectedColor: Colors.blue.shade100,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                          color: controller.selectedTags.contains(tag)
                              ? Colors.blue
                              : Colors.black),
                      onSelected: (_) => controller.toggleTag(tag),
                      shape: StadiumBorder(
                        side: BorderSide(color: ring, width: 0.5),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
