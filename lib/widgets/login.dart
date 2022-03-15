import 'package:chatapp/controllers/signup_controller.dart';
import 'package:chatapp/utilities/app_constants.dart';
import 'package:chatapp/utilities/size_config.dart';
import 'package:chatapp/utilities/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signin_controller.dart';
import 'common/bottom_bar_button_widget.dart';
import 'common/custom_app_bar.dart';
import 'common/signin_form.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final _signInController = Get.put(SignInController());
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        appBar: AppBar(),
      ),
      body: Column(
        mainAxisAlignment: AppConstants.mainAxisAlignmentEnd,
        crossAxisAlignment: AppConstants.crossAxisAlignmentStart,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back,',
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 12,
                        color: Style.draculaBlack,
                        fontWeight: FontWeight.w400)),
                Text(
                  'Rebecca',
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal! * 11,
                      color: Style.draculaBlack,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SignInForm(
            signInController: _signInController,
            isLoginScreen: true,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal! * 8,
              bottom: SizeConfig.blockSizeVertical! * 3,
            ),
            child: Text('Forgot Password?',
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                    color: Style.draculaBlack,
                    fontWeight: FontWeight.bold)),
          ),
          // bottomBarButton(context, _authController),
          BottomBarButtonWidget(
            signInController: _signInController,
            isLoginScreen: true,
          )
        ],
      ),
    );
  }
}
