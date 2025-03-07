import 'package:flutter/material.dart';
import 'package:fnf_womentorship/configs/themes/app_light_theme.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{
  //late ThemeData _darkTheme; //for later versions
  late ThemeData _lightTheme;

  @override
  void onInit(){
    initializeThemeData();
    super.onInit();
  }

  initializeThemeData(){
    //_darkTheme = DarkTheme().buildDarkTheme(); //for later versions
    _lightTheme = LightTheme().buildLightTheme();
  }

  //ThemeData get darkTheme => _darkTheme
  ThemeData get lightTheme => _lightTheme;
}