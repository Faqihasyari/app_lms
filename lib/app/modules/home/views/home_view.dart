import 'package:app_lms/app/routes/app_pages.dart';
import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Column(
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
        ),
        Obx(
          () {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controller.courses.isEmpty) {
              return Center(
                child: Text('No courses found'),
              );
            }
            return Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: GridView.builder(
                  itemCount: controller.courses.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final course = controller.courses[index];
                    final imageUrl = Supabase.instance.client.storage
                        .from('course-image')
                        .getPublicUrl(course['image_url'] ?? '');
                    print(course);
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_OVERVIEW, arguments: course);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(blurRadius: 4, color: Colors.black12)
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                              child: Image.network(
                                course['image_url'] ?? '',
                                width: double.infinity,
                                height: 120,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                        color: Colors.grey.shade300,
                                        height: 120),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                course['title'] ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "by ${course['profile']?['full_name'] ?? 'Unknown'}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class MainPage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  final List<Widget> pages = [
    HomePage(),
    Center(child: Text('Course')),
    Center(child: Text('Chat')),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: white,
          appBar: controller.currentIndex.value == 0
              ? AppBar(
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
                      onPressed: () {
                        // ignore: invalid_use_of_protected_member
                        final course = controller.courses.value;
                        Get.toNamed(Routes.SETTING, arguments: course);
                      },
                      icon: Icon(Icons.settings, color: Colors.grey.shade400),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications,
                          color: Colors.grey.shade400),
                    ),
                  ],
                )
              : null,
          body: pages[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTabIndex,
            backgroundColor: white,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            elevation: 1,
            items: [
              _buildNavItem(
                Icons.home,
                0,
              ),
              _buildNavItem(
                MdiIcons.headSnowflake,
                1,
              ),
              _buildNavItem(MdiIcons.message, 2),
              _buildNavItem(Icons.person_outline, 3),
            ],
          ),
        ));
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    final isActive = controller.currentIndex.value == index;

    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Container(
            height: 4,
            width: 24,
            decoration: BoxDecoration(
              color: isActive ? Colors.blue.shade900 : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 4),
          Icon(
            icon,
            color: isActive ? Colors.blue.shade900 : Colors.grey,
          ),
        ],
      ),
      label: '',
    );
  }
}

class ProfilePage extends GetView<HomeController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(backgroundColor: white, title: Text('PROFILE')),
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    height: 400,
                    width: 350,
                    decoration: BoxDecoration(
                        color: kolom.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Obx(() => Text(
                              controller.fullName.value.isEmpty
                                  ? 'Loading...'
                                  : controller.fullName.value,
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Obx(
                      () {
                        final fullName = controller.fullName.value;
                        final avatarUrl =
                            'https://ui-avatars.com/api/?name=${Uri.encodeComponent(fullName)}&size=256';
                        return CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(avatarUrl),
                        );
                      },
                    )),
              ],
            ),
          ],
        ));
  }
}
