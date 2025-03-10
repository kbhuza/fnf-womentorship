import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fnf_womentorship/controllers/qualifications.dart';
import 'package:fnf_womentorship/src/components/loading_button.dart';
import 'package:fnf_womentorship/src/pages/home/mentee_dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class QualificationsPage extends StatelessWidget {
  static const String routeName = "/qualifications-page";
  final controller = Get.put(QualificationsController());

  QualificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8F8F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Qualifications",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: QualificationsCard(controller: controller),
        ),
      ),
      floatingActionButton: Obx(
        () => controller.showFab.value
            ? FloatingActionButton(
                onPressed: () => controller.scrollController.jumpTo(
                  controller.scrollController.position.maxScrollExtent,
                ),
                backgroundColor: Colors.pink,
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class QualificationsCard extends StatelessWidget {
  final QualificationsController controller;

  const QualificationsCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: size.width * 0.9,
      height: size.height * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        controller: controller.scrollController,
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const EducationalBackgroundSection(),
              const SizedBox(height: 20),
              const SkillsCompetenciesSection(),
              const SizedBox(height: 20),
              const LanguagesSection(),
              const SizedBox(height: 30),
              SubmitButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

/// Educational Background Section
class EducationalBackgroundSection extends StatelessWidget {
  const EducationalBackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QualificationsController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Educational Background",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        // Highest Degree Dropdown
        DropdownButtonFormField<String>(
          value: controller.selectedDegree.value,
          decoration: const InputDecoration(
            labelText: 'Highest Level of Education',
            border: OutlineInputBorder(),
          ),
          items: controller.availableDegrees.map((degree) {
            return DropdownMenuItem(
              value: degree,
              child: Text(degree),
            );
          }).toList(),
          onChanged: (value) => controller.selectedDegree.value = value,
          validator: (value) =>
              (value == null || value.isEmpty) ? 'Required' : null,
        ),
        const SizedBox(height: 10),
        // Institution TextField
        TextFormField(
          controller: controller.institutionController,
          decoration: const InputDecoration(
            labelText: 'Institution',
            border: OutlineInputBorder(),
          ),
          validator: (value) => value!.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 10),
        // Certifications TextField
        TextFormField(
          controller: controller.certificationsController,
          decoration: const InputDecoration(
            labelText: 'Certifications (e.g., PMP, AWS, etc.)',
            border: OutlineInputBorder(),
          ),
          maxLines: 2,
          validator: (value) => value!.isEmpty ? 'Required' : null,
        ),
      ],
    );
  }
}

/// Skills and Competencies Section
class SkillsCompetenciesSection extends StatelessWidget {
  const SkillsCompetenciesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QualificationsController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills & Competencies",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        // Skills multi-select chips
        Text(
          "Select Your Skills",
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        const SizedBox(height: 5),
        Wrap(
          spacing: 6,
          runSpacing: -8,
          children: controller.availableSkills.map((skill) {
            return Obx(
              () => FilterChip(
                label: Text(skill),
                selected: controller.selectedSkills.contains(skill),
                onSelected: (bool value) {
                  controller.toggleSkill(skill);
                },
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        // Competencies multi-select chips
        Text(
          "Select Your Competencies",
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        const SizedBox(height: 5),
        Wrap(
          spacing: 6,
          runSpacing: -8,
          children: controller.availableCompetencies.map((comp) {
            return Obx(
              () => FilterChip(
                label: Text(comp),
                selected: controller.selectedCompetencies.contains(comp),
                onSelected: (bool value) {
                  controller.toggleCompetency(comp);
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

/// Languages Section
class LanguagesSection extends StatelessWidget {
  const LanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QualificationsController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Languages Spoken",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 6,
          runSpacing: -8,
          children: controller.availableLanguages.map((lang) {
            return Obx(
              () => FilterChip(
                label: Text(lang),
                selected: controller.selectedLanguages.contains(lang),
                onSelected: (bool value) {
                  controller.toggleLanguage(lang);
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

/// Submit Button
class SubmitButton extends StatelessWidget {
  final QualificationsController controller;

  const SubmitButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  LoadingButton(
        onPressed:() {
          controller.submitForm; 
          Get.toNamed(QualificationsPage.routeName);
          },
        text: 'Save Qualifications', 
        isLoading: controller.isLoading,
        size: MediaQuery.of(context).size,
      ));
        
        
        
        // ElevatedButton(
        //   onPressed: controller.isLoading.value
        //       ? null
        //       : () {
        //           controller.submitForm();
        //           // Example: Navigate to next screen
        //           Get.toNamed(MenteeDashboardScreen.routeName);
        //         },
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.pink,
        //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //   ),
        //   child: controller.isLoading.value
        //       ? const CircularProgressIndicator(color: Colors.white)
        //       : Text(
        //           "Save Qualifications",
        //           style: GoogleFonts.poppins(
        //             fontSize: 16,
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        // ),
      
  }
}

// A placeholder widget if you want to add an icon or image
Widget widgetPlaceholder(double height_, double width_) {
  return SvgPicture.asset(
    'assets/svgs/placeholder.svg',
    color: Colors.grey,
    height: height_,
    width: width_,
  );
}
