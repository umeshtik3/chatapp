import 'package:chatapp/controllers/signup_controller.dart';
import 'package:chatapp/utilities/app_constants.dart';
import 'package:chatapp/widgets/common/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/size_config.dart';
import 'common/signup_form.dart';
import 'common/bottom_bar_button_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final SignUpController signUpController = Get.put(SignUpController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        appBar: AppBar(),
      ),
      body: Column(
        mainAxisAlignment: AppConstants.mainAxisAlignmentEnd,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 8,
            ),
            child: Column(
              crossAxisAlignment: AppConstants.crossAxisAlignmentStart,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hello ',
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Beautiful,',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal! * 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                    ],
                  ),
                ),
                Text(
                  'Enter your information below or login with your social account',
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal! * 6,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          SignUpForm(
            signUpController: signUpController,
          ),
          BottomBarButtonWidget(
            signUpController: signUpController,
            isLoginScreen: false,
          )
        ],
      ),
    );
  }
}
