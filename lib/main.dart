import 'package:flutter/material.dart';
import 'package:fnf_womentorship/bindings/initial_bindings.dart';
import 'package:fnf_womentorship/controllers/theme_controller.dart';
import 'package:fnf_womentorship/routes/app_routes.dart';
import 'package:fnf_womentorship/src/pages/events%20&%20feedback/cohort_and_feedback.dart';
import 'package:fnf_womentorship/src/pages/network/network_list.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FNF Womentorship',
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      // getPages: AppRoutes.routes(),
      home:  EventManagementPage(),
    );
  }
}

