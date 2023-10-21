import 'package:chatapp/widgets/common/social_media_logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/signup_controller.dart';
import '../../utilities/size_config.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());

    SizeConfig().init(context);

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal! * 8,
          vertical: SizeConfig.blockSizeVertical! * 15,
        ),
        child: Form(
            key: signUpController.signUpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                    controller: signUpController.emailController,
                    validator: (value) =>
                        signUpController.emailValidationChecker(value!),
                    onSaved: (value) =>
                        signUpController.emailController.text = value!,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(label: Text('Email Address'))),
                TextFormField(
                    obscureText: true,
                    controller: signUpController.passwordController,
                    validator: (value) =>
                        signUpController.passwordValidationChecker(value!),
                    onSaved: (value) =>
                        signUpController.passwordController.text = value!,
                    decoration: const InputDecoration(label: Text('Password'))),
                TextFormField(
                    obscureText: true,
                    validator: (value) =>
                        signUpController.passwordAgainChecker(value!),
                    decoration:
                        const InputDecoration(label: Text('Password Again'))),
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeHorizontal! * 3),
                  child: SocialMediaLogoAuth(
                      signUpController: signUpController, isLoginScreen: false
                      ),
                ),
              ],
            )));
 
  }
}
