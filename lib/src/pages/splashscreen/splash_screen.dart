import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fnf_womentorship/configs/themes/app_light_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, secondaryColor],
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
                'assets/svgs/fnf_plain_logo.svg',
                width: 200, 
                height: 200,
                           ),
                           const SizedBox(height: 12),
                           Text(
                "Friedrich Naummman Foundation",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                           ),
                const SizedBox(height: 10),
                ColoredBox(color: Colors.pink,
                child: Text(' WOMENTORSHIP ', style: GoogleFonts.inter(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 2.000000061035156,
        ),),
                ),           
                           const Spacer(),
                           SvgPicture.asset(
                'assets/svgs/loader.svg',
                width: 40, 
                height: 40,
                           ),
                           const SizedBox(height: 20),
                           Text(
                "Version 0.0.1",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
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
