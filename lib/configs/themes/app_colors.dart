import 'package:flutter/material.dart';
import 'package:fnf_womentorship/configs/themes/app_light_theme.dart';
import 'package:fnf_womentorship/configs/themes/ui_parameters.dart';


const Color onSurfaceTextColor =  Colors.white;
const Color whiteBg =  Color(0xFFFFFAFA);


const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight, colors: [primaryLightColorLight, primaryColorLight],
);

const mainGradientDark= LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight, colors: [primaryLightColorLight, primaryColorLight],
);

LinearGradient mainGradient(BuildContext context) => UIParameters.isDarkMode(context)? mainGradientDark : mainGradientLight;