import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QualificationsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final scrollController = ScrollController();

  // Loading status
  var isLoading = false.obs;
  var showFab = true.obs;

  // Educational background
  var selectedDegree = RxnString(); // for the highest level of education
  final institutionController = TextEditingController();
  final certificationsController = TextEditingController();

  // Sample data for degrees (feel free to adjust)
  final List<String> availableDegrees = [
    'High School Diploma',
    'Associate Degree',
    'Bachelor’s Degree',
    'Master’s Degree',
    'PhD',
    'Other',
  ];

  // Skills & Competencies
  final List<String> availableSkills = [
    'Communication',
    'Leadership',
    'Project Management',
    'Data Analysis',
    'Public Speaking',
    'Problem-Solving',
  ];
  var selectedSkills = <String>[].obs;

  final List<String> availableCompetencies = [
    'Teamwork',
    'Critical Thinking',
    'Negotiation',
    'Time Management',
    'Adaptability',
  ];
  var selectedCompetencies = <String>[].obs;

  // Languages
  final List<String> availableLanguages = [
    'English',
    'French',
    'Spanish',
    'Ndebele',
    'Shona',
    'Other',
  ];
  var selectedLanguages = <String>[].obs;

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    institutionController.dispose();
    certificationsController.dispose();
    super.onClose();
  }

  void _scrollListener() {
    final position = scrollController.position;
    showFab.value = !(position.pixels >= position.maxScrollExtent - 50);
  }

  /// Toggling skills
  void toggleSkill(String skill) {
    if (selectedSkills.contains(skill)) {
      selectedSkills.remove(skill);
    } else {
      selectedSkills.add(skill);
    }
  }

  /// Toggling competencies
  void toggleCompetency(String competency) {
    if (selectedCompetencies.contains(competency)) {
      selectedCompetencies.remove(competency);
    } else {
      selectedCompetencies.add(competency);
    }
  }

  /// Toggling languages
  void toggleLanguage(String language) {
    if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
    } else {
      selectedLanguages.add(language);
    }
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      // Simulate saving data to Firebase or an API
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        // You can show a success message, navigate, etc.
        Get.snackbar("Success", "Qualifications saved successfully!");
      });
    }
  }
}
