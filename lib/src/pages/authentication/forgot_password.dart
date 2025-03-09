import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fnf_womentorship/configs/themes/app_light_theme.dart';
import 'package:fnf_womentorship/src/components/custom_auth_text_field.dart';
import 'package:fnf_womentorship/src/components/loading_button.dart';
import 'package:fnf_womentorship/src/pages/authentication/sign_in.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatelessWidget {
   ForgotPassword({super.key});

  static const String routeName = "/forgot-password";

  final TextEditingController emailController = TextEditingController();

    var isLoading = false.obs;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(backgroundColor: Colors.transparent, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () { Get.back(); },), ),
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
      height: size.height * 0.5,
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
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(size.height / 6, size.height / 6),
                // SizedBox(
                //   height: size.height * 0.02,
                // ),

              ],
            ),
          ),

          //email , password textField and rememberForget text here
          Expanded(
            flex: 2,
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
              ],
            ),
          ),

          //sign in button, 'don't have account' text and social button here
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //sign in button here
                // signInButton(size),
                LoadingButton(text: 'Forgot Password', size: size, isLoading: isLoading, onPressed: () {}, ),
                
                //don't have account text here
                // SizedBox(
                //   height: size.height * 0.02,
                // ),

                //sign in with google & facebook button here
                // google_facebookButton(size),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget welcomeText() {
    return Center(
      child: Text.rich(
        TextSpan(
          style: GoogleFonts.inter(
            fontSize: 22.0,
            color: Colors.black,
            height: 1.59,
          ),
          children: const [
            TextSpan(
              text: 'Welcome Back',
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: 'Login',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: ' ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: 'for Continue !',
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return SvgPicture.asset(
      'assets/svgs/forgot_password.svg',
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
            text: 'FORGOT',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'PASSWORD',
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
                text: 'You will recieve an email from us ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: '\n Didn`t get email',
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
