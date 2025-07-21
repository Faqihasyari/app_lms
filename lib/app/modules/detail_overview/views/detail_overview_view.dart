import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_overview_controller.dart';

class DetailOverviewView extends GetView<DetailOverviewController> {
  final course = Get.arguments as Map<String, dynamic>;

  DetailOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            ListView(
              children: [
                // Image Header
                Image.network(
                  course['image_url'] ?? '',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // TabBar
                Container(
                  color: Colors.white,
                  child: TabBar(
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    indicatorWeight: 3,
                    labelStyle: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    tabs: const [
                      Tab(text: 'Overview'),
                      Tab(text: 'Lessons'),
                      Tab(text: 'Reviews'),
                    ],
                  ),
                ),

                // TabBarView
                SizedBox(
                  height: 600, // adjust height as needed

                  child: TabBarView(
                    children: [
                      // Overview Tab
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course['title'] ?? '',
                                style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'by ${course['profile'] != null && course['profile']['full_name'] != null ? course['profile']['full_name'] as String : 'Unknown'}',
                                    ),
                                  ),
                                  Text(
                                    '${course['price'] ?? ''} \$',
                                    style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: Rea(
                                    'Lorem ipsum dolor sit amet consectetur. Nec eget accumsan molestie proin. Integer rhoncus vitae nisi natoque ac mus tellus scelerisque gravida. Consectetur aliquet sit at diam. Augue eu mauris suspendisse adipiscing nibh. Nibh lorem id eu suspendisse nulla leo hendrerit. Erat tortor commodo quam fames et molestie'),
                              )
                            ],
                          )),

                      // Lessons Tab
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "This is the Lessons tab content",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),

                      // Reviews Tab
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "This is the Reviews tab content",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            // Custom AppBar (Back + Bookmark)
            Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
