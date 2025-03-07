import 'package:flutter/material.dart';
import 'package:fnf_womentorship/configs/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';




mixin SubThemeData{
  TextTheme getTextThemes() {
    return GoogleFonts.interTextTheme(
      const TextTheme(
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400
        ),
      )
    );
  }

  IconThemeData getIconTheme(){
    return const IconThemeData(color: onSurfaceTextColor, size: 16);
  }
}