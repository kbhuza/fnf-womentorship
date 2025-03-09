import 'package:fnf_womentorship/src/pages/authentication/forgot_password.dart';
import 'package:fnf_womentorship/src/pages/authentication/register.dart';
import 'package:fnf_womentorship/src/pages/authentication/sign_in.dart';
import 'package:fnf_womentorship/src/pages/profile/profile_page.dart';
import 'package:fnf_womentorship/src/pages/profile/user_selection.dart';
import 'package:fnf_womentorship/src/pages/splashscreen/splash_screen.dart';
import 'package:fnf_womentorship/src/pages/language/select_language_page.dart';
import 'package:get/get.dart';


class AppRoutes{
  static List<GetPage>routes()=>[
    
        GetPage(name: "/", page: ()=> const SplashScreen()),
        GetPage(name: SignIn.routeName, page: ()=> SignIn()),
        GetPage(name: Register.routeName, page: ()=> Register()),
        GetPage(name: ForgotPassword.routeName, page: ()=> ForgotPassword()),
        GetPage(name: UserSelectionScreen.routeName, page: ()=> const UserSelectionScreen()),
        GetPage(name: ProfilePage.routeName, page: ()=> ProfilePage()),
        GetPage(name: SelectLanguagePage.routeName, page: () => SelectLanguagePage()),
      ];
}
