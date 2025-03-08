import 'package:fnf_womentorship/src/pages/authentication/sign_in.dart';
import 'package:fnf_womentorship/src/pages/splashscreen/splash_screen.dart';
import 'package:get/get.dart';


class AppRoutes{
  static List<GetPage>routes()=>[
    
        GetPage(name: "/", page: ()=> const SplashScreen()),
        GetPage(name: SignIn.routeName, page: ()=> SignIn()),
  ];
}