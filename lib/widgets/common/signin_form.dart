import 'package:chatapp/widgets/common/social_media_logo_auth.dart';
import 'package:flutter/material.dart';

import '../../controllers/signin_controller.dart';
import '../../utilities/size_config.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
    required this.signInController,
    this.isLoginScreen,
  }) : super(key: key);

  final SignInController signInController;
  final bool? isLoginScreen;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal! * 8,
          vertical: SizeConfig.blockSizeVertical! * 15,
        ),
        child: Form(
            key: signInController.signInFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                    controller: signInController.signInemailController,
                    validator: (value) =>
                        signInController.emailValidationChecker(value!),
                    onSaved: (value) =>
                        signInController.signInemailController.text = value!,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(label: Text('Email Address'))),
                TextFormField(
                    obscureText: true,
                    controller: signInController.signInpasswordController,
                    validator: (value) =>
                        signInController.passwordValidationChecker(value!),
                    onSaved: (value) =>
                        signInController.signInpasswordController.text = value!,
                    decoration: const InputDecoration(label: Text('Password'))),
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeHorizontal! * 3),
                  child:
                      SocialMediaLogoAuth(signInController: signInController),
                ),
              ],
            )));
  }
}
