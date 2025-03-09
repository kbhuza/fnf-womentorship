import 'package:flutter/material.dart';
import 'package:fnf_womentorship/controllers/language_controller.dart';
import 'package:get/get.dart';

class SelectLanguagePage extends StatelessWidget {
  static const String routeName = "/select-language";

  final LanguageController controller = Get.put(LanguageController());

  final List<String> languages = ["English", "Shona", "Ndebele", "Deutsch"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose Your Language",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  return Obx(() => ListTile(
                        title: Text(language),
                        trailing: controller.selectedLanguage.value == language
                            ? Icon(Icons.check_circle,
                                color: const Color.fromARGB(255, 18, 95, 158))
                            : null,
                        onTap: () => controller.changeLanguage(language),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
