import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utilities/validations.dart';
import '../widgets/homepage.dart';

class SignInController extends GetxController {
  static SignInController to = Get.find();
  late TextEditingController signInemailController;
  late TextEditingController signInpasswordController;

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  Future<User?> currentUser() async {
    return auth.currentUser;
  }

  @override
  void onInit() {
    signInemailController = TextEditingController();
    signInpasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    signInemailController.dispose();
    signInpasswordController.dispose();
  }

  String? emailValidationChecker(String value) {
    return Validations.emailValidations(value);
  }

  String? passwordValidationChecker(String value) {
    // ignore: avoid_print
    print('pass');
    return Validations.passwordValidations(value);
  }

  void isSignInFormValidate() {
    final isValid = signInFormKey.currentState!.validate();
    if (isValid) {
      // ignore: avoid_print
      print('signin');
    }
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
}
