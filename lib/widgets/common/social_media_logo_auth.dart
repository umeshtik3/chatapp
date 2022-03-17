import 'package:chatapp/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/signup_controller.dart';
import '../../utilities/app_constants.dart';

class SocialMediaLogoAuth extends StatelessWidget {
  const SocialMediaLogoAuth(
      {Key? key,
      this.signUpController,
      this.signInController,
      this.isLoginScreen})
      : super(key: key);

  final SignUpController? signUpController;
  final SignInController? signInController;
  final bool? isLoginScreen;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: AppConstants.mainAxisAlignmentStart,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(FontAwesomeIcons.facebookF),
        ),
        IconButton(
          onPressed: () {
            isLoginScreen!
                ? signInController!.googleLogin()
                : signUpController!.googleLogin();
          },
          icon: const Icon(FontAwesomeIcons.googlePlusG),
          iconSize: 30,
        )
      ],
    );
  }
}
