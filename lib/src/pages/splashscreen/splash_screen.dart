import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
             ),
             SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
               child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const Spacer(),
                           SvgPicture.asset(
                'assets/images/logo.svg',
                width: 200, 
                height: 200,
                           ),
                           const SizedBox(height: 20),
                           Text(
                "Drug Awareness\nApplication",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                           ),
                           const Spacer(),
                           SvgPicture.asset(
                'assets/images/loader.svg',
                width: 40, 
                height: 40,
                           ),
                           const SizedBox(height: 20),
                           Text(
                "NUST FYP",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                           ),
                           const SizedBox(height: 20),
                         ],
                       ),
             ),
      
        ],
      ),
    );
  }
}
