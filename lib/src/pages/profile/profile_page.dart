import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fnf_womentorship/controllers/profile_controller.dart';
import 'package:fnf_womentorship/src/components/loading_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/profile-page";
  final controller = Get.put(ProfileController());

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8F8F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Create your Profile", 
           style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
        leading: IconButton(
          onPressed: Get.back, 
          icon: const Icon(Icons.arrow_back)
      )),
      body: SafeArea(
        child: Center(
          child:  ProfileCard(controller: controller),
      )),
      floatingActionButton: Obx(() => controller.showFab.value
          ? FloatingActionButton(
              onPressed: () => controller.scrollController.jumpTo(
                controller.scrollController.position.maxScrollExtent),
              backgroundColor: Colors.pink, 
              child: const Icon(Icons.arrow_downward, color: Colors.white),
            ) 
          : const SizedBox.shrink()),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final ProfileController controller;

  const ProfileCard({super.key, required this.controller});

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
              const ProfileImageSection(),
              const SizedBox(height: 10),
              const PhoneField(),
              const SizedBox(height: 10),
              const DateOfBirthField(),
              const SizedBox(height: 10),
              const AddressField(),
              const SizedBox(height: 10),
              const SocialMediaFields(),
              const SizedBox(height: 10),
              const BioField(),
              const SizedBox(height: 20),
              const AlumniYearDropdown(),
              const SizedBox(height: 30),
              SubmitButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

// Profile Image Section
class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _showImageSourceBottomSheet(context),
          child: Obx(() => CircleAvatar(
            radius: 60,
            backgroundImage: controller.profileImage.value != null
                ? FileImage(File(controller.profileImage.value!.path))
                : null,
            child: controller.profileImage.value == null
                ? widgetPlaceholder(90, 90)
                : null,
          ))),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              TextFormField(
                controller: controller.firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Get.find<ProfileController>().pickImage(ImageSource.gallery);
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Get.find<ProfileController>().pickImage(ImageSource.camera);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  //Your existing placeholder widget
Widget widgetPlaceholder(double height_, double width_) {
  return SvgPicture.asset(
    'assets/svgs/placeholder.svg',
    color:  Colors.grey,
    height: height_,
    width: width_,
  );
}
}

// Phone Field Widget
class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return IntlPhoneField(
      controller: controller.phoneController,
      initialCountryCode: 'ZW',
      disableLengthCheck: true,
      keyboardType: const TextInputType.numberWithOptions(signed: true),
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(),
      ),
      validator: (value) => value == null || value.isValidNumber() 
          ? 'Invalid phone number' 
          : null,
    );
  }
}

// Date of Birth Field
class DateOfBirthField extends StatelessWidget {
  const DateOfBirthField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return TextFormField(
      controller: controller.dobController,
      decoration: const InputDecoration(
        labelText: 'Date of Birth',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () => controller.selectDate(context),
      validator: (value) => value!.isEmpty ? 'Required' : null,
    );
  }
}

// Address Field
class AddressField extends StatelessWidget {
  const AddressField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return TextFormField(
      controller: controller.addressController,
      decoration: const InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(),
      ),
      maxLines: 2,
      validator: (value) => value!.isEmpty ? 'Required' : null,
    );
  }
}

// Social Media Fields
class SocialMediaFields extends StatelessWidget {
  const SocialMediaFields({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Column(
      children: [
        TextFormField(
          controller: controller.twitterController,
          decoration: const InputDecoration(
            labelText: 'Twitter Handle (optional)',
            border: OutlineInputBorder(),
            prefixText: '@',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller.linkedinController,
          decoration: const InputDecoration(
            labelText: 'LinkedIn URL (optional)',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

// Bio Field
class BioField extends StatelessWidget {
  const BioField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return TextFormField(
      controller: controller.bioController,
      decoration: const InputDecoration(
        labelText: 'Brief Bio',
        border: OutlineInputBorder(),
        alignLabelWithHint: true,
      ),
      maxLines: 3,
      validator: (value) => value!.isEmpty ? 'Required' : null,
    );
  }
}

// Alumni Year Dropdown
class AlumniYearDropdown extends StatelessWidget {
  const AlumniYearDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    final currentYear = DateTime.now().year;
    
    return DropdownButtonFormField<String>(
      value: controller.selectedAlumniYear.value,
      decoration: const InputDecoration(
        labelText: 'Alumni Year',
        border: OutlineInputBorder(),
      ),
      items: List.generate(currentYear - 2010 + 1, (index) {
        final year = (2010 + index).toString();
        return DropdownMenuItem(
          value: year,
          child: Text(year),
        );
      }),
      onChanged: (value) => controller.selectedAlumniYear.value = value,
      validator: (value) => value == null ? 'Required' : null,
    );
  }
}
// Submit Button
class SubmitButton extends StatelessWidget {
  final ProfileController controller;

  const SubmitButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingButton(
        onPressed: controller.submitForm,
        text: 'Save Profile', 
        isLoading: controller.isLoading,
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

// class ProfilePage extends StatefulWidget {

//     static const String routeName = "/profile-page";

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
  
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _bioController = TextEditingController();
//   final TextEditingController _twitterController = TextEditingController();
//   final TextEditingController _linkedinController = TextEditingController();
//   final ScrollController scrollController = ScrollController();

//     var isLoading = false.obs;

  
//   XFile? _profileImage;
//   String? _selectedAlumniYear;
//   bool _showFab = true; 


//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() => _profileImage = pickedFile);
//     }
//   }

//   Future<void> _selectDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
    
//     if (picked != null) {
//       setState(() {
//         _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(_scrollListener); // Add scroll listener
//   }

//   @override
//   void dispose() {
//     scrollController.removeListener(_scrollListener);
//     scrollController.dispose();
//     super.dispose();
//   }

//   // Listen to scroll events to determine FAB visibility
//   void _scrollListener() {
//     final position = scrollController.position;
//     // Show FAB if not at the bottom (with a small threshold)
//     if (position.pixels >= position.maxScrollExtent - 50) {
//       setState(() => _showFab = false);
//     } else {
//       setState(() => _showFab = true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color(0xFFF8F8F8),
//       extendBodyBehindAppBar: true,
//             appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text("Create your Profile", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
//         leading: IconButton(
//       onPressed: () {
//         Get.back();
//       }, 
//       icon: const Icon(Icons.arrow_back)),),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               buildCard(size),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton:  _showFab
//           ? FloatingActionButton(
//         onPressed: () {
//                 scrollController.jumpTo(scrollController.position.maxScrollExtent);
//         }, 
//         backgroundColor: Colors.pink, 
//         child: const  Icon(Icons.arrow_downward, color: Colors.white,),
//          ) : null,
//     );
//   }

//   Widget buildCard(Size size) {
//     return Container(
//       alignment: Alignment.center,
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       width: size.width * 0.9,
//       height: size.height * 0.85,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         color: Colors.white,
//       ),
//       child: SingleChildScrollView(
//         controller: scrollController,
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Profile Picture Section
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () => showModalBottomSheet(
//                       context: context,
//                       builder: (context) => SafeArea(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             ListTile(
//                               leading: const Icon(Icons.photo_library),
//                               title: const Text('Choose from Gallery'),
//                               onTap: () {
//                                 _pickImage(ImageSource.gallery);
//                                 Navigator.pop(context);
//                               },
//                             ),
//                             ListTile(
//                               leading: const Icon(Icons.camera_alt),
//                               title: const Text('Take Photo'),
//                               onTap: () {
//                                 _pickImage(ImageSource.camera);
//                                 Navigator.pop(context);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     child: CircleAvatar(
//                       radius: 60,
//                       backgroundImage: _profileImage != null
//                           ? FileImage(File(_profileImage!.path))
//                           : null,
//                       child: _profileImage == null
//                           ? WidgetPlaceholder(90, 90)
//                           : null,
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Expanded(
//                     child: Column(
//                       children: [
                        
//                         TextFormField(
//                           controller: _firstNameController,
//                           decoration: const InputDecoration(
//                             labelText: 'First Name',
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) => value!.isEmpty ? 'Required' : null,
//                         ),
//                         const SizedBox(height: 10),
//                         TextFormField(
//                           controller: _lastNameController,
//                           decoration: const InputDecoration(
//                             labelText: 'Last Name',
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) => value!.isEmpty ? 'Required' : null,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),

//               // Phone Number Field
//               IntlPhoneField(
//                 controller: _phoneController,
//                 initialCountryCode: 'ZW',
//                 disableLengthCheck: true,
//                 keyboardType: const TextInputType.numberWithOptions(signed: true),
//                 decoration: const InputDecoration(
//                   labelText: 'Phone Number',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) => value == null || value.isValidNumber() ? 'Required' : null,
//               ),
//               const SizedBox(height: 10),

//               // Date of Birth
//               TextFormField(
//                 controller: _dobController,
//                 decoration: const InputDecoration(
//                   labelText: 'Date of Birth',
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 readOnly: true,
//                 onTap: _selectDate,
//                 validator: (value) => value!.isEmpty ? 'Required' : null,
//               ),
//               const SizedBox(height: 10),

//               // Address
//               TextFormField(
//                 controller: _addressController,
//                 decoration: const InputDecoration(
//                   labelText: 'Address',
//                   border: OutlineInputBorder(),
//                 ),
//                 maxLines: 2,
//                 validator: (value) => value!.isEmpty ? 'Required' : null,
//               ),
//               const SizedBox(height: 10),

//               // Social Media Links
//               TextFormField(
//                 controller: _twitterController,
//                 decoration: const InputDecoration(
//                   labelText: 'Twitter Handle (optional)',
//                   border: OutlineInputBorder(),
//                   prefixText: '@',
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _linkedinController,
//                 decoration: const InputDecoration(
//                   labelText: 'LinkedIn URL (optional)',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),

//               // Bio
//               TextFormField(
//                 controller: _bioController,
//                 decoration: const InputDecoration(
//                   labelText: 'Brief Bio',
//                   border: OutlineInputBorder(),
//                   alignLabelWithHint: true,
//                 ),
//                 maxLines: 3,
//                 validator: (value) => value!.isEmpty ? 'Required' : null,
//               ),
//               const SizedBox(height: 20),

//               // Alumni Year Dropdown
//               DropdownButtonFormField<String>(
//                 value: _selectedAlumniYear,
//                 decoration: const InputDecoration(
//                   labelText: 'Alumni Year',
//                   border: OutlineInputBorder(),
//                 ),
//                 items: List.generate(DateTime.now().year - 2000 + 1, (index) {
//                   final year = 2000 + index;
//                   return DropdownMenuItem(
//                     value: year.toString(),
//                     child: Text(year.toString()),
//                   );
//                 }),
//                 onChanged: (value) => setState(() => _selectedAlumniYear = value),
//                 validator: (value) => value == null ? 'Required' : null,
//               ),
//               const SizedBox(height: 30),

//               // Submit Button
//               Center(
//                 child: LoadingButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Handle form submission
//                       }
//                     }, 
//                     text: 'Save Profile', 
//                     isLoading: isLoading,
//                     size: size,
                    
//                   ),
//               ),
              
//             ],
//           ),
//         ),
//     ));

// }

// Your existing placeholder widget
// Widget WidgetPlaceholder(double height_, double width_) {
//   return SvgPicture.asset(
//     'assets/svgs/placeholder.svg',
//     color:  Colors.grey,
//     height: height_,
//     width: width_,
//   );
// }
// }