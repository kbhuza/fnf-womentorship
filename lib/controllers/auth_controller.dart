import 'package:flutter/widgets.dart';
import 'package:fnf_womentorship/src/pages/authentication/sign_in.dart';
import 'package:get/get.dart';



class AuthController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initAuth();
    });
  }

  // late FirebaseAuth _auth;

  // final _user = Rxn<User>();
  // late Stream<User?>_authStateChanges;

  void initAuth() async{
    await Future.delayed(const Duration(seconds: 2));
    // _auth = FirebaseAuth.instance;
    // _authStateChanges = _auth.authStateChanges();
    // _authStateChanges.listen((User? user) {
    //       _user.value = user;
    // });
    navigateToIntroduction();
  }

  signInWithGoogle() async{
    // final GoogleSignIn _googleSignIn = GoogleSignIn();
    // try{
    //   GoogleSignInAccount? account = await _googleSignIn.signIn();
    //   if(account != null) {
    //     final _authAccount = await account.authentication;
    //     final _credential = GoogleAuthProvider.credential(
    //       idToken: _authAccount.idToken,
    //       accessToken: _authAccount.accessToken
    //     );

    //     await _auth.signInWithCredential(_credential);
    //     await saveUser(account);
    //   }
    // }on Exception catch(error){

    // }
    // User? getUser() {
    //   _user.value = _auth.currentUser;
    //   return _user.value;
    // }
  }
  

  // saveUser(GoogleSignInAccount account) {
  //   userRF.doc(account.email).set({
  //     "email": account.email,
  //     "name": account.displayName,
  //     "profilepic": account.photoUrl
  //   });
  // }

  signOut() async{
    // try{
    // await _auth.signOut(); 
    // print("User Logged Out");
    // } on FirebaseAuthException catch(e) {
    //   print(e);
    // }
  }

  void navigateToIntroduction() {
    Get.offAllNamed(SignIn.routeName);
  }

  // bool isLoggedIn() {
  //   return _auth.currentUser != null;
  // }

  // void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain = false}){
  //   AuthController _authController = Get.find();
  //   Get.toNamed(QuestionsScreen.routeName, arguments: paper);
  // }
}
