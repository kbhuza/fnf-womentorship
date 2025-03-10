import 'package:flutter/material.dart';
import 'package:fnf_womentorship/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryColorLight = Color(0xFF8ED3E5);
const Color primaryColorDark =  Color(0xFF21899C);
const Color secondaryColor = Color(0xFF184FAF);
const Color mainTextColor = Color.fromARGB(255, 40, 40, 40);

class LightTheme with SubThemeData{
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light( 
        useMaterial3: true,);
    return systemLightTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(bodyColor: mainTextColor, displayColor: mainTextColor),
      primaryColor: secondaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: secondaryColor),);
  }
}

