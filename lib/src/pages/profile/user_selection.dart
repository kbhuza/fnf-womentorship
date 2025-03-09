import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fnf_womentorship/configs/themes/app_light_theme.dart';
import 'package:fnf_womentorship/src/pages/profile/profile_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});
    static const String routeName = "/user-selector";

  @override
  Widget build(BuildContext context) {
      String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello There!", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
                      Text(formattedDate, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
                SvgPicture.asset('assets/images/notification.svg', width: 100, height: 100,),
              ],
            ),
            const SizedBox(height: 20),
            SvgPicture.asset('assets/svgs/fnf_plain_logo.svg', width: 200, height: 200, color: Colors.grey.withOpacity(0.2)),
            const SizedBox(height: 20),
            Text("Are you a ?", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500)),
            const SizedBox(height: 30),
            InkWell(
              onTap:() {
                                Get.toNamed(ProfilePage.routeName);
              },
              child: const SelectionButton(
                icon: 'assets/svgs/mentee.svg',
                label: 'Trainee',
                color: secondaryColor,
                textColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
                            onTap:() {
                                                              Get.toNamed("/home");

                            },
              child: const SelectionButton(
                icon: 'assets/svgs/mentor.svg',
                label: 'Mentor',
                color: Colors.pink,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;
  final Color textColor;

  const SelectionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, width: 80, height: 80, color: textColor),
          const SizedBox(width: 10),
          Text("$label            ", style: GoogleFonts.poppins(color: textColor, fontSize: 20, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
