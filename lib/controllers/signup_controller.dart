import 'package:chatapp/utilities/validations.dart';
import 'package:chatapp/widgets/homepage.dart';
import 'package:chatapp/widgets/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpController extends GetxController {
  static SignUpController to = Get.find();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  var isLoginSelected = false.obs;
  GoogleSignInAccount? get user => _user;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future googleLogin() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await auth.signInWithCredential(credential);
    Get.to(() => HomePage(
          user: auth.currentUser,
        ));
  }

  void signUpWithGoogle() {
    if (emailController.text != '' && passwordController.text != '') {
      auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Get.to(() => HomePage(
            user: auth.currentUser,
          ));
    }
  }

  void signInWithGoogle() {
    if (emailController.text != '' && passwordController.text != '') {
      auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Get.to(() => HomePage(
            user: auth.currentUser,
          ));
    }
  }

  void isLoginScreen(bool isLogin) {
    isLoginSelected(isLogin);
  }

  String? emailValidationChecker(String value) {
    return Validations.emailValidations(value);
  }

  String? passwordValidationChecker(String value) {
    return Validations.passwordValidations(value);
  }

  String? passwordAgainChecker(String value) {
    if (value != passwordController.text) {
      return 'password does not match';
    }
    return null;
  }

  void isSignUpFormValidate() {
    final isValid = signUpFormKey.currentState!.validate();
    if (isValid) {
      // ignore: avoid_print
      print('hello');
    }
  }

  void logout() {
    _googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
    Get.to(() => const Login());
  }
}
