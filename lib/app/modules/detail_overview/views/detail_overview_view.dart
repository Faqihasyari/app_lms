import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../controllers/detail_overview_controller.dart';

class DetailOverviewView extends GetView<DetailOverviewController> {
  final course = Get.arguments as Map<String, dynamic>;

  DetailOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = course['skills'] as List<dynamic>? ?? [];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: white,
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
                  height:
                      skills.length > 3 ? 475 : 430, // adjust height as needed

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
                                child: ReadMoreText(
                                  'Lorem ipsum dolor sit amet consectetur. Nec eget accumsan molestie proin. Integer rhoncus vitae nisi natoque ac mus tellus scelerisque gravida. Consectetur aliquet sit at diam. Augue eu mauris suspendisse adipiscing nibh. Nibh lorem id eu suspendisse nulla leo hendrerit. Erat tortor commodo quam fames et molestie',
                                  trimLines: 5,
                                  colorClickableText: Colors.blue,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: '...Read more',
                                  trimExpandedText: ' Show less',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Container(
                                height: 97,
                                margin: EdgeInsets.all(16),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  // ignore: deprecated_member_use
                                  color: kolom.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  spacing: 15,
                                  children: [
                                    Row(
                                      spacing: 100,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.book,
                                                color: kolom,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                '${course['lectures_count'] ?? ''} Lectures',
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        )),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Icon(
                                                MdiIcons.certificate,
                                                color: kolom,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                course['has_certificate'] ==
                                                        true
                                                    ? 'Certificate'
                                                    : 'No Certificate',
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      spacing: 100,
                                      children: [
                                        Expanded(
                                            child: Row(
                                          children: [
                                            Icon(
                                              MdiIcons.clock,
                                              color: kolom,
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              '${course['duration_weeks'] ?? ''} Weeks',
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ],
                                        )),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Icon(
                                                MdiIcons.saleOutline,
                                                color: kolom,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                  '${course['discount_percent'] ?? ''}% Off'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Skills',
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: (course['skills'] as List<dynamic>?)
                                        ?.map((skill) => Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Text(
                                                skill.toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ))
                                        .toList() ??
                                    [const Text('No skills')],
                              ),
                            ],
                          )),

                      // Lessons Tab
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Container(
                                height: 55,
                                width: Get.width * 0.85,
                                margin: EdgeInsets.all(16),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  // ignore: deprecated_member_use
                                  color: kolom.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Chapter 1 : What is Graphics Designing?',
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                height: Get.height * 0.3,
                                width: Get.width * 0.85,
                                decoration: BoxDecoration(
                                  color: kolom.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_circle,
                                          size: 35,
                                          color: btn,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            'Lorem ipsum dolor sit amet consectetur.'),
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.view_carousel_outlined,
                                          size: 35,
                                          color: btn,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            'Lorem ipsum dolor sit amet consectetur.'),
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_circle,
                                          size: 35,
                                          color: btn,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            'Lorem ipsum dolor sit amet consectetur.'),
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.view_carousel_outlined,
                                          size: 35,
                                          color: btn,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            'Lorem ipsum dolor sit amet consectetur.'),
                                      ],
                                    ))
                                  ],
                                ),
                              )
                            ],
                          )),

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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          minimumSize: Size.fromHeight(50),
                          foregroundColor: white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.all(
                                  Radius.circular(15)))),
                      onPressed: () {},
                      child: Text(
                        'GET ENROLL',
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )),
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
