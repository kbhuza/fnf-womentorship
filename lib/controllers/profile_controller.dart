import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final scrollController = ScrollController();
  
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  final bioController = TextEditingController();
  final twitterController = TextEditingController();
  final linkedinController = TextEditingController();

  var isLoading = false.obs;
  var profileImage = Rxn<XFile>();
  var selectedAlumniYear = Rx<String?>(null); 
  var showFab = true.obs;

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    addressController.dispose();
    bioController.dispose();
    twitterController.dispose();
    linkedinController.dispose();
    super.onClose();
  }

  void _scrollListener() {
    final position = scrollController.position;
    showFab.value = !(position.pixels >= position.maxScrollExtent - 50);
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      profileImage.value = pickedFile;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    
    if (picked != null) {
      dobController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }


  void submitForm() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      // Handling firebase form submission
      isLoading.value = false;
    }
  }
}