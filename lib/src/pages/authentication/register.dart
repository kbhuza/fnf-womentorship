import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fnf_womentorship/configs/themes/app_light_theme.dart';
import 'package:fnf_womentorship/src/components/custom_auth_text_field.dart';
import 'package:fnf_womentorship/src/components/loading_button.dart';
import 'package:fnf_womentorship/src/pages/authentication/sign_in.dart';
import 'package:fnf_womentorship/src/pages/profile/user_selection.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
   Register({super.key});

  static const String routeName = "/register";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

    var isLoading = false.obs;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildCard(size),
              buildFooter(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(Size size) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: size.width * 0.9,
      height: size.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo & login text here
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(size.height / 8, size.height / 8),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ColoredBox(color: Colors.pink,
                child: Text(' WOMENTORSHIP ', style: GoogleFonts.inter(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 2.000000061035156,
        ),),
                ),
              ],
            ),
          ),

          //email , password textField and rememberForget text here
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,),
                      child: richText(18),
                    ),
                  ],
                ),
                CustomAuthTextField(controller: emailController, hintText: "Enter your email", icon: Icons.email_outlined, secondaryColor: secondaryColor,),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomAuthTextField(controller: passController, hintText: "Enter your password", icon: Icons.lock_outline, secondaryColor: secondaryColor, obscureText: true,),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomAuthTextField(controller: passController, hintText: "Confirm your password", icon: Icons.lock_outline, secondaryColor: secondaryColor, obscureText: true,),
                SizedBox(
                  height: size.height * 0.01,
                ),

                  Text.rich(
                              TextSpan(
                                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  color: Colors.black,
                                ),
                                children: const [
                  TextSpan(
                    text: 'By registering, you agree to our',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: ' Terms and Conditions',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
              ],
            ),
          ),

          //sign in button, 'don't have account' text and social button here
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingButton(text: 'Register', size: size, isLoading: isLoading, onPressed: () {
                            Get.offAllNamed(UserSelectionScreen.routeName);
                }, ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget logo(double height_, double width_) {
    return SvgPicture.asset(
      'assets/svgs/fnf_plain_logo.svg',
      height: height_,
      width: width_,
    );
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: fontSize,
          color: const Color(0xFF004AA1),
          letterSpacing: 2.000000061035156,
        ),
        children: const [
          TextSpan(
            text: 'SELF',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'REGISTER',
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  
  Widget buildFooter(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.03),
      child: InkWell(
        onTap: () {
          Get.toNamed(SignIn.routeName);
        },
        child: Text.rich(
          TextSpan(
            style: GoogleFonts.inter(
              fontSize: 12.0,
              color: Colors.black,
            ),
            children: const [
              TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'Sign In here',
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
