import 'package:chatapp/utilities/size_config.dart';
import 'package:chatapp/utilities/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/signin_controller.dart';
import '../../controllers/signup_controller.dart';

class BottomBarButtonWidget extends StatelessWidget {
  const BottomBarButtonWidget({
    Key? key,
    this.isLoginScreen,
  }) : super(key: key);


  final bool? isLoginScreen;
  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    final SignInController signInController = Get.put(SignInController());

    SizeConfig().init(context);
    return SizedBox(
      width: SizeConfig.screenWidth!,
      height: SizeConfig.blockSizeVertical! * 6,
      child: Stack(
        fit: StackFit.expand,
       
        children: [
          Positioned(
            child: SafeArea(
              child: Container(
                width: SizeConfig.screenWidth!,
                decoration: const BoxDecoration(color: Style.lightGrey),
              ),
            ),
          ),
          Positioned(
            right: SizeConfig.blockSizeHorizontal! * 10,
            top: SizeConfig.blockSizeVertical! * -3,
            child: InkWell(
              onTap: () {
                // ignore: avoid_print
                print('Bottom Bar button is pressed');
                isLoginScreen!
                    ? signInController.isSignInFormValidate()
                    : signUpController.isSignUpFormValidate();
              },
              child: Container(
                width: SizeConfig.blockSizeHorizontal! * 18,
                height: SizeConfig.blockSizeVertical! * 6,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color:
                        isLoginScreen! ? Style.musturdYellow : Style.sunsetRed),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Style.basicWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
