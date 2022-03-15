import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/validations.dart';

class SignInController extends GetxController {
  static SignInController to = Get.find();
  late TextEditingController signInemailController;
  late TextEditingController signInpasswordController;
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    signInemailController = TextEditingController();
    signInpasswordController = TextEditingController();
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
}
