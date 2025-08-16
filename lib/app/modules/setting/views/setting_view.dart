import 'package:app_lms/app/modules/home/controllers/home_controller.dart';
import 'package:app_lms/app/routes/app_pages.dart';
import 'package:app_lms/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final fullName = Get.arguments as String;
    final avatarUrl =
        'https://ui-avatars.com/api/?name=${Uri.encodeComponent(fullName)}&size=256';

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Setting',
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, color: btn),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: Colors.grey.shade400),
            ),
          ],
        ),
        body: Column(
          children: [
            Stack(
              children: [
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
                          height: 30,
                        ),
                        Obx(() => Text(
                              homeController.fullName.value.isEmpty
                                  ? 'Loading...'
                                  : homeController.fullName.value,
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        ListTile(
                          onTap: () {
                            Get.toNamed(Routes.EDIT_PROFILE);
                          },
                          title: Text(
                            'Edit Profile',
                            style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Icon(
                            Icons.people,
                            color: kolom,
                          ),
                          trailing: Icon(Icons.arrow_circle_right_outlined,
                              color: kolom),
                        ),
                        ListTile(
                          onTap: () {
                            controller.logout();
                            print('Tes');
                          },
                          title: Text(
                            'Payment Option',
                            style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Icon(
                            Icons.card_membership,
                            color: kolom,
                          ),
                          trailing: Icon(Icons.arrow_circle_right_outlined,
                              color: kolom),
                        ),
                        ListTile(
                          onTap: () {
                            controller.logout();
                            print('Tes');
                          },
                          title: Text(
                            'Terms & Conditions',
                            style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Icon(
                            Icons.edit_document,
                            color: kolom,
                          ),
                          trailing: Icon(Icons.arrow_circle_right_outlined,
                              color: kolom),
                        ),
                        ListTile(
                          onTap: () {
                            controller.logout();
                            print('Tes');
                          },
                          title: Text(
                            'Help Center',
                            style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Icon(
                            Icons.headset,
                            color: kolom,
                          ),
                          trailing: Icon(Icons.arrow_circle_right_outlined,
                              color: kolom),
                        ),
                        ListTile(
                          onTap: () {
                            controller.logout();
                            print('Tes');
                          },
                          title: Text(
                            'Invite Friends',
                            style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Icon(
                            MdiIcons.share,
                            color: kolom,
                          ),
                          trailing: Icon(Icons.arrow_circle_right_outlined,
                              color: kolom),
                        ),
                        ListTile(
                          onTap: () {
                            controller.logout();
                            print('Tes');
                          },
                          title: Text(
                            'Logout',
                            style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Icon(
                            Icons.logout,
                            color: kolom,
                          ),
                          trailing: Icon(Icons.arrow_circle_right_outlined,
                              color: kolom),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(avatarUrl),
                    )),
              ],
            ),
          ],
        ));
  }
}
