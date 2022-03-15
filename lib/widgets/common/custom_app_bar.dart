import 'package:chatapp/utilities/style.dart';
import 'package:chatapp/widgets/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/signup_controller.dart';
import '../login.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const CustomAppBar({Key? key, required this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginController = Get.put(SignUpController());
    bool isLoginScreenSelected = _loginController.isLoginSelected.value;

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              _launchLoginScreen(_loginController);
            },
            child: Text('Login',
                style: TextStyle(
                    color: isLoginScreenSelected ? Colors.black : Colors.grey)),
          ),
          GestureDetector(
            onTap: () {
              _launchSignUpScreen(_loginController);
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: isLoginScreenSelected ? Colors.grey : Colors.black),
            ),
          )
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: Style.sunsetRed),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_rounded,
                color: Colors.white,
              )),
        )
      ],
    );
  }

  void _launchSignUpScreen(SignUpController _loginController) {
    Get.to(() => const SignUp());
    _loginController.isLoginScreen(false);
  }

  void _launchLoginScreen(SignUpController _loginController) {
    Get.to(() => const Login());
    _loginController.isLoginScreen(true);
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
